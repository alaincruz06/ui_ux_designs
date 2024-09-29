import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/services.dart';
import 'package:ui_ux_designs/app.dart';
import 'package:ui_ux_designs/src/common/utils/dependency_injection.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    await ScreenUtil.ensureScreenSize();

    // GoogleMapsConfig.init(DefaultFirebaseOptionsDev.googleMapsApiKey);

    await GetStorage.init();
    await DependencyInjection.init();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then(
      (_) {
        runApp(
          // DevicePreview(
          //   enabled: !kReleaseMode,
          //   builder: (context) =>
          //       const MyApp(activeDevicePreview: true), // Wrap your app
          // ),
          const MyApp(
            activeDevicePreview: false,
          ),
        );
      },
    );
  }, (error, stackTrace) {
    debugPrint('Error fatal en la app: $error / $stackTrace');
  });
}
