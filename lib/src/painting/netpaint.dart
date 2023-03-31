import 'package:flutter/material.dart';
import '../context/paint_contexts.dart';

class NetPaint {
   Color color;   //colorGrey
   PaintContext paintContext;
   double strokeWidth;  // .5
   double yOffsetGap;
   double xOffsetGap;
   double bottomMarginRoot;
   double barGap;
   NetPaint({
    required this.paintContext,
    required this.color,
    required this.strokeWidth,
    required this.xOffsetGap,
    required this.yOffsetGap,
    required this.bottomMarginRoot,
    required this.barGap

   });
   void drawNet(){
     double incHeight = paintContext.size.height-bottomMarginRoot;
     Paint rectpaintline = Paint()..color = color ..strokeWidth=strokeWidth;
     paintContext.canvas.drawLine(Offset(paintContext.size.width,incHeight ), Offset(0,incHeight), rectpaintline);
     for (var i = 0; i <15; i++) {
       paintContext.canvas.drawLine(Offset(paintContext.size.width,incHeight - i*( yOffsetGap //barWidth
       + barGap) ), Offset(0,incHeight - i*( yOffsetGap //barWidth
       + barGap)), rectpaintline);
     
     }
   }
}