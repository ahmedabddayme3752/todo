import 'package:cloud_firestore/cloud_firestore.dart';

class TasksProvider {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createTask(String userId, Map<String, dynamic> task) {
    return _db.collection('users').doc(userId).collection('tasks').add(task);
  }
}
