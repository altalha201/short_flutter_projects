import 'package:flutter/material.dart';

import 'background_painter.dart';

class BackgroundStyle extends StatelessWidget {
  const BackgroundStyle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundPainter(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
