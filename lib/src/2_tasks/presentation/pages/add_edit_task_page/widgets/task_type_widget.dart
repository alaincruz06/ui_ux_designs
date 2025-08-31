import 'package:flutter/material.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/controllers/add_edit_task_page_controller.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/colors.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/tasks_text_styles.dart';

class TaskTypeWidget extends StatelessWidget {
  const TaskTypeWidget({
    super.key,
    required this.title,
    required this.index,
    required this.icon,
    required this.controller,
  });

  final String title;
  final int index;
  final IconData icon;
  final AddEditTaskPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () => controller.changeEvent(index),
          icon: Icon(
            icon,
            color: controller.taskTypeIndex == index
                ? TaskColors.taskColorButton
                : null,
          ),
        ),
        GestureDetector(
          onTap: () => controller.changeEvent(index),
          child: Text(
            title,
            style: tasksTextStyleBody.copyWith(
              color: controller.taskTypeIndex == index
                  ? TaskColors.taskColorButton
                  : TaskColors.taskColorTexts,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
