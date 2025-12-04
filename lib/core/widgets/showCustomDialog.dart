import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_tasks/core/widgets/custombutton.dart';
import 'package:todo_tasks/features/add/add_controller/add_controller.dart';
import 'package:todo_tasks/model/usermodel.dart';

void showIncompleteDialog(
    BuildContext context,
    WidgetRef ref,
    TaskModel task,

    ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {

      TextEditingController titleCtrl = TextEditingController(text: task.title);
      TextEditingController descCtrl = TextEditingController(text: task.description);

      return AlertDialog(
        title: Center(child: Text("Update Data ")),
        content: Column(
          spacing: 20,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleCtrl,
              decoration: InputDecoration(

                hintText: "Title",
                border: OutlineInputBorder(),
              ),
            ),

            TextField(
              controller: descCtrl,
              decoration: InputDecoration(
                hintText: "Description",
                border: OutlineInputBorder(),
              ),
            ),

            Row(
              spacing: 20,

              children: [
                Flexible(
                  child: CustomButton(text: "Cancel", onTap: () {
                    Navigator.pop(context);
                  }),
                ),
                Flexible(
                  child: CustomButton(text: "Submit", onTap: () {


                    ref.read(taskControllerProvider.notifier).updateTask(TaskModel(title: titleCtrl.text,description:descCtrl.text, id: task.id,isDone: task.isDone ));


                  }),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
