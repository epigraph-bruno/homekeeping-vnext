import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/models/event.dart';
import 'package:homekeeping/repositories/event_repository.dart';

final eventRepositoryProvider = Provider((ref) => EventRepository());

final recentEventsProvider = StreamProvider<List<TaskEvent>>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  final now = DateTime.now();
  final start = now.subtract(const Duration(days: 7));
  return repository.watchEvents(start, now);
});
