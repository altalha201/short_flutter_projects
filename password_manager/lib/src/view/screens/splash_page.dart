import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/src/view/screens/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 5)).then((value) {
        Get.off(
          const LoginPage(),
          transition: Transition.downToUp,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.rotate(
                angle: _animationController.value * 2 * pi,
                child: Image.asset(
                  'assets/app_assets/icon_logo.png',
                  width: 200,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
