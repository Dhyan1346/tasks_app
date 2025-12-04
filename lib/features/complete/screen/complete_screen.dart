import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:todo_tasks/core/widgets/AsyncDataWidget.dart';
import 'package:todo_tasks/core/widgets/Customtext.dart';
import 'package:todo_tasks/core/widgets/customappbar.dart';
import 'package:todo_tasks/core/widgets/showCustomDialog.dart';
import 'package:todo_tasks/features/home/controller/home_controller.dart';
import 'package:todo_tasks/features/add/add_controller/add_controller.dart';

class CompleteScreen extends ConsumerWidget {
  const CompleteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Complete Tasks"),
      body: Column(
        children: const [
          ShowContainer(),
        ],
      ),
    );
  }
}

class ShowContainer extends ConsumerWidget {
  const ShowContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskData = ref.watch(taskCompleteStreamProvider);

    return Expanded(
      child: AsyncDataWidget(
        asyncValue: taskData,
        builder: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text("No completed tasks"),
            );
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final task = data[index];
              final isSelected = task.isDone;

              return Dismissible(
                key: Key(task.id),
                direction: DismissDirection.startToEnd,
                onDismissed: (dir) {
                  if (dir == DismissDirection.startToEnd) {
                    ref.read(taskControllerProvider.notifier).removeTask(task);
                  }
                },

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: Row(
                        children: [
                          /// LEFT SECTION
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: task.title ?? '',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              const SizedBox(height: 4),

                              CustomText(
                                text: task.description ?? '',
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              const SizedBox(height: 8),

                              Row(
                                children: [
                                  /// Priority Tag
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: CustomText(
                                      text: task.priority ?? '',
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),

                                  const SizedBox(width: 16),

                                  /// Date Tag
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.calendar_month,
                                          color: Colors.black,
                                          size: 15,
                                        ),
                                        const SizedBox(width: 4),
                                        CustomText(
                                          text: formatDate(task.createdAt),
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const Spacer(),

                          /// RIGHT SECTION (ICONS)
                          Column(
                            spacing: 20,
                            children: [
                              /// Toggle Complete/Incomplete
                              GestureDetector(
                                onTap: () {
                                  ref
                                      .read(taskControllerProvider.notifier)
                                      .toggleDone(task);
                                },
                                child: Icon(
                                  isSelected
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  color: isSelected ? Colors.green : Colors.grey,
                                ),
                              ),

                              /// Delete
                              GestureDetector(
                                onTap: () {
                                  ref
                                      .watch(taskControllerProvider.notifier)
                                      .removeTask(task);
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),

                              /// Edit
                              GestureDetector(
                                onTap: () {
                                  showIncompleteDialog(context, ref, task);
                                },
                                child: const Icon(
                                  FontAwesomeIcons.penToSquare,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// ⭐ Date format helper
String formatDate(DateTime date) {
  return DateFormat('dd-MM-yyyy').format(date);
}
