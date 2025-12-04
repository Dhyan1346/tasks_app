import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_tasks/model/usermodel.dart';

class TaskRepository {
  final _db = FirebaseFirestore.instance.collection("tasks");

  Future<void> add(TaskModel task) async {
    await _db.doc(task.id).set(task.toMap());
  }

  Future<void> remove(TaskModel task) async {
    await _db.doc(task.id).delete();
  }





  Future<void> toggleDone(TaskModel task) async {
    await _db.doc(task.id).update({"isDone": !task.isDone});
  }

  Stream<List<TaskModel>> getTask() {
    return _db.snapshots().map(
          (snapshot) {
        return snapshot.docs
            .map((doc) => TaskModel.fromMap(doc.data()))
            .where((task) => task.isDone == false)       // Filter done
            .toList();// Sort
      },
    );
  }

}

//
//
// Future<List<Map<String, dynamic>>> fetchUsers() async {
//   final data = await FirebaseFirestore.instance
//       .collection('users')
//       .get();
//
//   return data.docs.map((doc) {
//     return {
//       "id": doc.id,
//       ...doc.data(),
//     };
//   }).toList();
// }
