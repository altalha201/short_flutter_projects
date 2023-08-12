import 'package:flutter/material.dart';

import 'pages/active_tasks.dart';
import 'pages/completed_tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          onPressed: () {},
          child: const Icon(Icons.add, color: Colors.white,),
        ),
      ),
    );
  }
}
