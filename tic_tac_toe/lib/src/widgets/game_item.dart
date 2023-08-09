import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../controller/game_play_controller.dart';

class GameItem extends StatelessWidget {
  const GameItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GamePlayController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.boxTapped(index);
          },
          child: Container(
            margin: const EdgeInsets.all(4.0),
            height: 100,
            width: 100,
            color: controller.matchedIndexes.contains(index)
                ? Constants.colorLitePurple
                : Constants.colorPurple,
            alignment: Alignment.center,
            child: Text(
              controller.display.elementAt(index),
              style: Constants.textStyleTitle.copyWith(fontSize: 64),
            ),
          ),
        );
      }
    );
  }
}
