import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homekeeping/models/agenda_item.dart';

class AgendaRepository {
  final FirebaseFirestore _firestore;

  AgendaRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  // Watch agenda items for a specific bucket (Today/Week/Month)
  Stream<List<AgendaItem>> watchAgendaItems(String bucket) {
    return _firestore
        .collection('agendas')
        .doc(getCurrentPeriodKey(bucket))
        .collection('items')
        .where('bucket', isEqualTo: bucket)
        .where('archived', isEqualTo: false)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => AgendaItem.fromJson(doc.data())).toList());
  }

  // Watch agenda items for a specific user
  Stream<List<AgendaItem>> watchUserAgendaItems(String userCode, String bucket) {
    return _firestore
        .collection('agendas')
        .doc(getCurrentPeriodKey(bucket))
        .collection('items')
        .where('bucket', isEqualTo: bucket)
        .where('assignedTo', arrayContains: userCode)
        .where('archived', isEqualTo: false)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => AgendaItem.fromJson(doc.data())).toList());
  }

  // Get items in grace period
  Stream<List<AgendaItem>> watchGraceItems() {
    final now = DateTime.now();
    return _firestore
        .collection('agendas')
        .doc(getCurrentPeriodKey('MONTH')) // Use month for widest window
        .collection('items')
        .where('archived', isEqualTo: false)
        .where('locked', isEqualTo: false)
        .where('dueDate', isLessThan: now)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => AgendaItem.fromJson(doc.data())).toList());
  }

  // Helper to get the current period key based on bucket
  String getCurrentPeriodKey(String bucket) {
    final now = DateTime.now();
    switch (bucket) {
      case 'TODAY':
        return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
      case 'WEEK':
        // Get the start of the week (assuming Monday start)
        final monday = now.subtract(Duration(days: now.weekday - 1));
        return '${monday.year}-${monday.month.toString().padLeft(2, '0')}-${monday.day.toString().padLeft(2, '0')}';
      case 'MONTH':
        return '${now.year}-${now.month.toString().padLeft(2, '0')}';
      default:
        throw ArgumentError('Invalid bucket: $bucket');
    }
  }
}
