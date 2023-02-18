import 'package:intl/intl.dart';

class UtilsDate {
  static String formateDate(DateTime? dt){
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formatted = formatter.format(dt!);
  return formatted;
  }
}