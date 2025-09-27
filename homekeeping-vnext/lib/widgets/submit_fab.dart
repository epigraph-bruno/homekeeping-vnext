import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/models/agenda_item.dart';
import 'package:homekeeping/providers/agenda_providers.dart';
import 'package:homekeeping/providers/selected_items_provider.dart';
import 'package:homekeeping/services/event_service.dart';

class SubmitFAB extends ConsumerWidget {
  const SubmitFAB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(selectedItemsProvider);
    if (selectedItems.isEmpty) return const SizedBox.shrink();

    return FloatingActionButton.extended(
      onPressed: () => _handleSubmit(context, ref, selectedItems),
      label: const Text('Submit'),
      icon: const Icon(Icons.check),
    );
  }

  Future<void> _handleSubmit(
    BuildContext context,
    WidgetRef ref,
    List<AgendaItem> selectedItems,
  ) async {
    try {
      await ref.read(eventServiceProvider).submitEvents(selectedItems);
      ref.read(selectedItemsProvider.notifier).clear();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tasks completed successfully')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error completing tasks: $e'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () => _handleUndo(context, ref, selectedItems),
            ),
          ),
        );
      }
    }
  }

  Future<void> _handleUndo(
    BuildContext context,
    WidgetRef ref,
    List<AgendaItem> selectedItems,
  ) async {
    try {
      await ref.read(eventServiceProvider).undoEvents(selectedItems);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tasks undone successfully')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error undoing tasks: $e')),
        );
      }
    }
  }
}