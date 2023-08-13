import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/controller/task_controller.dart';
import 'src/ui/screens/splash_page.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "To Do",
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.orange.shade100,
      ),
      initialBinding: AppBindings(),
    );
  }
}

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TaskController());
  }
}
