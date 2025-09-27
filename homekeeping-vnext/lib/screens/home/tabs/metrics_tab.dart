import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/providers/metrics_provider.dart';
import 'package:homekeeping/widgets/time_metrics_card.dart';

class MetricsTab extends ConsumerWidget {
  const MetricsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metrics = ref.watch(metricsProvider);

    return metrics.when(
      data: (metrics) => SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Week So Far Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Week So Far',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    _buildProgressSection(
                      context,
                      'Shared Tasks',
                      metrics.$1.done,
                      metrics.$1.expected,
                      metrics.$1.rateSoFar,
                    ),
                    const Divider(height: 32),
                    _buildProgressSection(
                      context,
                      'Personal Tasks',
                      metrics.$1.personalDone,
                      metrics.$1.personalExpected,
                      metrics.$1.personalRateSoFar,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'As of ${_formatTime(metrics.$1.asOf)}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            TimeMetricsCard(metrics: metrics.$2),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Center(
        child: Text('Error loading metrics'),
      ),
    );
  }

  Widget _buildProgressSection(
    BuildContext context,
    String title,
    int done,
    int expected,
    double rate,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: rate,
          backgroundColor: Colors.grey.shade200,
          color: _getProgressColor(rate),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$done of $expected done',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '${(rate * 100).round()}%',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: _getProgressColor(rate),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Color _getProgressColor(double rate) {
    if (rate >= 0.9) return Colors.green;
    if (rate >= 0.7) return Colors.orange;
    return Colors.red;
  }

  String _formatTime(DateTime time) {
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final period = time.hour < 12 ? 'AM' : 'PM';
    return '$hour:${time.minute.toString().padLeft(2, '0')} $period';
  }
}