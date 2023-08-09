import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../controller/game_play_controller.dart';
import '../utils/pop_messages.dart';
import '../widgets/game_item.dart';
import '../widgets/icon_elevated_button.dart';
import '../widgets/score_box.dart';
import 'home_screen.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key, this.computerMood = false}) : super(key: key);

  final bool computerMood;

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      PopMessages.showAlert(
        title: "Alert",
        messages:
        "Tap Start to start the game play.\nTaping Stop will cause end of the match."
            "\nO will always be the first.",
        onTap: () {
          Get.back();
        },
      );
      Get.find<GamePlayController>().updateComputerMood(widget.computerMood);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.colorBlue,
      body: GetBuilder<GamePlayController>(builder: (controller) {
        return SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: !controller.gamePlayOn,
                      replacement: const SizedBox.shrink(),
                      child: IconButton(
                        onPressed: _onEnd,
                        icon: const Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ScoreBox(
                            score: controller.oScore,
                            playerName: widget.computerMood ? "Player" : "Player O",
                          ),
                          ScoreBox(
                            score: controller.xScore,
                            playerName: widget.computerMood ? "Auto" : "Player X",
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GameItem(
                                index: 0,
                              ),
                              GameItem(
                                index: 1,
                              ),
                              GameItem(
                                index: 2,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GameItem(
                                index: 3,
                              ),
                              GameItem(
                                index: 4,
                              ),
                              GameItem(
                                index: 5,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GameItem(
                                index: 6,
                              ),
                              GameItem(
                                index: 7,
                              ),
                              GameItem(
                                index: 8,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Visibility(
                          visible: controller.gamePlayOn,
                          replacement: IconElevatedButton(
                            label: "Start",
                            iconData: Icons.play_arrow,
                            onPress: () {
                              controller.startGamePlay();
                            },
                          ),
                          child: IconElevatedButton(
                            label: "Stop",
                            iconData: Icons.stop,
                            onPress: _onEnd,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void _onEnd() {
    var controller = Get.find<GamePlayController>();
    controller.stopGamePlay();
    String message;
    if (controller.oScore == controller.xScore) {
      message = "The game is draw!";
    } else if (controller.oScore > controller.xScore) {
      message = widget.computerMood ? "Player Wins!" : "Player O is the winner!";
    } else {
      message = widget.computerMood ? "Computer Wins!" : "Player X is the winner";
    }
    PopMessages.showAlert(
      title: "Game Finished",
      messages: message,
      onTap: () {
        Get.back();
        Get.offAll(const HomeScreen());
      },
    );
  }

  @override
  void dispose() {
    Get.find<GamePlayController>().resetGame();
    super.dispose();
  }
}
