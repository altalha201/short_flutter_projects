import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/score_box.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key, this.computerMood = false}) : super(key: key);

  final bool computerMood;

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int oScore = 0;
  int xScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.colorBlue,
      body: Container(
        constraints: const BoxConstraints(maxWidth: 480),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ScoreBox(
                      score: oScore,
                      playerName: "Player O",
                    ),
                    ScoreBox(
                      score: xScore,
                      playerName: "Player X",
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        color: Constants.colorPurple,
                        alignment: Alignment.center,
                        child: Text("X", style: Constants.textStyleTitle.copyWith(fontSize: 64),),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
