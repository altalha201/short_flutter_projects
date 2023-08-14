import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/animation/delete.json",
                width: 200,
              ),
              const SizedBox(height: 16.0),
              AnimatedTextKit(animatedTexts: [
                TyperAnimatedText(
                  "Delete your dropped tasks",
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                      color: Colors.orange
                  ),
                  speed: const Duration(milliseconds: 100),
                )
              ],
                repeatForever: true,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 48,
        )
      ],
    );
  }
}
