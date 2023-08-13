import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controller/database_controller.dart';
import '../../controller/task_controller.dart';
import 'first_load_up_page.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
      reverseDuration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2)).then((_) async {
        final taskController = Get.find<TaskController>();
        await taskController.getListFromDatabase();
        if (taskController.firstLoadUp) {
          await taskController
              .addToList("Welcome to your new ToDo Application");
          await taskController.addToList("Complete your application tour");
          await DatabaseController.setFirstLoadUp();
          Get.offAll(
            const FirstLoadUpPage(),
            transition: Transition.downToUp,
          );
        } else {
          Get.offAll(
            const HomePage(),
            transition: Transition.downToUp,
          );
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Transform.scale(
                scale: 1.0 + (_controller.value * 0.1),
                child: Image.asset(
                  "assets/logo.png",
                  width: 150,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
