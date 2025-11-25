import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:todo_tasks/core/widgets/customtoast.dart';


import 'package:riverpod/legacy.dart';

final selectitemindex=StateProvider<int>((ref) {
  return 0;
},);


final userdata = StateNotifierProvider<UserDataProvider, AsyncValue<void>>((
  ref,
) {
  return UserDataProvider();
});

class UserDataProvider extends StateNotifier<AsyncValue<void>> {
  final firebasefirestore = FirebaseFirestore.instance.collection('user');

  UserDataProvider() : super(const AsyncValue.data(null));

  Future<void> addUser(String id, String title, String description, String priority) async {
    try {
      // show loading
      state = const AsyncValue.loading();

      await firebasefirestore.doc(id).set({
        'id': id,
        'title': title,
        'description': description,
        'priority': priority,
        'createdAt': Timestamp.now(),
      });

      // success state
      state = const AsyncValue.data(null);
      CustomToast.show("Data added successfully");
    } catch (e, st) {
      // error state
      state = AsyncValue.error(e, st);
      CustomToast.show("Error adding data");
    }
  }
}
final titleControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final titleDesControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});



final priorityListProvider = Provider<List<String>>((ref) {
  return ['High', 'Medium', 'Low'];
});