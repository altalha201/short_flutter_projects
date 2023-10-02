import 'package:flutter/material.dart';

import 'home_app_bar.dart';
import 'home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: HomeBody(),
    );
  }
}