import 'package:blockchain/color.dart';
import 'package:flutter/material.dart';

class Circle extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = primaryDark;

    canvas.drawCircle(
      const Offset(0.0, 0.0), 15
      , paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  
}

class TintCircle extends CustomPainter {
   @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = circleColor;

    canvas.drawCircle(const Offset(0.0,1.0), 15, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw false;
  }
}
