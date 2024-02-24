import 'package:flutter/material.dart';

import '../../models/button_model.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.onTap,
    required this.preferences,
  });

  final VoidCallback? onTap;
  final ButtonModel preferences;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(80),
      child: Container(
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: preferences.buttonBackground,
          borderRadius: BorderRadius.circular(70),
        ),
        alignment: Alignment.center,
        child: Text(
          preferences.buttonText,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: preferences.buttonForeground,
          ),
        ),
      ),
    );
  }
}
