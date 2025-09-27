import 'package:flutter/material.dart';
import 'package:homekeeping/models/event.dart';
import 'package:homekeeping/models/task.dart';
import 'package:intl/intl.dart';

class EventList extends StatelessWidget {
  final List<TaskEvent> events;
  final List<Task> tasks;

  const EventList({
    super.key,
    required this.events,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    final taskMap = {for (var task in tasks) task.id: task};
    final groupedEvents = _groupEventsByDate(events);

    return ListView.builder(
      itemCount: groupedEvents.length,
      itemBuilder: (context, index) {
        final date = groupedEvents.keys.elementAt(index);
        final dateEvents = groupedEvents[date]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _formatDate(date),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ...dateEvents.map((event) {
              final task = taskMap[event.taskId];
              if (task == null) return const SizedBox.shrink();

              return ListTile(
                title: Text(task.name),
                subtitle: Text(task.description),
                trailing: Text(
                  event.value > 0 ? 'Completed' : 'Undone',
                  style: TextStyle(
                    color: event.value > 0 ? Colors.green : Colors.red,
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }

  Map<DateTime, List<TaskEvent>> _groupEventsByDate(List<TaskEvent> events) {
    final grouped = <DateTime, List<TaskEvent>>{};
    for (var event in events) {
      final date = DateTime(
        event.date.year,
        event.date.month,
        event.date.day,
      );
      grouped.putIfAbsent(date, () => []).add(event);
    }
    return Map.fromEntries(
      grouped.entries.toList()
        ..sort((a, b) => b.key.compareTo(a.key)),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return 'Today';
    }

    if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return 'Yesterday';
    }

    return DateFormat('EEEE, MMMM d').format(date);
  }
}
