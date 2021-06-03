import 'package:football_trivia/constants.dart';
import 'package:intl/intl.dart';

class TimeUtil {
  static String getFormattedDate(DateTime dateTime, String format) {
    return DateFormat(format).format(dateTime);
  }

  static String getFormattedDateFromText(
    String dateTime,
    String givenFormat,
    String desiredFormat,
  ) {
    if (dateTime == null) return defaultString;

    DateTime receivedDateTime = DateFormat(givenFormat).parse(dateTime);
    return DateFormat(desiredFormat)
        .format(receivedDateTime)
        .replaceAll(':', 'h');
  }
}
