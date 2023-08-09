import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ScoreBox extends StatelessWidget {
  const ScoreBox({
    super.key,
    required this.score, required this.playerName,
  });

  final int score;
  final String playerName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          playerName,
          style: Constants.textStyleTitle,
        ),
        Text(
          score.toString(),
          style:
          Constants.textStyleTitle.copyWith(fontSize: 32),
        ),
      ],
    );
  }
}
