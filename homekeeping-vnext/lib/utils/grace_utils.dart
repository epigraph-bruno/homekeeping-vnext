import 'package:homekeeping/models/agenda_item.dart';
import 'package:homekeeping/models/settings.dart';
import 'package:intl/intl.dart';

class GraceUtils {
  static DateTime getGraceEndDate(AgendaItem item, AppSettings settings) {
    final graceDays = _getGraceDays(item.bucket, settings);
    return item.dueDate.add(Duration(days: graceDays));
  }

  static bool isInGracePeriod(AgendaItem item, AppSettings settings) {
    final now = DateTime.now();
    final graceEnd = getGraceEndDate(item, settings);
    return now.isBefore(graceEnd);
  }

  static String getGraceMessage(AgendaItem item, AppSettings settings) {
    final graceEnd = getGraceEndDate(item, settings);
    final formatter = DateFormat('MMM d');
    return 'Past due — completable until ${formatter.format(graceEnd)}';
  }

  static int _getGraceDays(String bucket, AppSettings settings) {
    switch (bucket) {
      case 'today':
        return settings.grace.daily;
      case 'week':
        return settings.grace.weekly;
      case 'month':
        return settings.grace.monthly;
      default:
        return 0;
    }
  }
}