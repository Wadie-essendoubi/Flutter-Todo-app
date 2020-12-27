import 'dart:ui';

import 'package:flutter/cupertino.dart';
 //
class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint_0 = new Paint()
      ..color = Color(0Xff0c9556)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*0.24,size.height*0.02);
    path_0.cubicTo(size.width*0.68,size.height*0.04,size.width*0.68,size.height*0.04,size.width*0.82,size.height*0.05);
    path_0.cubicTo(size.width*0.95,size.height*0.06,size.width*0.93,size.height*0.15,size.width*0.94,size.height*0.20);
    path_0.cubicTo(size.width*0.94,size.height*0.37,size.width*0.97,size.height*0.70,size.width*0.98,size.height*0.87);
    path_0.cubicTo(size.width*0.98,size.height*0.99,size.width*0.96,size.height*0.99,size.width*0.82,size.height*0.99);
    path_0.cubicTo(size.width*0.65,size.height*0.99,size.width*0.29,size.height*0.99,size.width*0.12,size.height*0.99);
    path_0.cubicTo(size.width*0.03,size.height*0.99,size.width*0.01,size.height*0.97,size.width*0.01,size.height*0.87);
    path_0.cubicTo(size.width*0.01,size.height*0.68,size.width*0.01,size.height*0.30,size.width*0.01,size.height*0.11);
    path_0.cubicTo(size.width*0.02,size.height*0.01,size.width*0.01,size.height*0.01,size.width*0.24,size.height*0.02);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
