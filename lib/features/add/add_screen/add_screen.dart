import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_tasks/core/widgets/Customtext.dart';
import 'package:todo_tasks/core/widgets/custom_textfield.dart';
import 'package:todo_tasks/core/widgets/customappbar.dart';
import 'package:todo_tasks/core/widgets/custombutton.dart';
import 'package:todo_tasks/features/add/add_controller/add_controller.dart';

class AddScreen extends ConsumerWidget {
  AddScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = ref.watch(titleControllerProvider);
    final titleDesController = ref.watch(titleDesControllerProvider);

    return Scaffold(
      appBar: CustomAppBar(title: "Add Screen"),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            CustomText(text: "Task Title"),
            CustomFormField(
              controller: titleController,
              hintText: "Enter Task Title",
              prefixIcon: Icon(FontAwesomeIcons.alignLeft),
            ),

            CustomText(text: "Task Description"),
            CustomFormField(
              controller: titleDesController,
              hintText: 'Enter Task Description',
              prefixIcon: Icon(FontAwesomeIcons.alignLeft),
            ),

            PriorityScreen(),
            AddButton(),
          ],
        ),
      ),
    );
  }
}

class PriorityScreen extends ConsumerWidget {
  PriorityScreen({super.key});

  List<String> proritynames = ['High', 'Medium', 'Low'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemdata = ref.watch(selectitemindex);

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
              itemCount: proritynames.length,
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
                      text: proritynames[index],
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

class AddButton extends ConsumerWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userdata);

    return CustomButton(
      icon: Icons.add,
      text: "Add Task",
      onTap: () {
        final id = DateTime.now().microsecondsSinceEpoch.toString();

        final titleController = ref.read(titleControllerProvider);
        final descriptionController = ref.read(titleDesControllerProvider);

        final selectedIndex = ref.read(selectitemindex);
        final priorityList = ref.read(priorityListProvider);
        final selectedPriority = priorityList[selectedIndex];

        ref
            .read(userdata.notifier).addUser(id, titleController.text.trim(), descriptionController.text.trim(), selectedPriority,);
      },
    );
  }
}
