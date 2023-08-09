import 'package:flutter/material.dart';

import '../constants/constants.dart';

class IconElevatedButton extends StatelessWidget {
  const IconElevatedButton({
    super.key,
    required this.label,
    required this.iconData,
    required this.onPress,
  });

  final String label;
  final IconData iconData;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Constants.colorLiteBlue,
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
        textStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          wordSpacing: 2.5,
        ),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      icon: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Icon(
          iconData,
          size: 32,
        ),
      ),
      label: Text(label),
    );
  }
}
