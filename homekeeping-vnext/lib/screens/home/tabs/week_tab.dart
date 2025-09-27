import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/providers/agenda_providers.dart';
import 'package:homekeeping/widgets/agenda_list.dart';

class WeekTab extends ConsumerWidget {
  const WeekTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekItems = ref.watch(weekAgendaProvider);

    return weekItems.when(
      data: (items) => ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          AgendaList(items: items),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Center(child: Text('Error loading week\'s tasks')),
    );
  }
}