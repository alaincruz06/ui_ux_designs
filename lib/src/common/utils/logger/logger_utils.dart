import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LoggerUtils {
  static Logger logger = Get.find<Logger>(tag: 'ControllerLogger');

  static void write(String text, {bool isError = false}) {
    if (text.contains('Controller') &&
        (text.contains('has been initialized') ||
            text.contains('deleted from memory'))) {
      Future.microtask(() => logger.i(text));
    } else {
      Future.microtask(() => logger.d('** $text. isError: [$isError]'));
    }
  }
}
