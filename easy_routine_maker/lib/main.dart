import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/presentation/helper/app_theme.dart';
import 'src/presentation/screens/welcome_screen/welcome_page.dart';
import 'src/providers/providers.dart';

void main() {
  runApp(const RoutineMaker());
}

class RoutineMaker extends StatelessWidget {
  const RoutineMaker({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.all,
      child: MaterialApp(
        title: 'Easy Routine Maker',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppTheme.theme(),
        home: const WelcomePage(),
      ),
    );
  }
}
