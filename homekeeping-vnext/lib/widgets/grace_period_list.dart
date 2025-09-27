import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/models/agenda_item.dart';
import 'package:homekeeping/models/task.dart';
import 'package:homekeeping/providers/agenda_providers.dart';
import 'package:homekeeping/providers/selected_items_provider.dart';
import 'package:homekeeping/widgets/agenda_item_card.dart';

class GracePeriodList extends ConsumerWidget {
  final void Function(AgendaItem)? onItemTap;

  const GracePeriodList({
    super.key,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graceItemsAsync = ref.watch(graceItemsProvider);
    final tasksAsync = ref.watch(activeTasksProvider);
    final selectedItems = ref.watch(selectedItemsProvider);

    return graceItemsAsync.when(
      data: (items) => tasksAsync.when(
        data: (tasks) {
          if (items.isEmpty) {
            return const SizedBox.shrink();
          }

          final taskMap = {for (var task in tasks) task.id: task};

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Tasks in Grace Period',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final task = taskMap[item.taskId];
                  if (task == null) return const SizedBox.shrink();

                  return AgendaItemCard(
                    item: item,
                    isSelected: selectedItems.contains(item),
                    onTap: () => onItemTap?.call(item),
                  );
                },
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('Error loading tasks')),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Center(child: Text('Error loading grace items')),
    );
  }
}