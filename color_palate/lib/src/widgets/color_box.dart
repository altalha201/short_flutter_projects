import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../functions/main_page_functions.dart';

class ColorBox extends StatelessWidget {
  const ColorBox({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Fluttertoast.showToast(
            msg: "#${color.value.toRadixString(16).substring(2).toUpperCase()}",
            backgroundColor: color,
            webPosition: "center",
          );
        },
        onDoubleTap: () {
          MainPageFunctions.copyToClipBoard("#${color.value.toRadixString(16).substring(2).toUpperCase()}");
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
