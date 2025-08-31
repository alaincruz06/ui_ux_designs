import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/controllers/task_details_page_controller.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/colors.dart';

class TaskActivityWidget extends StatelessWidget {
  const TaskActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskDetailsPageController>(
      builder: (controller) {
        return Container(
          color: TaskColors.taskColorBg,
        );
      },
    );
  }
}
