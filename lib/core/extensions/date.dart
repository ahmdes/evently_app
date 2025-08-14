import 'package:intl/intl.dart';

extension DateFormate on DateTime {
  String get getDateFormatFromDateTime {
    DateFormat formatter = DateFormat("MMMM");
    return formatter.format(this);
  }

  String get eventDate {
    DateFormat formatter = DateFormat("dd-MM-yyyy");
    return formatter.format(this);
  }

  String get eventTime {
    DateFormat formatter = DateFormat("hh:mm");
    return formatter.format(this);
  }
}
