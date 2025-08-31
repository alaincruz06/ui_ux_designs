import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:ui_ux_designs/src/2_tasks/core/enums.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/controllers/add_edit_task_page_controller.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/pages/add_edit_task_page/widgets/combined_date_fields_for_task.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/pages/add_edit_task_page/widgets/combined_text_fields_for_task.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/pages/add_edit_task_page/widgets/priority_slider.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/pages/add_edit_task_page/widgets/task_type_widget.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/colors.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/tasks_text_styles.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/widgets/add_members_to_task.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/widgets/upload_task_attachment.dart';
import 'package:ui_ux_designs/src/common/app/theme/text_styles.dart';
import 'package:ui_ux_designs/src/common/presentation/widgets/text_with_tap.dart';
import 'package:ui_ux_designs/src/common/utils/constants.dart';

class AddEditTaskPage extends StatelessWidget {
  const AddEditTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: TaskColors.taskColorBg,
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
                    //Fake AppBar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWithTap(
                          text: 'app.cancel'.tr,
                          textStyle: tasksTextStyleBody.copyWith(
                            color: TaskColors.taskColorButton,
                            fontWeight: FontWeight.bold,
                          ),
                          onTap: () => Get.back(),
                        ),
                        Text(
                          controller.isEdit
                              ? 'app.editTask'.tr
                              : 'app.addTask'.tr,
                          style: tasksTextStyleBodyBold.copyWith(
                            color: TaskColors.taskColorTexts,
                          ),
                        ),
                        TextWithTap(
                          text: 'app.done'.tr,
                          textStyle: tasksTextStyleBody.copyWith(
                            color: TaskColors.taskColorButton,
                            fontWeight: FontWeight.bold,
                          ),
                          onTap: () => controller.addEditTask(),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    //Body
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TaskTypeWidget(
                          title: 'app.event'.tr,
                          index: 0,
                          icon: Icons.check_box_rounded,
                          controller: controller,
                        ),
                        TaskTypeWidget(
                          title: 'app.birthday'.tr,
                          index: 1,
                          icon: Icons.cake_rounded,
                          controller: controller,
                        ),
                        TaskTypeWidget(
                          title: 'app.countdown'.tr,
                          index: 2,
                          icon: Icons.timer,
                          controller: controller,
                        ),
                      ],
                    ),
                    CombinedTextFieldsForTask(
                      title: 'app.title'.tr,
                      textEditingController: controller.titleController,
                    ),
                    if (controller.taskTypeIndex == 0)
                      CombinedTextFieldsForTask(
                        title: 'app.description'.tr,
                        textEditingController: controller.descriptionController,
                        maxLines: 5,
                      ),

                    if (controller.taskTypeIndex == 0)
                      SwitchListTile(
                        title: Text(
                          'app.allDay'.tr,
                          style: textStyleBody.apply(
                            color: TaskColors.taskColorTexts,
                          ),
                        ),
                        activeColor:
                            TaskColors.taskColorButton.withOpacity(0.5),
                        inactiveTrackColor:
                            TaskColors.taskColorButton.withOpacity(0.5),
                        value: controller.isAllDayEvent,
                        onChanged: (bool value) =>
                            controller.updateIsAllDayEvent(value),
                      ),
                    if (controller.taskTypeIndex == 0) ...[
                      CombinedDateFieldsForTask(
                        title: 'app.startDate'.tr,
                        isAllDayEvent: controller.isAllDayEvent,
                        dateTime: controller.startDate,
                        onTap: controller.updateStartDate,
                      ),
                      CombinedDateFieldsForTask(
                        title: 'app.endDate'.tr,
                        isAllDayEvent: controller.isAllDayEvent,
                        dateTime: controller.endDate,
                        onTap: controller.updateEndDate,
                      ),
                    ],
                    if (controller.taskTypeIndex != 0)
                      CombinedDateFieldsForTask(
                        title: 'app.date'.tr,
                        isAllDayEvent: true,
                        dateTime: controller.startDate,
                        onTap: controller.updateStartDate,
                      ),
                    10.verticalSpace,
                    ListTile(
                      onTap: () => controller.manageRepetition(),
                      title: Text(
                        'app.repetition'.tr,
                        style: textStyleBody.apply(
                          color: TaskColors.taskColorTexts,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            controller.getTaskRepetitionName(
                                controller.taskRepetition.name),
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ),
                    ),
                    if (controller.taskRepetition != TaskRepetition.none)
                      ListTile(
                        title: Text(
                          'app.stopRepetitionAfter'.tr,
                          style: textStyleBody.apply(
                            color: TaskColors.taskColorTexts,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'app.xTimes'.trParams({
                                'amount':
                                    controller.stopRepetitionAfter.toString()
                              }),
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded),
                          ],
                        ),
                      ),
                    10.verticalSpace,
                    Text(
                      'app.priority'.tr,
                      style: textStyleBody.apply(
                        color: TaskColors.taskColorTexts,
                      ),
                    ),
                    5.verticalSpace,
                    const PrioritySlider(),
                    10.verticalSpace,
                    ListTile(
                      title: Text(
                        'app.color'.tr,
                        style: textStyleBody.apply(
                          color: TaskColors.taskColorTexts,
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: () => controller.changeColor(),
                          icon: Container(
                            height: 0.04.sh,
                            width: 0.04.sh,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.taskColor),
                          )),
                    ),
                    12.verticalSpace,
                    Text(
                      'app.members'.tr,
                      style: textStyleBody.apply(
                        color: TaskColors.taskColorTexts,
                      ),
                    ),
                    5.verticalSpace,
                    Wrap(
                      children: [
                        AddMembersToTask(
                          onContactsSelected: (p0) =>
                              controller.handleContacts(p0),
                        ),
                        ...controller.members.map((contact) => Padding(
                              padding: EdgeInsets.only(
                                  bottom: 0.04.sw,
                                  right: 0.04.sw,
                                  left: controller.members[0] == contact
                                      ? 0.04.sw
                                      : 0),
                              child: SizedBox(
                                height: 0.11.sh,
                                width: 0.11.sh,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 0.08.sh,
                                      width: 0.08.sh,
                                      decoration: BoxDecoration(
                                        image: contact.photoOrThumbnail != null
                                            ? DecorationImage(
                                                image: MemoryImage(
                                                    contact.photoOrThumbnail!))
                                            : null,
                                        border: Border.all(
                                          color: TaskColors.taskColorTexts,
                                        ),
                                        color: TaskColors.taskColorTextFieldBg,
                                      ),
                                      child: contact.photoOrThumbnail != null
                                          ? null
                                          : Icon(
                                              Icons.person_2_outlined,
                                              color: TaskColors.taskColorTexts,
                                            ),
                                    ),
                                    6.verticalSpace,
                                    Text(
                                      contact.displayName,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: tasksTextStyleCaption.copyWith(
                                        color: TaskColors.taskColorTexts,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                    12.verticalSpace,
                    Text(
                      'app.attachments'.tr,
                      style: textStyleBody.apply(
                        color: TaskColors.taskColorTexts,
                      ),
                    ),
                    5.verticalSpace,
                    Wrap(
                      children: [
                        UploadTaskAttachment(
                          onFileSelected: (p0) => controller.addAttachments(p0),
                        ),
                        ...controller.filesAttached.map((file) => Padding(
                              padding: EdgeInsets.only(
                                  bottom: 0.04.sw,
                                  right: 0.04.sw,
                                  left: controller.filesAttached[0] == file
                                      ? 0.04.sw
                                      : 0),
                              child: Container(
                                height: 0.08.sh,
                                width: 0.08.sh,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: TaskColors.taskColorTexts,
                                  ),
                                  color: TaskColors.taskColorTextFieldBg,
                                ),
                                child: getFileIcon(file),
                              ),
                            ))
                      ],
                    ),
                    20.verticalSpace,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget getFileIcon((String, PlatformFile) file) {
  IconData iconData = Icons.insert_drive_file;
  switch (file.$1) {
    case 'image':
      iconData = Icons.image;
      break;
    case 'video':
      iconData = Icons.video_camera_back_rounded;
      break;
    case 'text':
      iconData = Icons.text_fields_sharp;
      break;
    case 'audio':
      iconData = Icons.audio_file;
      break;
    default:
      iconData = Icons.file_present_rounded;
  }

  return Icon(
    iconData,
    color: TaskColors.taskColorTexts,
  );
}
