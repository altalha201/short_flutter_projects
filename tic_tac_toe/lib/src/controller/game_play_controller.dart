import 'dart:math';

import 'package:get/get.dart';

import '../utils/pop_messages.dart';

class GamePlayController extends GetxController {
  int oScore = 0;
  int xScore = 0;
  int attempts = 0;
  bool oTurn = true;
  bool gamePlayOn = false;
  int filled = 0;

  bool computerMood = false;

  List<String> display = ['', '', '', '', '', '', '', '', ''];
  List<int> matchedIndexes = [];

  void updateComputerMood(bool mood) {
    computerMood = mood;
    update();
  }

  void startGamePlay() {
    if (!gamePlayOn) {
      oTurn = true;
      filled = 0;

      display = ['', '', '', '', '', '', '', '', ''];
      matchedIndexes = [];
      gamePlayOn = true;
      update();
    }
  }

  void stopGamePlay() {
    if (gamePlayOn) {
      gamePlayOn = false;
      update();
    }
  }

  void boxTapped(int index) {
    if (gamePlayOn) {
      if (oTurn && display[index] == '') {
        display[index] = 'O';
      } else if (!oTurn && display[index] == '') {
        display[index] = 'X';
      }
      filled++;
      oTurn = !oTurn;
      _checkWinner();
      update();
      if(computerMood && !oTurn) {
        List<int> emptyList = [];
        for(var i = 0; i < 9; i++){
          if(display[i] == '') {
            emptyList.add(i);
          }
        }
        var randomIndex = Random().nextInt(emptyList.length);
        emptyList.shuffle();
        boxTapped(emptyList.elementAt(randomIndex));
      }
    }
  }

  void _checkWinner() {
    bool winnerFound = false;
    String winingMessage = "";

    // row wise matching
    if (display[0] == display[1] &&
        display[1] == display[2] &&
        display[1] != '') {
      winnerFound = true;
      winingMessage = "Player ${display[1]} wins the round";
      matchedIndexes.addAll([0, 1, 2]);
    }

    if (display[3] == display[4] &&
        display[4] == display[5] &&
        display[4] != '') {
      winnerFound = true;
      winingMessage = "Player ${display[4]} wins the round";
      matchedIndexes.addAll([3, 4, 5]);
    }

    if (display[6] == display[7] &&
        display[7] == display[8] &&
        display[7] != '') {
      winnerFound = true;
      winingMessage = "Player ${display[7]} wins the round";
      matchedIndexes.addAll([6, 7, 8]);
    }

    // column wise matching
    if (display[0] == display[3] &&
        display[3] == display[6] &&
        display[3] != '') {
      winnerFound = true;
      winingMessage = "Player ${display[3]} wins the round";
      matchedIndexes.addAll([0, 3, 6]);
    }

    if (display[1] == display[4] &&
        display[4] == display[7] &&
        display[4] != '') {
      winnerFound = true;
      winingMessage = "Player ${display[4]} wins the round";
      matchedIndexes.addAll([1, 4, 7]);
    }

    if (display[2] == display[5] &&
        display[5] == display[8] &&
        display[5] != '') {
      winnerFound = true;
      winingMessage = "Player ${display[5]} wins the round";
      matchedIndexes.addAll([2, 5, 8]);
    }

    // diagonal matching
    if (display[0] == display[4] &&
        display[4] == display[8] &&
        display[4] != '') {
      winnerFound = true;
      winingMessage = "Player ${display[4]} wins the round";
      matchedIndexes.addAll([0, 4, 8]);
    }

    if (display[2] == display[4] &&
        display[4] == display[6] &&
        display[4] != '') {
      winnerFound = true;
      winingMessage = "Player ${display[4]} wins the round";
      matchedIndexes.addAll([2, 4, 6]);
    }

    // match end
    if (!winnerFound && filled == 9) {
      winingMessage = "Round draw!";
      _updateStatus(winingMessage);
    }

    if (winnerFound) {
      if (display[matchedIndexes[0]] == 'X') {
        xScore++;
      } else {
        oScore++;
      }
      _updateStatus(winingMessage);
    }
  }

  void _updateStatus(String message) {
    attempts++;
    gamePlayOn = false;
    update();
    PopMessages.showAlert(
      title: "Round ended",
      messages: message,
      onTap: () {
        Get.back();
      },
    );
  }

  void resetGame() {
    oScore = 0;
    xScore = 0;
    attempts = 0;
    oTurn = true;
    gamePlayOn = false;
    filled = 0;

    display = ['', '', '', '', '', '', '', '', ''];
    matchedIndexes = [];
  }
}
