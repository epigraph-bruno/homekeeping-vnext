import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/models/agenda_item.dart';

class SelectedItemsNotifier extends StateNotifier<List<AgendaItem>> {
  SelectedItemsNotifier() : super([]);

  void add(AgendaItem item) {
    state = [...state, item];
  }

  void remove(AgendaItem item) {
    state = state.where((i) => _getItemKey(i) != _getItemKey(item)).toList();
  }

  void clear() {
    state = [];
  }

  String _getItemKey(AgendaItem item) {
    return '${item.taskId}|${item.dueDate.toIso8601String()}';
  }
}

final selectedItemsProvider =
    StateNotifierProvider<SelectedItemsNotifier, List<AgendaItem>>(
  (ref) => SelectedItemsNotifier(),
);