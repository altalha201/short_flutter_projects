import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../widgets/application_background.dart';
import '../widgets/icon_elevated_button.dart';
import 'play_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ApplicationBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: IconButton(
                    onPressed: () {},
                    splashColor: Colors.white,
                    splashRadius: 38,
                    icon: const Icon(
                      Icons.settings,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Image.asset(
              Constants.imgLogoBanner,
              width: 254,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconElevatedButton(
                    label: '1 Vs. 1',
                    iconData: Icons.people,
                    onPress: () {
                      Get.to(const PlayScreen());
                    },
                  ),
                  const SizedBox(height: 16.0,),
                  IconElevatedButton(
                    label: 'Single',
                    iconData: Icons.computer,
                    onPress: () {
                      Get.to(const PlayScreen(computerMood: true,));
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Version 1.0",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
