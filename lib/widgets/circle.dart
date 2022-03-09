import 'package:blockchain/constants.dart';
import 'package:flutter/material.dart';

class Circle extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = primaryDark;

    canvas.drawCircle(
      const Offset(0.0, 0.0), 15, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  
}