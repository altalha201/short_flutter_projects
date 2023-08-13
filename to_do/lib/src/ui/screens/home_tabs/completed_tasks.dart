import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/task_controller.dart';
import '../../utils/task_details_dialog.dart';
import '../../utils/task_item_widget.dart';

class CompletedTasks extends StatefulWidget {
  const CompletedTasks({Key? key}) : super(key: key);

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<TaskController>(
        builder: (taskController) {
          if(taskController.completedList.isEmpty) {
            return const Center(child: Text("No completed task!"),);
          }
          return ListView.builder(
            itemCount: taskController.completedList.length,
            itemBuilder: (context, index) {
              final item = taskController.completedList.elementAt(index);
              return TaskItemWidget(
                taskTitle: item.toDoTitle ?? "",
                taskCompleted: item.completed ?? true,
                onDelete: (context) {
                  taskController.deleteItem(item);
                },
                onItemTap: () {
                  showDialog(context: context, builder: (context) {
                    return TaskDetailsDialog(task: item);
                  },);
                },
                onCheck: (value) {
                  taskController.updateTask(item, value ?? false);
                },
              );
            },
          );
        }
      ),
    );
  }
}
