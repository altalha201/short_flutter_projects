import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/view/helper/app_theme.dart';
import 'src/view/screens/splash_page.dart';
import 'src/view_model/controllers/initial_bindings.dart';

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
      theme: AppTheme.allStyle(),
      initialBinding: InitialBindings(),
      home: const SplashPage(),
    );
  }
}

