import 'package:flutter/material.dart';

class MaterialRouter {
  static push(BuildContext context, Widget page) {
    Navigator.push(context, (MaterialPageRoute(builder: (context) => page)));
  }
}