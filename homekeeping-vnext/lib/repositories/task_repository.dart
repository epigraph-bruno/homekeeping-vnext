import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homekeeping/models/task.dart';

class TaskRepository {
  final FirebaseFirestore _firestore;

  TaskRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  // Get all active tasks
  Stream<List<Task>> watchActiveTasks() {
    return _firestore
        .collection('tasks')
        .where('active', isEqualTo: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList());
  }

  // Get a single task by ID
  Future<Task?> getTask(String taskId) async {
    final doc = await _firestore.collection('tasks').doc(taskId).get();
    return doc.exists ? Task.fromJson(doc.data()!) : null;
  }

  // Get tasks by group
  Stream<List<Task>> watchTasksByGroup(String groupId) {
    return _firestore
        .collection('tasks')
        .where('groupId', isEqualTo: groupId)
        .where('active', isEqualTo: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList());
  }

  // Get tasks assigned to a user
  Stream<List<Task>> watchTasksByUser(String userCode) {
    return _firestore
        .collection('tasks')
        .where('assignedTo', arrayContains: userCode)
        .where('active', isEqualTo: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList());
  }
}
