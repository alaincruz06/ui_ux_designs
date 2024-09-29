import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ux_designs/src/common/utils/dialog_helper.dart';

void showSnackBarMessage(
  String message,
  BuildContext context,
) {
  ScaffoldMessenger.of(context).clearSnackBars();
  DialogHelper.showSnackBar(
    body: Text(
      message,
      style: TextStyle(color: Get.theme.colorScheme.surface),
    ),
    duration: const Duration(seconds: 2),
    context: context,
  );
}
