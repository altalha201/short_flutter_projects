import 'package:flutter/material.dart';

import 'home_button_area.dart';
import 'home_focus_area.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          FocusArea(),
          HomeButtonArea(),
        ],
      ),
    );
  }
}

