import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => kDebugMode;
}
