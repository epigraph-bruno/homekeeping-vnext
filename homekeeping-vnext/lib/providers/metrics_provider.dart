import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/models/time_metrics.dart';
import 'package:homekeeping/services/metrics_service.dart';

final metricsServiceProvider = Provider<MetricsService>((ref) => MetricsService());

final metricsProvider = FutureProvider<(WeekMetrics, TimeMetrics)>((ref) {
  return ref.watch(metricsServiceProvider).getMetrics();
});

// Convenience providers for individual metrics
final weekMetricsProvider = FutureProvider<WeekMetrics>((ref) async {
  final (week, _) = await ref.watch(metricsProvider.future);
  return week;
});

final timeMetricsProvider = FutureProvider<TimeMetrics>((ref) async {
  final (_, time) = await ref.watch(metricsProvider.future);
  return time;
});