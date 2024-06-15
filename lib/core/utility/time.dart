import 'package:intl/intl.dart';

class Time {
  static String dateTimeFull(DateTime dateTime) =>
      DateFormat("dd' 'MMMM' 'y").format(dateTime);
  static String get now => dateTimeFull(DateTime.now());
  static String hourMinute(DateTime dateTime) =>
      DateFormat.jm().format(dateTime);
}
