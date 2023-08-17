import 'package:flutter/material.dart';

void main() {
  runApp(const PasswordManager());
}

class PasswordManager extends StatelessWidget {
  const PasswordManager({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Manager',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
      ),
      home: const Scaffold(),
    );
  }
}
