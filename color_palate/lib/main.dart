import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/screen/main_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.deepOrange,
      )
  ); // for changing the color of status bar without the appbar
  runApp(const ColorPalate());
}

class ColorPalate extends StatelessWidget {
  const ColorPalate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Color Palate",
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      themeMode: ThemeMode.light, // set the theme to always light
    );
  }
}
