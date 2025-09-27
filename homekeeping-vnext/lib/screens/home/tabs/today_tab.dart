import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/providers/agenda_providers.dart';
import 'package:homekeeping/providers/selected_items_provider.dart';
import 'package:homekeeping/widgets/agenda_list.dart';
import 'package:homekeeping/widgets/grace_period_list.dart';

class TodayTab extends ConsumerWidget {
  const TodayTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayItems = ref.watch(todayAgendaProvider);

    return todayItems.when(
      data: (items) => ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          AgendaList(items: items),
          const SizedBox(height: 16),
          GracePeriodList(
            onItemTap: (item) {
              final selectedItems = ref.read(selectedItemsProvider.notifier);
              if (selectedItems.state.contains(item)) {
                selectedItems.remove(item);
              } else {
                selectedItems.add(item);
              }
            },
          ),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Center(child: Text('Error loading today\'s tasks')),
    );
  }
}