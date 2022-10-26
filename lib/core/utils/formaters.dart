import 'package:intl/intl.dart';

class Formatters {  
  /// -default format 7:30 am
  static String time({required DateTime? date, String? format = 'jm'}) {
    if(date == null || format == null) return "";
    return DateFormat(format, 'ES_es').format(date.toLocal());
  }

  /// -default format 1/12/2020
  static String date({required DateTime? date, String? format = 'yMd'}) {
    if(date == null || format == null) return "";
    return DateFormat(format, 'ES_es').format(date.toLocal());
  }

  /// -default format 1/12/2020 4:23 PM
  /// The hour and minutes always shows
  /// You can change the date format
  static String dateTime({required DateTime? date, String? format = 'yMd'}) {
    if(date == null || format == null) return "";
    return DateFormat(format, 'ES_es').add_jm().format(date.toLocal());
  }
  
}