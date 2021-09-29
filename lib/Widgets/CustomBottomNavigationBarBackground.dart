import 'package:flutter/material.dart';

class CustomBottomNavigationBarBackground extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;


    Path path_0 = Path();
    path_0.moveTo(size.width*0.0664667,size.height);
    path_0.quadraticBezierTo(size.width*0.0112778,size.height*0.9963750,0,size.height*0.6888125);
    path_0.cubicTo(size.width*0.0002111,size.height*0.2419375,size.width*0.0876556,size.height*0.0000625,size.width*0.1229556,0);
    path_0.cubicTo(size.width*0.3117222,0,size.width*0.6892556,0,size.width*0.8780222,0);
    path_0.cubicTo(size.width*0.9106444,size.height*-0.0017500,size.width*0.9989556,size.height*0.2550625,size.width,size.height*0.6875000);
    path_0.quadraticBezierTo(size.width*0.9894111,size.height*0.9988125,size.width*0.9330889,size.height);
    path_0.lineTo(size.width*0.0664667,size.height);
    path_0.close();

    Path path_1 = Path();
    path_1.moveTo(size.width*0.0676889,size.height*0.9738750);
    path_1.quadraticBezierTo(size.width*0.0125000,size.height*0.9702500,size.width*0.0012222,size.height*0.6626875);
    path_1.cubicTo(size.width*0.0014333,size.height*0.2158125,size.width*0.0888778,size.height*-0.0260625,size.width*0.1241778,size.height*-0.0261250);
    path_1.cubicTo(size.width*0.3129444,size.height*-0.0261250,size.width*0.6904778,size.height*-0.0261250,size.width*0.8792444,size.height*-0.0261250);
    path_1.cubicTo(size.width*0.9118667,size.height*-0.0278750,size.width*1.0001778,size.height*0.2289375,size.width*1.0012222,size.height*0.6613750);
    path_1.quadraticBezierTo(size.width*0.9906333,size.height*0.9726875,size.width*0.9343111,size.height*0.9738750);
    path_1.lineTo(size.width*0.0676889,size.height*0.9738750);
    path_1.close();



    canvas.drawShadow(path_1, Colors.black, 3, true);
    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

