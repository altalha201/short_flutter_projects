import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/button_controller.dart';
import '../../models/button_model.dart';
import '../helper/buttons.dart';
import '../widgets/button.dart';

class HomeButtonArea extends StatelessWidget {
  const HomeButtonArea({
    super.key,
  });

  void onPress(ButtonModel preferences) {
    var controller = Get.find<ButtonController>();
    switch (preferences.buttonBackground) {
      case Colors.grey:
        controller.onSymbolButtonPress(preferences.buttonText);
        break;
      case Colors.orange:
        controller.onOparationalButtonPress(preferences.buttonText);
        break;
      default:
        controller.onNumericButtonPress(preferences.buttonText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        shrinkWrap: true,
        itemCount: Buttons.buttons.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var current = Buttons.buttons.elementAt(index);
          return Button(
            preferences: current,
            onTap: () => onPress(current),
          );
        },
      ),
    );
  }
}
