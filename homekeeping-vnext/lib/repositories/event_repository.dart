import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homekeeping/models/event.dart';
import 'package:rxdart/rxdart.dart';

class EventRepository {
  final FirebaseFirestore _firestore;

  EventRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  // Watch events for a specific date range
  Stream<List<TaskEvent>> watchEvents(DateTime start, DateTime end) {
    final startKey = _getMonthKey(start);
    final endKey = _getMonthKey(end);

    // If within same month, query single collection
    if (startKey == endKey) {
      return _watchEventsForMonth(startKey, start, end);
    }

    // Otherwise, merge streams from multiple months
    final streams = <Stream<List<TaskEvent>>>[];
    var current = DateTime(start.year, start.month);
    
    while (current.isBefore(DateTime(end.year, end.month + 1))) {
      final monthKey = _getMonthKey(current);
      streams.add(_watchEventsForMonth(
        monthKey,
        current == start.month ? start : DateTime(current.year, current.month),
        current == end.month ? end : DateTime(current.year, current.month + 1, 0),
      ));
      current = DateTime(current.year, current.month + 1);
    }

    return streams.length == 1 ? streams.first : Rx.combineLatest(
      streams,
      (List<List<TaskEvent>> lists) => lists.expand((x) => x).toList(),
    );
  }

  // Watch events for a specific task
  Stream<List<TaskEvent>> watchTaskEvents(String taskId, DateTime start, DateTime end) {
    return watchEvents(start, end).map(
        (events) => events.where((e) => e.taskId == taskId).toList());
  }

  // Watch events for a specific user
  Stream<List<TaskEvent>> watchUserEvents(String userCode, DateTime start, DateTime end) {
    return watchEvents(start, end).map(
        (events) => events.where((e) => e.userCode == userCode).toList());
  }

  // Helper to watch events for a single month
  Stream<List<TaskEvent>> _watchEventsForMonth(
      String monthKey, DateTime start, DateTime end) {
    return _firestore
        .collection('events')
        .doc(monthKey)
        .collection('entries')
        .where('date', isGreaterThanOrEqualTo: start)
        .where('date', isLessThan: end)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => TaskEvent.fromJson(doc.data())).toList());
  }

  // Helper to get month key (YYYY-MM)
  String _getMonthKey(DateTime date) =>
      '${date.year}-${date.month.toString().padLeft(2, '0')}';
}