import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'src/constants/constants.dart';
import 'src/controller/game_play_controller.dart';
import 'src/screens/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Constants.colorLiteBlue,
      )
  );
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Tic Tac Toe",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: Constants.colorLiteBlue,
      ),
      home: const HomeScreen(),
      initialBinding: GameBindings(),
    );
  }
}

class GameBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(GamePlayController());
  }
}
