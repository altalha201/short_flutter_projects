import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.taskTitle,
    required this.taskCompleted,
    this.onItemTap,
    this.onCheck,
    required this.onDelete,
  });

  final String taskTitle;
  final bool taskCompleted;
  final VoidCallback? onItemTap;
  final Function(bool?)? onCheck;
  final Function(BuildContext) onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: onDelete,
                icon: Icons.delete_outline,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(16.0),
              )
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.orange.shade300,
            ),
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onCheck,
                  fillColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.black.withOpacity(0.30),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                Text(
                  taskTitle,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
