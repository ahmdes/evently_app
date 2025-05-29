import 'package:intl/intl.dart';

extension DateFormate on DateTime{
  String get getDateFormatFromDateTime
  {
    DateFormat formatter=DateFormat("MMMM");
    return formatter.format(this);
  }
}