import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:ui_ux_designs/src/2_tasks/core/tasks_utils.dart';
import 'package:ui_ux_designs/src/2_tasks/domain/models/task_domain.dart';
import 'package:ui_ux_designs/src/2_tasks/domain/repository/tasks_repository.dart';
import 'package:ui_ux_designs/src/common/app/routes/app_pages.dart';

class TasksHomePageController extends GetxController {
  TasksHomePageController({
    required this.tasksRepository,
    required this.logger,
  });

  final TasksRepository tasksRepository;
  final Logger logger;

  final AdvancedCalendarController advancedCalendarController =
      AdvancedCalendarController.today();
  final List<TaskDomain> monthlyTasks = [];
  final List<DateTime> events = [];
  final List<TaskDomain> dailyTasks = [];

  //onInit + onClose

  @override
  Future<void> onInit() async {
    advancedCalendarController.addListener(changeDate);
    await getTasksByMonth(
      dateTime: DateTime.now(),
    );
    super.onInit();
  }

  @override
  void onClose() {
    advancedCalendarController.dispose();
    super.onClose();
  }

  //Functions

  Future<void> changeDate() async {
    final DateTime newDateTime = advancedCalendarController.value;
    if (newDateTime.month != monthlyTasks.first.startDate!.month) {
      await getTasksByMonth(dateTime: newDateTime);
    }
    getTasksByDate(dateTime: newDateTime);
  }

  Future<void> getTasksByMonth({
    required DateTime dateTime,
  }) async {
    final editedDateTime = TasksUtils().resetTimeForMonth(dateTime);
    final tempTasks = await tasksRepository.getTasksListForGivenMonth(
      dateTime: editedDateTime,
    );
    monthlyTasks.assignAll(tempTasks);
    getTasksByDate(dateTime: dateTime);
    getMonthlyEvents();
    update();
  }

  void getTasksByDate({
    required DateTime dateTime,
  }) {
    final editedDateTime = TasksUtils().resetTime(dateTime);
    List<TaskDomain> tempTasks = monthlyTasks
        .where((task) =>
            task.startDate!.day <= editedDateTime.day &&
            task.endDate!.day >= editedDateTime.day)
        .toList();
    dailyTasks.assignAll(tempTasks);
    update();
  }

  void getMonthlyEvents() {
    Set<DateTime> tempEvents = <DateTime>{};

    for (TaskDomain task in monthlyTasks) {
      final editedStartDateTime = TasksUtils().resetTime(task.startDate!);
      final editedEndDateTime = TasksUtils().resetTime(task.endDate!);
      tempEvents.addAll(
        TasksUtils().getDatesBetween(
          editedStartDateTime,
          editedEndDateTime,
        ),
      );
    }

    events.assignAll(tempEvents);
  }

  Future<void> shareTask(TaskDomain task) async {
    //
  }

  Future<void> openTask(TaskDomain task) async {
    await Get.toNamed(
      Routes.taskDetails,
      arguments: {
        'task': task,
      },
    );
  }

  Future<void> createTask() async {
    await Get.toNamed(
      Routes.addEditTask,
    );
  }
}
