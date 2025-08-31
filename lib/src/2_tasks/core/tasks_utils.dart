import 'package:intl/intl.dart';
import 'package:mime/mime.dart';

class TasksUtils {
  final DateFormat tasksDateFormat = DateFormat('dd/MM/yy - HH:mm');
  final DateFormat tasksDateFormatWithoutHours = DateFormat('dd/MM/yy');

  DateTime resetTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  DateTime resetTimeForMonth(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, 0);
  }

  List<DateTime> getDatesBetween(DateTime startDate, DateTime endDate) {
    List<DateTime> dates = [];

    // Ensure startDate is before endDate
    DateTime currentDate = startDate.isBefore(endDate) ? startDate : endDate;
    DateTime finalDate = startDate.isBefore(endDate) ? endDate : startDate;

    while (currentDate.isBefore(finalDate) ||
        currentDate.isAtSameMomentAs(finalDate)) {
      dates.add(currentDate);
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return dates;
  }

  //MimeTypes for Files
  String getMimeType(String path) {
    final String mimeType = lookupMimeType(path) ?? '';

    if (mimeType.startsWith('image/')) {
      return 'image';
    } else if (mimeType.startsWith('video/')) {
      return 'video';
    } else if (mimeType.startsWith('text/')) {
      return 'text';
    } else if (mimeType.startsWith('audio/')) {
      return 'audio';
    } else {
      return 'application';
    }
  }
}
