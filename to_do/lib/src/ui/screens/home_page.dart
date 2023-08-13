import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/task_controller.dart';
import '../utils/task_add_dialog.dart';
import 'home_tabs/active_tasks.dart';
import 'home_tabs/completed_tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _controller = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "To Do",
            style: TextStyle(color: Colors.white),
          ),
          bottom: const TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: "Active Tasks",
              ),
              Tab(
                text: "Completed Tasks",
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ActiveTasks(),
            CompletedTasks(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return TaskAddDialog(
                  controller: _controller,
                  formKey: _formKey,
                  validator: (value) {
                    if(value?.isEmpty ?? true) {
                      return "Enter a title.";
                    }
                    return null;
                  },
                  onAdd: () {
                    if (_formKey.currentState!.validate()) {
                      Get.find<TaskController>().addToList(_controller.text);
                      _controller.clear();
                      Navigator.of(context).pop();
                    }
                  },
                );
              },
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
