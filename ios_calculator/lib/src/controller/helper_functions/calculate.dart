import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class Calculate {
  static String evaluate(String fullExpression) {
    try {
      fullExpression = fullExpression.replaceAll("×", "*").replaceAll("÷", "/");
      var result = fullExpression.interpret();
      return result.toString();
    } catch (e) {
      debugPrint(e.toString());
      return "Syntax Error";
    }
  }
}
