import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/providers/agenda_providers.dart';
import 'package:homekeeping/providers/event_providers.dart';
import 'package:homekeeping/widgets/event_list.dart';

class DoneTab extends ConsumerWidget {
  const DoneTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentEvents = ref.watch(recentEventsProvider);
    final tasks = ref.watch(activeTasksProvider);

    return recentEvents.when(
      data: (events) => tasks.when(
        data: (tasks) => EventList(events: events, tasks: tasks),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('Error loading tasks')),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Center(child: Text('Error loading events')),
    );
  }
}