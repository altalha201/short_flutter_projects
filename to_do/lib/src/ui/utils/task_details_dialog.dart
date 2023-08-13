import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/todo_mode.dart';

class TaskDetailsDialog extends StatelessWidget {
  const TaskDetailsDialog({Key? key, required this.task}) : super(key: key);

  final ToDoModel task;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        task.toDoTitle ?? "",
        textAlign: TextAlign.center,
      ),
      clipBehavior: Clip.antiAlias,
      contentPadding: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      contentTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black87,
        fontWeight: FontWeight.w500
      ),
      content: SizedBox(
        height: 52,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Task Status: ${(task.completed ?? false) ? "Completed" : "Active"}"),
            const SizedBox(
              height: 8.0,
            ),
            Text(
                "Task Created: ${DateFormat("dd MMM, yyyy").format(DateTime.parse(task.createdTime ?? ""))}"),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
