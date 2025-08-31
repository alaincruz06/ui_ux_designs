import 'dart:io';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:ui_ux_designs/src/2_tasks/core/enums.dart';
import 'package:ui_ux_designs/src/2_tasks/core/tasks_utils.dart';
import 'package:ui_ux_designs/src/2_tasks/domain/models/task_domain.dart';
import 'package:ui_ux_designs/src/2_tasks/domain/repository/tasks_repository.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/colors.dart';
import 'package:ui_ux_designs/src/common/app/routes/app_pages.dart';
import 'package:ui_ux_designs/src/common/presentation/widgets/loading_overlay.dart';
import 'package:ui_ux_designs/src/common/utils/aux_functions.dart';

class AddEditTaskPageController extends GetxController {
  AddEditTaskPageController({
    required this.tasksRepository,
    required this.logger,
  });

  //Params
  final TasksRepository tasksRepository;
  final Logger logger;
  TaskDomain? taskDomain;
  bool isEdit = false;

  //Tasks fields
  Color taskColor = TaskColors().tasksColors.first;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  //Dates
  bool isAllDayEvent = false;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(hours: 1));
  DateTime tempStartDate = DateTime.now();
  DateTime tempEndDate = DateTime.now();
  //Enums
  int taskTypeIndex = 0; //event -> index == 0
  TaskRepetition taskRepetition = TaskRepetition.none;
  TaskStatus taskStatus = TaskStatus.notStarted;
  TaskPriority taskPriority = TaskPriority.low;
  int stopRepetitionAfter = 0;

  //Members
  List<Map<String, dynamic>> previousMembers = [];
  List<Contact> members = [];

  //Attachments
  List<String> previouslyAttachedFilesPaths = [];
  List<String> previouslyAttachedFilesMimeTypes = [];
  List<(String, PlatformFile)> filesAttached = [];
  List<String> filesAttachedPaths = [];

  //Form validation
  final addEditTaskFormKey = GlobalKey<FormState>();
  final RxBool isFormStateError = false.obs;
  //onInit + onClose

  @override
  Future<void> onInit() async {
    if (Get.arguments != null) {
      taskDomain = Get.arguments['task'] as TaskDomain?;
      if (taskDomain != null) {
        isEdit = true;
        taskColor = AuxFunctions.hexToColor(
          taskDomain!.color!,
        );
        //TextControllers
        titleController.text = taskDomain!.title ?? '';
        descriptionController.text = taskDomain!.description ?? '';
        //AllDay
        isAllDayEvent = taskDomain!.type == TaskType.birthday ||
            taskDomain!.type == TaskType.countdown;
        //Enums
        taskPriority = taskDomain!.priority;
        taskStatus = taskDomain!.status;
        taskRepetition = taskDomain!.repetition;
        taskTypeIndex = TaskType.values.indexOf(taskDomain!.type);
        //Contacts - Files
        if (taskDomain!.membersNames != null &&
            taskDomain!.membersNames!.isNotEmpty) {
          for (int i = 0; i < taskDomain!.membersNames!.length; i++) {
            previousMembers.add({
              'name': taskDomain!.membersNames![i],
              'photo': taskDomain!.membersPhotos![i],
            });
          }
        }

        previouslyAttachedFilesPaths = taskDomain!.attachmentsPaths ?? [];
        previouslyAttachedFilesMimeTypes =
            taskDomain!.attachmentsMimeTypes ?? [];
        update();
      }
    }
    super.onInit();
  }

  void updateStartDate() async {
    DateTime newDateTime = DateTime.now();
    await showAdaptiveDialog(
      context: Get.context!,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        insetPadding: EdgeInsets.only(
          left: 0.02.sh,
          right: 0.02.sh,
          top: 0.30.sh,
          bottom: 0.34.sh,
        ),
        child: SfDateRangePicker(
          onSelectionChanged: (DateRangePickerSelectionChangedArgs
              dateRangePickerSelectionChangedArgs) {
                dateRangePickerSelectionChangedArgs.
            Get.back();
          },
        ),
      ),
    );

    //Update with newly selected DateTime
    startDate = newDateTime;
    tempStartDate = startDate;
    update();
  }

  void updateEndDate() {
    // Future<void> updateEndDate(BuildContext context) async {
    //TODO with datePicker
    DateTime newDateTime = DateTime.now();

    //Update with newly selected DateTime
    endDate = newDateTime;
    tempEndDate = endDate;
    update();
  }

  void updateIsAllDayEvent(bool newIsAllDayEvent) {
    isAllDayEvent = newIsAllDayEvent;
    if (newIsAllDayEvent) {
      tempStartDate = startDate;
      tempEndDate = endDate;
      startDate = TasksUtils().resetTime(startDate);
      endDate = startDate.copyWith(
        hour: 23,
        minute: 59,
        second: 59,
      );
    } else {
      startDate = tempStartDate;
      endDate = tempEndDate;
    }

    update();
  }

  void changeEvent(int index) {
    if (index != taskTypeIndex) {
      taskTypeIndex = index;
      isAllDayEvent = taskTypeIndex != 0;
      update();
    }
  }

  void changeColor() {
    Color newColor;
    if (taskColor == TaskColors().tasksColors.last) {
      newColor = TaskColors().tasksColors.first;
    } else {
      newColor = TaskColors()
          .tasksColors[TaskColors().tasksColors.indexOf(taskColor) + 1];
    }
    taskColor = newColor;
    update();
  }

  void changePriority(int priorityIndex) {
    if (priorityIndex != TaskPriority.values.indexOf(taskPriority)) {
      taskPriority = TaskPriority.values[priorityIndex];
      update();
    }
  }

  String getTaskRepetitionName(String taskRep) {
    switch (taskRep) {
      case 'weekly':
        return 'app.taskRepetition_weekly'.trParams(
            {'day': 'app.${DateFormat('EEEE').format(startDate)}'.tr});
      case 'yearly':
        return 'app.taskRepetition_yearly'.trParams({
          'selectedDate': 'app.selectedDate'.trParams(
            {
              'day': 'app.${DateFormat('EEEE').format(startDate)}'.tr,
              'month': 'app.${DateFormat.MMMM().format(startDate)}'.tr,
            },
          ),
        });
      default:
        return 'app.taskRepetition_$taskRep'.tr;
    }
  }

  void handleContacts(Contact? contactSelected) async {
    if (contactSelected != null && !members.contains(contactSelected)) {
      members.add(contactSelected);
      update();
    }
  }

  Future<void> manageRepetition() async {
    await Get.toNamed(
      Routes.frequencyTask,
    );
  }

  void changeRepetition(TaskRepetition taskRep) {
    if (taskRep != taskRepetition) {
      taskRepetition = taskRep;
      stopRepetitionAfter = 1;
    }
    update();
  }

  void addAttachments(List<PlatformFile?> selectedFiles) {
    for (var file in selectedFiles) {
      if (file != null && filesAttached.every((e) => e.$2.path != file.path)) {
        filesAttached.add((TasksUtils().getMimeType(file.path!), file));
      }
    }
    update();
  }

  //Functions
  Future<void> addEditTask() async {
    try {
      LoadingOverlay.show();

      if (filesAttached.isNotEmpty) {
        // Get app's directory
        Directory appDir = await getApplicationDocumentsDirectory();
        for (var fileAt in filesAttached) {
          PlatformFile platformFile = fileAt.$2;
          String fileName = platformFile.name;
          String newPath = "${appDir.path}/$fileName";

          // Copy the file to the app's directory
          File file = File(platformFile.path!);
          File newFile = await file.copy(newPath);

          // Return the new file path
          filesAttachedPaths.add(newFile.path);
        }
      }

      if (isEdit) {
        taskDomain!.activity!
            .add('app.editedTask:${DateTime.now().toIso8601String()}/');
      }

      taskDomain = TaskDomain(
        title: titleController.text,
        description: descriptionController.text,
        color: AuxFunctions.colorToHex(taskColor),
        startDate: startDate,
        endDate: endDate,
        createdDate: isEdit ? taskDomain!.createdDate : DateTime.now(),
        editedDate: DateTime.now(),
        type: TaskType.values[taskTypeIndex],
        priority: taskPriority,
        repetition: taskRepetition,
        status: taskStatus,
        membersNames: members.map((e) => e.displayName).toList(),
        membersPhotos: members.map((e) => e.photoOrThumbnail).toList(),
        //TODO
        // reminders: reminders,
        attachmentsPaths: filesAttachedPaths,
        attachmentsMimeTypes: filesAttached.map((e) => e.$1).toList(),
        activity: isEdit
            ? taskDomain!.activity!
            : [
                'app.createdTask:${DateTime.now().toIso8601String()}/',
              ],
      );

      await tasksRepository.createOrEditTask(taskDomain: taskDomain!);

      Get.back();
      LoadingOverlay.hide();
    } catch (error) {
      LoadingOverlay.hide();
      logger.e('Error at addEditTask: $error');
    }
  }
}
