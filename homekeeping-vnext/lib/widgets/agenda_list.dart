import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/models/agenda_item.dart';
import 'package:homekeeping/models/task.dart';
import 'package:homekeeping/providers/agenda_providers.dart';
import 'package:homekeeping/providers/selected_items_provider.dart';
import 'package:homekeeping/widgets/agenda_item_card.dart';

class AgendaList extends ConsumerWidget {
  final List<AgendaItem> items;
  final bool showGraceOnly;

  const AgendaList({
    super.key,
    required this.items,
    this.showGraceOnly = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(selectedItemsProvider);
    final tasksAsync = ref.watch(activeTasksProvider);

    return tasksAsync.when(
      data: (tasks) {
        final taskMap = {for (var task in tasks) task.id: task};
        final filteredItems = showGraceOnly
            ? items.where((item) => item.isPastDue).toList()
            : items;

        if (filteredItems.isEmpty) {
          return Center(
            child: Text(
              showGraceOnly
                  ? 'No tasks in grace period'
                  : 'No tasks for this period',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredItems.length,
          itemBuilder: (context, index) {
            final item = filteredItems[index];
            final task = taskMap[item.taskId];
            if (task == null) return const SizedBox.shrink();

            return AgendaItemCard(
              item: item,
              isSelected: selectedItems.contains(item),
              onTap: () => _handleItemTap(ref, item),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Center(child: Text('Error loading tasks')),
    );
  }

  void _handleItemTap(WidgetRef ref, AgendaItem item) {
    final selectedItems = ref.read(selectedItemsProvider.notifier);
    if (selectedItems.state.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
  }

  bool _isAssignedToUser(AgendaItem item, String userCode) {
    return item.assignedTo.isEmpty || item.assignedTo.contains(userCode);
  }
}