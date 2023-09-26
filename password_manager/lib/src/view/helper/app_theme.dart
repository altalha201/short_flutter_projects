import 'package:flutter/material.dart';

class AppTheme {
  static const Color colorLiteGray = Color(0xEEEEEEFF);

  static ThemeData allStyle() => ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.blueGrey.shade200,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.blueGrey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
            elevation: 5,
            minimumSize: const Size(120, 44),
          ),
        ),
      );
}
