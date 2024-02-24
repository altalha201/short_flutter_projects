import 'package:flutter/material.dart';

import '../../models/button_model.dart';

class Buttons {
  static List<ButtonModel> buttons = [
    // First Row
    ButtonModel("C", Colors.grey, Colors.black),
    ButtonModel("DEL", Colors.grey, Colors.black),
    ButtonModel("%", Colors.grey, Colors.black),
    ButtonModel("÷", Colors.orange, Colors.white),

    // Second Row
    ButtonModel("1", Colors.grey.shade800, Colors.white),
    ButtonModel("2", Colors.grey.shade800, Colors.white),
    ButtonModel("3", Colors.grey.shade800, Colors.white),
    ButtonModel("×", Colors.orange, Colors.white),

    // Third Row
    ButtonModel("4", Colors.grey.shade800, Colors.white),
    ButtonModel("5", Colors.grey.shade800, Colors.white),
    ButtonModel("6", Colors.grey.shade800, Colors.white),
    ButtonModel("-", Colors.orange, Colors.white),


    // Fourth Row
    ButtonModel("7", Colors.grey.shade800, Colors.white),
    ButtonModel("8", Colors.grey.shade800, Colors.white),
    ButtonModel("9", Colors.grey.shade800, Colors.white),
    ButtonModel("+", Colors.orange, Colors.white),


    // Fifth Row
    ButtonModel("0", Colors.grey.shade800, Colors.white),
    ButtonModel(".", Colors.grey.shade800, Colors.white),
    ButtonModel("±", Colors.grey, Colors.black),
    ButtonModel("=", Colors.orange, Colors.white),
  ];
}
