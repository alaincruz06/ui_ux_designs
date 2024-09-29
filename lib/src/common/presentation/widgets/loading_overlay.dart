import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:ui_ux_designs/src/common/app/theme/colors.dart';

class LoadingOverlay {
  static GlobalLoaderOverlay buildGlobal(Widget appWidget) {
    return GlobalLoaderOverlay(
      overlayColor: Colors.transparent,
      useDefaultLoading: false,
      overlayWidgetBuilder: (progress) => Container(
        color: Colors.white.withOpacity(0.5),
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.primary500,
          ),
        ),
      ),
      child: appWidget,
    );
  }

  static void show({BuildContext? context}) {
    BuildContext safeContext = context ?? Get.context!;
    safeContext.loaderOverlay.show();
  }

  static bool isShowing({BuildContext? context}) {
    BuildContext safeContext = context ?? Get.context!;
    return safeContext.loaderOverlay.visible;
  }

  static void hide({BuildContext? context}) {
    BuildContext safeContext = context ?? Get.context!;
    safeContext.loaderOverlay.hide();
  }
}
