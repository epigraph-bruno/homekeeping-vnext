import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/models/agenda_item.dart';
import 'package:homekeeping/models/task.dart';
import 'package:homekeeping/repositories/agenda_repository.dart';
import 'package:homekeeping/repositories/task_repository.dart';

final agendaRepositoryProvider = Provider((ref) => AgendaRepository());
final taskRepositoryProvider = Provider((ref) => TaskRepository());

final activeTasksProvider = StreamProvider<List<Task>>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return repository.watchActiveTasks();
});

final todayAgendaProvider = StreamProvider<List<AgendaItem>>((ref) {
  final repository = ref.watch(agendaRepositoryProvider);
  return repository.watchAgendaItems('today');
});

final weekAgendaProvider = StreamProvider<List<AgendaItem>>((ref) {
  final repository = ref.watch(agendaRepositoryProvider);
  return repository.watchAgendaItems('week');
});

final monthAgendaProvider = StreamProvider<List<AgendaItem>>((ref) {
  final repository = ref.watch(agendaRepositoryProvider);
  return repository.watchAgendaItems('month');
});

final graceItemsProvider = StreamProvider<List<AgendaItem>>((ref) {
  final repository = ref.watch(agendaRepositoryProvider);
  return repository.watchGraceItems();
});
