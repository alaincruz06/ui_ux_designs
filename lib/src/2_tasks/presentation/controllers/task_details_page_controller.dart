import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ui_ux_designs/src/2_tasks/domain/models/task_domain.dart';
import 'package:ui_ux_designs/src/2_tasks/domain/repository/tasks_repository.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/colors.dart';
import 'package:ui_ux_designs/src/common/utils/aux_functions.dart';

class TaskDetailsPageController extends GetxController {
  TaskDetailsPageController({
    required this.tasksRepository,
    required this.logger,
  });

  final TasksRepository tasksRepository;
  final Logger logger;
  TaskDomain? taskDomain;
  Color taskColor = TaskColors().tasksColors.first;
  bool expandDescription = false;
  //onInit + onClose

  @override
  Future<void> onInit() async {
    taskDomain = Get.arguments['task'] as TaskDomain;
    taskColor = AuxFunctions.hexToColor(
      taskDomain!.color!,
    );
    update();
    super.onInit();
  }

  //Functions
  Future<void> shareTask() async {
    //
  }

  void expandDescriptionToggle() {
    expandDescription = !expandDescription;
    update();
  }
}
