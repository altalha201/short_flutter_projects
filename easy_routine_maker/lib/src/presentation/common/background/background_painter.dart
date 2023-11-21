import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    Path fullShade = Path();
    Paint fullShadePaint = Paint()..color = Colors.blue.shade50;
    backgroundShade(size, fullShade, fullShadePaint);
    canvas.drawPath(fullShade, fullShadePaint);

    // first round
    Path firstPath = Path();
    Paint firstPaint = Paint()..color = Colors.blue.shade200;
    Size firstSize = Size(size.width, size.height * 0.5);
    customArc(firstSize, firstPath, firstPaint);
    canvas.drawPath(firstPath, firstPaint);

    //second arc
    Path secPath = Path();
    Paint secPaint = Paint()..color = Colors.blue.shade300;
    Size secondSize = Size(size.width, size.height * 0.45);
    customArc(secondSize, secPath, secPaint);
    canvas.drawPath(secPath, secPaint);

    //third arc
    Path thirdPath = Path();
    Paint thirdPaint = Paint()..color = Colors.blue.shade400;
    Size thirdSize = Size(size.width, size.height * 0.40);
    customArc(thirdSize, thirdPath, thirdPaint);
    canvas.drawPath(thirdPath, thirdPaint);

    //shade
    Path shadePath = Path();
    Paint shadePaint = Paint()..color = Colors.blue.withOpacity(0.15);
    Size shadeSize = Size(size.width, size.height * 0.5);
    drawShade(shadeSize, shadePath, shadePaint);
    canvas.drawPath(shadePath, shadePaint);
  }

  void drawShade(Size size, Path path, Paint paint) {
    double usableHeight = size.height - 96;
    path.lineTo(0, usableHeight);

    var gravity = Offset(size.width * 0.5, size.height);
    var endPoint = Offset(size.width, usableHeight);
    path.quadraticBezierTo(gravity.dx, gravity.dy, endPoint.dx, endPoint.dy);

    endPoint = Offset(size.width * 0.25, 0);
    gravity = Offset(size.width * 0.5, size.height * 0.5);

    path.quadraticBezierTo(gravity.dx, gravity.dy, endPoint.dx, endPoint.dy);

  }

  void customArc(Size size, Path path, Paint paint) {
    double usableHeight = size.height - 96;
    path.lineTo(0, usableHeight);

    var gravity = Offset(size.width * 0.5, size.height);
    var endPoint = Offset(size.width, usableHeight);

    path.quadraticBezierTo(gravity.dx, gravity.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, usableHeight);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  void backgroundShade(Size size, Path path, Paint paint) {
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.45);

    var endPoint = const Offset(0, 0);
    var gravity = Offset(size.width * 0.15, size.height * 0.75);

    path.quadraticBezierTo(gravity.dx, gravity.dy, endPoint.dx, endPoint.dy);
  }
}