import 'package:flutter/material.dart';

import '../helper/app_theme.dart';

class FloatingTextButton extends StatelessWidget {
  const FloatingTextButton({
    super.key,
    required this.onTap,
    required this.firstText,
    required this.secondText,
    this.firstTextColor = AppTheme.colorLiteGray,
    this.secondTextColor = Colors.blueGrey,
    this.positioned = true,
  });

  final VoidCallback onTap;
  final String firstText;
  final String secondText;
  final Color firstTextColor;
  final Color secondTextColor;
  final bool positioned;

  @override
  Widget build(BuildContext context) {
    if (!positioned) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 48.0),
        child: _mainButton(),
      );
    }
    return Positioned(
      right: 0.0,
      left: 0.0,
      bottom: 52.0,
      child: _mainButton(),
    );
  }

  TextButton _mainButton() {
    return TextButton(
      onPressed: onTap,
      child: RichText(
        text: TextSpan(
          text: firstText,
          style: TextStyle(color: firstTextColor),
          children: [
            TextSpan(
              text: "  $secondText",
              style: TextStyle(
                color: secondTextColor,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
