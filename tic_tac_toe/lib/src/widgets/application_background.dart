import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ApplicationBackground extends StatelessWidget {
  const ApplicationBackground({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(8.0),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Constants.imgBackground,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          colorBlendMode: BlendMode.lighten,
        ),
        SafeArea(
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ],
    );
  }
}
