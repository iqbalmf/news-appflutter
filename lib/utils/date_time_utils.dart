import 'package:intl/intl.dart';

class DateTimeUtils {
  String changeDateTime(String time){
    var dateValue = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(time).toLocal();
    return DateFormat("dd MMM yyyy hh:mm").format(dateValue);
  }
}