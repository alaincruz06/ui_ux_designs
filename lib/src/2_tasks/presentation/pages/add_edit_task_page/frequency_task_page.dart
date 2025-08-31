import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ux_designs/src/2_tasks/core/enums.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/controllers/add_edit_task_page_controller.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/colors.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/tasks_text_styles.dart';
import 'package:ui_ux_designs/src/common/app/theme/text_styles.dart';
import 'package:ui_ux_designs/src/common/utils/constants.dart';

class FrequencyTaskPage extends StatelessWidget {
  const FrequencyTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaskColors.taskColorBg,
      appBar: AppBar(
        backgroundColor: TaskColors.taskColorTextFieldBg,
        foregroundColor: TaskColors.taskColorTexts,
      ),
      body: GetBuilder<AddEditTaskPageController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(
              left: kpagePadding,
              right: kpagePadding,
              top: kpagePadding * 2,
              bottom: kpagePadding / 2,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'app.repetition'.tr,
                    style: tasksTextStyleTitle3.copyWith(
                      color: TaskColors.taskColorTexts,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: TaskRepetition.values.length,
                    itemBuilder: (_, index) => ListTile(
                      onTap: () => controller
                          .changeRepetition(TaskRepetition.values[index]),
                      leading: controller.taskRepetition ==
                              TaskRepetition.values[index]
                          ? Icon(
                              Icons.check,
                              color: TaskColors.taskColorTexts,
                            )
                          : null,
                      title: Text(
                        controller.getTaskRepetitionName(
                            TaskRepetition.values[index].name),
                        style: textStyleBody.copyWith(
                          color: TaskColors.taskColorTexts,
                        ),
                      ),
                      tileColor: controller.taskRepetition ==
                              TaskRepetition.values[index]
                          ? TaskColors.taskColorButton
                          : TaskColors.taskColorTextFieldBg,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
