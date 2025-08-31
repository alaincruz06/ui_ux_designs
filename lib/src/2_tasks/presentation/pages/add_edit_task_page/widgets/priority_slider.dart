import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ui_ux_designs/src/2_tasks/core/enums.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/controllers/add_edit_task_page_controller.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/colors.dart';
import 'package:ui_ux_designs/src/common/utils/constants.dart';

class PrioritySlider extends StatelessWidget {
  const PrioritySlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: Get.width,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: TaskColors.taskColorTextFieldBg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: GetBuilder<AddEditTaskPageController>(
        builder: (controller) {
          return ToggleButtons(
            borderRadius: BorderRadius.circular(4),
            isSelected: [
              controller.taskPriority == TaskPriority.low,
              controller.taskPriority == TaskPriority.medium,
              controller.taskPriority == TaskPriority.high,
            ],
            fillColor: TaskColors.taskColorButton,
            selectedColor: TaskColors.taskColorTexts,
            color: TaskColors.taskColorTexts,
            children: TaskPriority.values
                .map(
                  (e) => SizedBox(
                    height: 0.05.sh,
                    width: (Get.width - (kpagePadding * 2.9)) /
                        TaskPriority.values.length,
                    child: SizedBox.expand(
                        child: Center(
                            child: Text('app.taskPriority_${e.name}'.tr))),
                  ),
                )
                .toList(),
            onPressed: (priorityIndex) =>
                controller.changePriority(priorityIndex),
          );
        },
      ),
    );
  }
}
