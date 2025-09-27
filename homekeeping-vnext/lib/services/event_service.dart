import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/models/agenda_item.dart';

class EventService {
  final FirebaseFunctions _functions;

  EventService({FirebaseFunctions? functions})
      : _functions = functions ?? FirebaseFunctions.instance;

  Future<void> submitEvents(List<AgendaItem> items) async {
    final events = items.map((item) => {
      'taskId': item.taskId,
      'date': item.dueDate.toIso8601String(),
      'value': 1,
    }).toList();

    await _functions.httpsCallable('addEvents').call({'events': events});
  }

  Future<void> undoEvents(List<AgendaItem> items) async {
    final events = items.map((item) => {
      'taskId': item.taskId,
      'date': item.dueDate.toIso8601String(),
      'value': -1,
    }).toList();

    await _functions.httpsCallable('addEvents').call({'events': events});
  }
}

final eventServiceProvider = Provider((ref) => EventService());