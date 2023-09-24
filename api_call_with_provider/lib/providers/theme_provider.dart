import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  Color backgroundColor = Colors.blue;
  Color foregroundColor = Colors.white;

  bool foregroundIsWhite = true;

  void changeBackgroundColor(Color color) {
    backgroundColor = color;
    notifyListeners();
  }

  void changeForegroundColor() {
    foregroundColor =
    foregroundColor == Colors.white ? Colors.black : Colors.white;
    foregroundIsWhite = foregroundColor == Colors.white;
    notifyListeners();
  }
}
