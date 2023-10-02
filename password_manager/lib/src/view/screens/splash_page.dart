import 'dart:math';

import 'package:flutter/material.dart';

import '../helper/navigation_helper.dart';
import '../helper/view_constants.dart';
import 'main_screen/home_page.dart';
// import 'login_screen/login_page.dart';

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
        // NavigationHelper.offAll(const LoginPage());
        NavigationHelper.offAll(const HomePage());
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
                  ViewConstants.iconLogoImg,
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
