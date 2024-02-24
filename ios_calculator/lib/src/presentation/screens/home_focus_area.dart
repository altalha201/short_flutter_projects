import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/button_controller.dart';

class FocusArea extends StatelessWidget {
  const FocusArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: size.width,
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GetBuilder<ButtonController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  controller.finalText,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.end,
                ),
                Text(
                  controller.pointerText,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                  ),
                  textAlign: TextAlign.end,
                )
              ],
            );
          }
      ),
    );
  }
}