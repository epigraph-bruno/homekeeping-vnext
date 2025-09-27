import 'package:flutter/material.dart';
import 'package:homekeeping/models/time_metrics.dart';

class TimeMetricsCard extends StatelessWidget {
  final TimeMetrics metrics;

  const TimeMetricsCard({
    super.key,
    required this.metrics,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Time Distribution',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),

            // Time by Group
            Text(
              'By Task Group',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ...metrics.byGroup.map((group) => _buildTimeBar(
              context,
              group.groupName,
              group.hours,
              metrics.totalHours,
            )),
            if (metrics.ungroupedHours > 0) _buildTimeBar(
              context,
              'Ungrouped',
              metrics.ungroupedHours,
              metrics.totalHours,
            ),
            const Divider(height: 32),

            // Time by Person
            Text(
              'By Person',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ...metrics.byPerson.map((person) => _buildTimeBar(
              context,
              person.userCode,
              person.hours,
              metrics.totalHours,
            )),
            const SizedBox(height: 16),

            // Total time
            Text(
              'Total time: ${_formatHours(metrics.totalHours)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeBar(
    BuildContext context,
    String label,
    double hours,
    double totalHours,
  ) {
    final percentage = totalHours > 0 ? hours / totalHours : 0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                _formatHours(hours),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: percentage.toDouble(),
            backgroundColor: Colors.grey.shade200,
            color: _getProgressColor(percentage.toDouble()),
          ),
        ],
      ),
    );
  }

  String _formatHours(double hours) {
    final roundedHours = hours.toStringAsFixed(1);
    return '$roundedHours hrs';
  }

  Color _getProgressColor(double percentage) {
    if (percentage >= 0.4) return Colors.green;
    if (percentage >= 0.2) return Colors.orange;
    return Colors.blue;
  }
}
