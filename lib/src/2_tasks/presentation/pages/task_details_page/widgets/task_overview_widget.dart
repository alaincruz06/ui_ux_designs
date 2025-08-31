import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/controllers/task_details_page_controller.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/colors.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/tasks_text_styles.dart';
import 'package:ui_ux_designs/src/common/app/theme/colors.dart';

class TaskOverviewWidget extends StatelessWidget {
  const TaskOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskDetailsPageController>(
      builder: (controller) {
        return Container(
          color: TaskColors.taskColorBg,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.verticalSpace,
                _DescriptionWidget(
                  controller: controller,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    required this.controller,
  });

  final TaskDetailsPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'app.description'.tr,
          overflow: TextOverflow.ellipsis,
          style: tasksTextStyleBodyBold.copyWith(
            color: AppColors.grey100,
          ),
          maxLines: 1,
        ),
        10.verticalSpace,
        LayoutBuilder(
          builder: (_, constraints) {
            final String description = controller.taskDomain!.description ?? '';

            final span = TextSpan(
              text: description,
              style: tasksTextStyleSmallBody.copyWith(
                color: AppColors.grey100,
              ),
            );
            final tp =
                TextPainter(text: span, textDirection: TextDirection.ltr);
            tp.layout(maxWidth: constraints.maxWidth);
            final numLines = tp.computeLineMetrics().length;

            return Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Text(
                      description,
                      style: tasksTextStyleSmallBody.copyWith(
                        color: AppColors.grey100,
                      ),
                      textAlign: TextAlign.start,
                      maxLines: controller.expandDescription ? null : 4,
                    ),
                    if (!controller.expandDescription && numLines >= 4)
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              TaskColors.taskColorBg,
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            tileMode: TileMode.decal,
                          ),
                        ),
                      ),
                  ],
                ),
                if (controller.expandDescription) 10.verticalSpace,
                if (numLines >= 4)
                  InkWell(
                    onTap: () => controller.expandDescriptionToggle(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          controller.expandDescription
                              ? Icons.keyboard_arrow_up_sharp
                              : Icons.keyboard_arrow_down_sharp,
                          color: controller.taskColor,
                        ),
                        Text(
                          controller.expandDescription
                              ? 'app.readLess'.tr
                              : 'app.readMore'.tr,
                          style: tasksTextStyleSmallBody.copyWith(
                            color: controller.taskColor,
                          ),
                        )
                      ],
                    ),
                  )
              ],
            );
          },
        ),
      ],
    );
  }
}
