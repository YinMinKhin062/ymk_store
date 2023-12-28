import 'package:flutter/material.dart';

class CustomCurvedEdges extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double h, w;
    h = size.height;
    w = size.width;

    final path = Path();
    path.lineTo(0, h); //(x:0,y:400)

    final firstCurve = Offset(0, h - 20);
    final lastCurve = Offset(30, h - 20);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx,
        lastCurve.dy); //first cure (x1:0,y:380,x2:30,y2:380)

    final secondFirstCurve = Offset(0, h - 20);
    final secondLastCurve = Offset(w - 30, h - 20);
    path.quadraticBezierTo(
        secondFirstCurve.dx,
        secondFirstCurve.dy,
        secondLastCurve.dx,
        secondLastCurve.dy); //second curve  (x1:0,y:380,x2:w-30,y2:380)

    final thirdFirstCurve = Offset(w, h - 20);
    final thirdLastCurve = Offset(w, h);
    path.quadraticBezierTo(
        thirdFirstCurve.dx,
        thirdFirstCurve.dy,
        thirdLastCurve.dx,
        thirdLastCurve.dy); //third curve (x1:w,y:380,x2:w,y2:400)

    path.lineTo(w, 0); //(x:400,y:0)
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
