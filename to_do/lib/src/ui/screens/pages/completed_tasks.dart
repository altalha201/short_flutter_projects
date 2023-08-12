import 'package:flutter/material.dart';

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
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return TaskItemWidget(
            taskTitle: 'Code the todo',
            taskCompleted: true,
            onDelete: (context) {},
          );
        },
      ),
    );
  }
}
