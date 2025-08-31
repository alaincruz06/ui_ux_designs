import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/pages/add_edit_task_page/widgets/tasks_details_text_form_field.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/colors.dart';
import 'package:ui_ux_designs/src/common/app/theme/text_styles.dart';

class CombinedTextFieldsForTask extends StatelessWidget {
  const CombinedTextFieldsForTask({
    super.key,
    required this.title,
    required this.textEditingController,
    this.maxLines,
  });

  final String title;
  final TextEditingController textEditingController;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        Text(
          title,
          style: textStyleBody.apply(
            color: TaskColors.taskColorTexts,
          ),
        ),
        5.verticalSpace,
        TasksDetailsTextFormField(
          controller: textEditingController,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
