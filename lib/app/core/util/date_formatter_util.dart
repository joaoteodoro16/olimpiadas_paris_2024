import 'package:intl/intl.dart';

class DateFormatterUtil {
  DateFormatterUtil._();

  static String formatDateToBrazilian(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate);
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(dateTime);
  }

  static String formatDateTimeToBrazilian(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate);
    DateFormat dateTimeFormat = DateFormat('HH:mm');
    return dateTimeFormat.format(dateTime);
  }

  static String formatDateToUSA(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate);
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    return dateFormat.format(dateTime);
  }
}
