import 'package:intl/intl.dart';

class Utils {
  static DateTime buildDateTimeObject(String string) {
    var dateString = string;
    var dateFormat = DateFormat("MM/dd/yyyy HH:mm:ss");
    var dateTime = dateFormat.parseStrict(dateString);

    return dateTime;
  }

  static String convertDateFormat(String date) {
    final dateFormat = DateFormat("EEEE, MMMM d, yyyy");
    final convertedDate = dateFormat.parse(date);
    final outputFormat = DateFormat("MM/dd/yyyy");

    return outputFormat.format(convertedDate);
  }

  static String getFormattedHourFromDateTime(DateTime dateTime){
      return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }
}
