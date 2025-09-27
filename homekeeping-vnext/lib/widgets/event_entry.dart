import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:homekeeping/models/event.dart';
import 'package:homekeeping/models/task.dart';
import 'package:homekeeping/providers/event_provider.dart';

class EventEntry extends ConsumerWidget {
  final TaskEvent event;
  final Task task;
  final bool showDate;

  const EventEntry({
    super.key,
    required this.event,
    required this.task,
    this.showDate = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only show undo option for positive counts (completions)
    final canUndo = event.count > 0;

    return Slidable(
      enabled: canUndo,
      endActionPane: canUndo ? ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => _handleUndo(context, ref),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.undo,
            label: 'Undo',
          ),
        ],
      ) : null,
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: event.count > 0 ? Colors.green : Colors.red.shade100,
            child: Icon(
              event.count > 0 ? Icons.check : Icons.undo,
              color: event.count > 0 ? Colors.white : Colors.red,
            ),
          ),
          title: Text(task.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showDate) Text(_formatDate(event.date)),
              Text(
                'By ${event.userCode}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          trailing: task.requireBoth ? 
            const Tooltip(
              message: 'Requires both BG and KG',
              child: Icon(Icons.people),
            ) : null,
        ),
      ),
    );
  }

  Future<void> _handleUndo(BuildContext context, WidgetRef ref) async {
    try {
      // Submit undo event
      await ref.read(eventServiceProvider).submitEvents(
        [event.toAgendaItem()],
        isUndo: true,
      );

      // Show success message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Task undone'),
          ),
        );
      }
    } catch (e) {
      // Show error message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to undo: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final eventDate = DateTime(date.year, date.month, date.day);

    if (eventDate == DateTime(now.year, now.month, now.day)) {
      return 'Today';
    } else if (eventDate == yesterday) {
      return 'Yesterday';
    } else {
      return '${_getMonthName(date.month)} ${date.day}';
    }
  }

  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
}
