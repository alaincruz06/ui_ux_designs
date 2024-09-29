import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ui_ux_designs/src/common/app/lang/translation_helper.dart';
import 'package:ui_ux_designs/src/common/app/routes/app_pages.dart';
import 'package:ui_ux_designs/src/common/app/theme/colors.dart';
import 'package:ui_ux_designs/src/common/presentation/widgets/loading_overlay.dart';
import 'package:ui_ux_designs/src/common/utils/constants.dart';
import 'package:ui_ux_designs/src/common/utils/language_controller.dart';
import 'package:ui_ux_designs/src/common/utils/logger/logger_utils.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.activeDevicePreview,
  });

  @override
  State<MyApp> createState() => _MyAppState();

  final bool activeDevicePreview;
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return GetBuilder<LanguageController>(
      builder: (languageController) => ScreenUtilInit(
        minTextAdapt: true,
        builder: (context, widget) => LoadingOverlay.buildGlobal(
          GetMaterialApp(
            useInheritedMediaQuery: this.widget.activeDevicePreview,
            locale: languageController.getLocale,
            translations: TranslationsHelper(),
            localizationsDelegates: const [
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: TranslationsHelper().supportedLocales,
            logWriterCallback: LoggerUtils.write,
            initialRoute: Routes.home,
            getPages: AppPages.routes,
            defaultTransition: Transition.cupertino,
            navigatorKey: navigatorKey,
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppColors.primary600),
              useMaterial3: true,
            ),
          ),
        ),
      ),
    );
  }
}
