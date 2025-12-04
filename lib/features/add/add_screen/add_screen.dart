import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_tasks/core/widgets/AsyncDataWidget.dart';
import 'package:todo_tasks/core/widgets/Customtext.dart';
import 'package:todo_tasks/core/widgets/custom_textfield.dart';
import 'package:todo_tasks/core/widgets/customappbar.dart';
import 'package:todo_tasks/core/widgets/custombutton.dart';
import 'package:todo_tasks/features/add/add_controller/add_controller.dart';
import 'package:todo_tasks/model/usermodel.dart';
final formKey = GlobalKey<FormState>();
class AddScreen extends ConsumerWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final title=ref.watch(titleEditingControllerProvider);
    final titledes=ref.watch(titleDescriptionEditingControllerProvider);


    return Scaffold(
      appBar: CustomAppBar(title: "Add Screen"),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              CustomText(text: "Task Title"),
              CustomFormField(
                controller: title,
                hintText: "Enter Task Title",
                validator: (val){
                  if (val == null || val.trim().isEmpty) {
                    return "Title is required";
                  }
                  return null;


                },
                prefixIcon: Icon(FontAwesomeIcons.alignLeft),
              ),

              CustomText(text: "Task Description"),
              CustomFormField(
                validator: (val){
                  if (val == null || val.trim().isEmpty) {
                    return "Description is required";
                  }
                  return null;


                },
                controller: titledes,
                hintText: 'Enter Task Description',
                prefixIcon: Icon(FontAwesomeIcons.alignLeft),
              ),

              PriorityScreen(),
              AddButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class PriorityScreen extends ConsumerWidget {

  const PriorityScreen({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemdata = ref.watch(selectitemindex);
    final priorityList=ref.watch(priorityListProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: "Priority"),

        SizedBox(width: 20),

        Expanded(
          child: SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: priorityList.length,
              itemBuilder: (context, index) {
                final isSelected = itemdata == index;

                return GestureDetector(
                  onTap: () {
                    ref.read(selectitemindex.notifier).state = index;
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CustomText(
                      text: priorityList[index],
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class AddButton extends ConsumerWidget  {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskState = ref.watch(taskControllerProvider);
    final priorityMap = {
      "High": 1,
      "Medium": 2,
      "Low": 3,
    };


    final title=ref.watch(titleEditingControllerProvider);
    final titledes=ref.watch(titleDescriptionEditingControllerProvider);
    final id=DateTime.now().microsecondsSinceEpoch.toString();
    final index = ref.watch(selectitemindex);
    final priorityList = ref.watch(priorityListProvider);
    final selectedPriority = priorityList[index];

    return AsyncDataWidget(asyncValue:taskState , builder: (data) {
      return  CustomButton(
        icon: Icons.add,
        text: "Add Task",
        onTap: () {
          if (formKey.currentState!.validate()) {
            // All validators passed
            ref.read(taskControllerProvider.notifier).addTask(
              TaskModel(
                id:id,
                title:title.text,
                description:titledes.text,
                priority:selectedPriority,
                createdAt:DateTime.now(),
                priorityValue:priorityMap[selectedPriority]!,
              ),
            );
          }
        },

      );
    },);




  }
}
