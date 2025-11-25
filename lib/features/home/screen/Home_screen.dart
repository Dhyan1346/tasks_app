import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_tasks/core/widgets/AsyncDataWidget.dart';
import 'package:todo_tasks/features/add/add_controller/add_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskData = ref.watch(userdata);

    return AsyncDataWidget(
      asyncValue: taskData,
      builder: (data) {
        // data == list of tasks coming from Firestore
        // Example: [ {id:1, title:"A", desc:"B"}, ... ]

        return Scaffold(
          appBar: AppBar(title: Text("Home Screen")),
          body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final task = data[index]; // Map<String, dynamic>

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(task["title"] ?? "No title"),

                ),
              );
            },
          ),
        );
      },
    );
  }
}
