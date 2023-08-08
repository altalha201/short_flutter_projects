import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainPageFunctions {
  static void copyToClipBoard(String text) {
    // coping the text sent from the call back
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      Fluttertoast.showToast(
          msg: "Color code copied",
          webPosition: "center",
          backgroundColor: Colors.green);
    });
  }

  // generate new color list using random
  static List<Color> generateColors() {
    int length = Random().nextInt(5) + 2;
    /*
          Random generates integer between 0 to max given in nextInt(int max).
          As we need at least 2 color to create a color palate and the maximum
          is 7, we use "Random().nextInt(5) + 2" to randomly select a length.

          nextInt(5) will select integer between 0 and 5,
          + 2 will set it to between 2 and 7.
     */
    List<Color> colorList = [];
    for (var i = 0; i < length; i++) {
      /*
          As we know RGB color form gets 3 color in range 0 to 255. So, we use
          nextInt(255) for each color in the formRGBO(r, g, b, o). And set the
          opacity to 1.0 which is the maximum visibility.
       */
      colorList.add(
        Color.fromRGBO(
          Random().nextInt(255),
          Random().nextInt(255),
          Random().nextInt(255),
          1.0,
        ),
      );
    }
    return colorList;
  }
}
