import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_ux_designs/src/2_tasks/core/tasks_utils.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/pages/add_edit_task_page/widgets/tasks_details_text_form_field.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/colors.dart';
import 'package:ui_ux_designs/src/common/app/theme/text_styles.dart';

class CombinedDateFieldsForTask extends StatelessWidget {
  const CombinedDateFieldsForTask({
    super.key,
    required this.title,
    required this.isAllDayEvent,
    required this.dateTime,
    required this.onTap,
  });

  final String title;
  final bool isAllDayEvent;
  final DateTime dateTime;
  final VoidCallback onTap;

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
          controller: TextEditingController(
            text: isAllDayEvent
                ? TasksUtils().tasksDateFormatWithoutHours.format(dateTime)
                : TasksUtils().tasksDateFormat.format(dateTime),
          ),
          suffixIcon: IconButton(
            onPressed: onTap,
            icon: Icon(
              Icons.calendar_today_outlined,
              color: TaskColors.taskColorTexts,
            ),
          ),
        ),
      ],
    );
  }
}
