import 'dart:math';
import 'package:chartui/chart_item.dart';
import 'package:chartui/src/layout/layout.dart';
import 'package:flutter/material.dart';
import 'context/paint_contexts.dart';

class PyramidLayout implements DesignLayout {

  PaintContext paintContext;
  List<PyramidData> data;
  PyramidLayout({
    required this.paintContext,
    required this.data
  });

  @override
  void designLayout() {
      Canvas canvas = paintContext.canvas;
      Size size = paintContext.size;
      // Paint paint = Paint()..color=Colors.pinkAccent;
      Paint paint2 = Paint()..color=const Color.fromARGB(255, 14, 12, 12);
      // canvas.drawPaint(paint);

      canvas.drawLine(Offset(size.width/2,0), Offset(0, size.height/2), paint2);
      canvas.drawLine(Offset(size.width/2,0), Offset(size.width, size.height/2), paint2);
      canvas.drawLine(Offset(0, size.height/2), Offset(size.width, size.height/2), paint2);



      
      
      double singleSlot = (size.height/2)/data.length;

      canvas.drawLine(Offset(singleSlot* tan((size.height/2)/(size.width/2)), singleSlot), Offset(size.width/2+ (singleSlot*tan(45)), singleSlot), paint2);
      
      

    //  for (var i = 0; i < 5; i++) {
    //   singleSlot+=singleSlot;
    //     canvas.drawLine(Offset(0, singleSlot), Offset(size.width, singleSlot), paint2);

    //  }






  }

}