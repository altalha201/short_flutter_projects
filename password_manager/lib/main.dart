import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'src/view/helper/app_theme.dart';
import 'src/view/screens/splash_page.dart';
import 'src/view_model/controllers/initial_bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

