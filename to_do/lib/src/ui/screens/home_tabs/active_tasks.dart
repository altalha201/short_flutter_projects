import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/src/controller/task_controller.dart';

import '../../utils/task_item_widget.dart';

class ActiveTasks extends StatefulWidget {
  const ActiveTasks({Key? key}) : super(key: key);

  @override
  State<ActiveTasks> createState() => _ActiveTasksState();
}

class _ActiveTasksState extends State<ActiveTasks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<TaskController>(
        builder: (taskController) {
          if (taskController.activeList.isEmpty) {
            return const Center(child: Text("Nothing to do! Add some goal."),);
          }
          return ListView.builder(
            itemCount: taskController.activeList.length,
            itemBuilder: (context, index) {
              final item = taskController.activeList.elementAt(index);
              return TaskItemWidget(
                taskTitle: item.toDoTitle ?? "",
                taskCompleted: item.completed ?? false,
                onDelete: (context) {},
              );
            },
          );
        }
      ),
    );
  }
}
