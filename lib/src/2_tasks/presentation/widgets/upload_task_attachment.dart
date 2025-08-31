import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/colors.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/theme/tasks_text_styles.dart';

class UploadTaskAttachment extends StatefulWidget {
  final Function(List<PlatformFile?>) onFileSelected;

  const UploadTaskAttachment({super.key, required this.onFileSelected});

  @override
  State<UploadTaskAttachment> createState() => _UploadTaskAttachmentState();
}

class _UploadTaskAttachmentState extends State<UploadTaskAttachment> {
  List<PlatformFile?> selectedFiles = [];

  Future<void> _pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.any,
    );

    if (result != null) {
      setState(() {
        selectedFiles = result.files.map((file) => file).toList();
      });
      widget.onFileSelected(selectedFiles);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickFiles,
      child: Container(
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
              Icons.attach_file,
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
