

import 'package:flutter/material.dart';
import 'package:riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todo_tasks/core/widgets/customtoast.dart';
import 'package:todo_tasks/model/usermodel.dart';

import '../incomplete_repositary/incomplete_repositary.dart';

final selectitemindex = StateProvider<int>((ref) {
  return 0;
});


final taskControllerProvider =
StateNotifierProvider<TaskController, AsyncValue<List<TaskModel>>>(
      (ref) => TaskController(ref.watch(taskRepositoryProvider)),
);







final taskStreamProvider= StreamProvider<List<TaskModel>>((ref) {
  return ref.watch(taskRepositoryProvider).getTask();

},);

final titleEditingControllerProvider =
Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final titleDescriptionEditingControllerProvider =
Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final taskRepositoryProvider = Provider((ref) => TaskRepository());

class TaskController extends StateNotifier<AsyncValue<List<TaskModel>>> {
  final TaskRepository repo;
  TaskController(this.repo) : super(AsyncValue.loading()) {
    listentask();
  }

  void listentask() {
    repo.getTask().listen(
          (taskList) {
        state = AsyncValue.data(taskList);
      },
      onError: (e) {
        state = AsyncValue.error(e, StackTrace.current);
      },
    );
  }

  Future<void> addTask(TaskModel task) async {
    try {
      state = const AsyncValue.loading();
      await repo.add(task);
      CustomToast.show("Task added successfully.");
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      CustomToast.show("Task added Failed.");
    }
  }


  Future<void> removeTask(TaskModel task) async {
    try {
      state = const AsyncValue.loading();
      await repo.remove(task);
      CustomToast.show("Task removed successfully.");
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      CustomToast.show("Task removed Failed.");
    }
  }


  Future<void> toggleDone(TaskModel task) async {
    try {
      await repo.toggleDone(task);
    } catch (e) {
      CustomToast.show("Failed to update");
    }
  }
}


final priorityListProvider = Provider<List<String>>((ref) {
  return ['High', 'Medium', 'Low'];
});


