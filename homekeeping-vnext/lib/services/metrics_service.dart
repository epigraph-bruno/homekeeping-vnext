import 'package:cloud_functions/cloud_functions.dart';
import 'package:homekeeping/models/time_metrics.dart';

class WeekMetrics {
  final int expected;
  final int done;
  final double rateSoFar;
  final int personalExpected;
  final int personalDone;
  final double personalRateSoFar;
  final DateTime weekStart;
  final DateTime asOf;

  const WeekMetrics({
    required this.expected,
    required this.done,
    required this.rateSoFar,
    required this.personalExpected,
    required this.personalDone,
    required this.personalRateSoFar,
    required this.weekStart,
    required this.asOf,
  });

  factory WeekMetrics.fromJson(Map<String, dynamic> json) {
    return WeekMetrics(
      expected: json['expected'] as int,
      done: json['done'] as int,
      rateSoFar: (json['rateSoFar'] as num).toDouble(),
      personalExpected: json['personalExpected'] as int,
      personalDone: json['personalDone'] as int,
      personalRateSoFar: (json['personalRateSoFar'] as num).toDouble(),
      weekStart: DateTime.parse(json['weekStart'] as String),
      asOf: DateTime.parse(json['asOf'] as String),
    );
  }
}

class MetricsService {
  final FirebaseFunctions _functions;

  MetricsService({FirebaseFunctions? functions})
      : _functions = functions ?? FirebaseFunctions.instance;

  Future<(WeekMetrics, TimeMetrics)> getMetrics() async {
    try {
      final result = await _functions.httpsCallable('getMetrics').call();
      final weekSoFar = result.data['weekSoFar'] as Map<String, dynamic>;
      final time = result.data['time'] as Map<String, dynamic>;
      return (
        WeekMetrics.fromJson(weekSoFar),
        TimeMetrics.fromJson(time),
      );
    } catch (e) {
      throw 'Failed to get metrics: ${e.toString()}';
    }
  }
}
