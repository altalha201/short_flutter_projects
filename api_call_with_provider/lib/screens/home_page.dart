import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todo_provider.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/todo_item.dart';
import 'menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) async {
      await Provider.of<ToDoProvider>(context, listen: false).getAllToDos();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _homeAppBarSection(context),
      body: _homeBodySection(),
    );
  }

  Padding _homeBodySection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<ToDoProvider>(
        builder: (context, todoProvider, child) {
          if (todoProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CupertinoScrollbar(
            child: ListView.builder(
              itemCount: todoProvider.todos.length,
              itemBuilder: (context, index) {
                return TodoItem(todo: todoProvider.todos.elementAt(index));
              },
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _homeAppBarSection(BuildContext context) {
    return commonAppBar(
      context: context,
      title: widget.title,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MenuPage(),
              ),
            );
          },
          icon: const Icon(Icons.menu),
        ),
      ],
    );
  }
}
