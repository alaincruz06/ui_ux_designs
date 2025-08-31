import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/colors.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/tasks_text_styles.dart';

class AddMembersToTask extends StatelessWidget {
  final Function(Contact?) onContactsSelected;

  const AddMembersToTask({
    super.key,
    required this.onContactsSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Request contact permission
        if (await FlutterContacts.requestPermission()) {
          final contact = await FlutterContacts.openExternalPick();

          if (contact != null) {
            onContactsSelected(contact);
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(0.01.sh),
        height: 0.08.sh,
        width: 0.08.sh,
        decoration: BoxDecoration(
          border: Border.all(
            color: TaskColors.taskColorTexts,
          ),
          color: TaskColors.taskColorTextFieldBg,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_2_outlined,
              color: TaskColors.taskColorTexts,
            ),
            5.verticalSpace,
            Text(
              'app.add'.tr,
              style: tasksTextStyleCaption.copyWith(
                color: TaskColors.taskColorTexts,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
