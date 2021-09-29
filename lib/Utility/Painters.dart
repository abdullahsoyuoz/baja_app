import 'package:baja_app/Utility/Colors.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class NotReadyYetBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..shader = ui.Gradient.linear(Offset(0, 0), Offset(0, 200),
          [BajaAppColors.grad1, BajaAppColors.grad2])
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0664667, size.height);
    path_0.quadraticBezierTo(size.width * 0.0112778, size.height * 0.9963750, 0,
        size.height * 0.6888125);
    path_0.cubicTo(
        size.width * 0.0002111,
        size.height * 0.2419375,
        size.width * 0.0876556,
        size.height * 0.0000625,
        size.width * 0.1229556,
        0);
    path_0.cubicTo(size.width * 0.3117222, 0, size.width * 0.6892556, 0,
        size.width * 0.8780222, 0);
    path_0.cubicTo(
        size.width * 0.9106444,
        size.height * -0.0017500,
        size.width * 0.9989556,
        size.height * 0.2550625,
        size.width,
        size.height * 0.6875000);
    path_0.quadraticBezierTo(size.width * 0.9894111, size.height * 0.9988125,
        size.width * 0.9330889, size.height);
    path_0.lineTo(size.width * 0.0664667, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class DiscountBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..shader = ui.Gradient.linear(Offset(0, 0), Offset(0, 200),
          [BajaAppColors.grad1, BajaAppColors.grad2])
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.7243478);
    path_0.cubicTo(
        size.width * -0.0004048,
        size.height * 0.2921739,
        size.width * 0.3292381,
        size.height * 0.0018551,
        size.width * 0.6408095,
        size.height * 0.0016812);
    path_0.quadraticBezierTo(size.width * 0.6704881, size.height * 0.0016449,
        size.width * 0.7595238, size.height * 0.0015362);
    path_0.quadraticBezierTo(size.width * 0.9865714, size.height * 0.0113913,
        size.width, size.height * 0.2509275);
    path_0.cubicTo(
        size.width * 0.9731905,
        size.height * 0.8781159,
        size.width * 0.5145000,
        size.height * 1.0033623,
        size.width * 0.3666667,
        size.height);
    path_0.cubicTo(size.width * 0.3370714, size.height, size.width * 0.2778810,
        size.height, size.width * 0.2482857, size.height);
    path_0.cubicTo(
        size.width * 0.1860714,
        size.height * 1.0035942,
        size.width * 0.0098810,
        size.height * 1.0039420,
        0,
        size.height * 0.7243478);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}