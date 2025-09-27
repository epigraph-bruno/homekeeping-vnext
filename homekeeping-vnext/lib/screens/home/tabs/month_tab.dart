import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/providers/agenda_providers.dart';
import 'package:homekeeping/widgets/agenda_list.dart';

class MonthTab extends ConsumerWidget {
  const MonthTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthItems = ref.watch(monthAgendaProvider);

    return monthItems.when(
      data: (items) => ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          AgendaList(items: items),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Center(child: Text('Error loading month\'s tasks')),
    );
  }
}