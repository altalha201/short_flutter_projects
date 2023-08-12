import 'package:flutter/material.dart';

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
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return TaskItemWidget(
            taskTitle: 'Code the todo',
            taskCompleted: false,
            onDelete: (context) {},
          );
        },
      ),
    );
  }
}
