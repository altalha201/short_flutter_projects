import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/view/screens/splash_page.dart';

void main() {
  runApp(const PasswordManager());
}

class PasswordManager extends StatelessWidget {
  const PasswordManager({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Password Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.blueGrey.shade200
      ),
      home: const SplashPage(),
    );
  }
}
