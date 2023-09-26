import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/todo_model.dart';
import '../providers/theme_provider.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo});

  final ToDoModel todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _idSection(),
      title: Text(
        todo.title ?? "title",
        style: TextStyle(
          color: (todo.completed ?? false) ? Colors.grey : Colors.black,
        ),
      ),
    );
  }

  Consumer<ThemeProvider> _idSection() {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return CircleAvatar(
          backgroundColor: themeProvider.backgroundColor,
          child: Text(
            todo.id.toString(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: themeProvider.foregroundColor,
                ),
          ),
        );
      },
    );
  }
}
