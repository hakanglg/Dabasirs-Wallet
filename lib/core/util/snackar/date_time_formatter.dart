import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';

String formatDateTime(DateTime time) {
  return DateFormat.yMd().format(time);
}
