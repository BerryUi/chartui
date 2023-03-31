import 'dart:math';

import 'package:flutter/material.dart';

class CustomTextPainter {
  Size size;
  Canvas canvas;
  Paint midpaint = Paint()..color = Colors.pink.shade50 ..style = PaintingStyle.fill;
  TextStyle labelStyle;
  CustomTextPainter({required this.size,
    required this.canvas,required this.labelStyle});
  TextPainter measureText({
        required String text , required TextStyle style , required double maxWidth , required TextAlign align
      }){
        final span = TextSpan(text: text,style: style);
        final tp = TextPainter(text: span,textAlign: align,textDirection: TextDirection.ltr);
        tp.layout(minWidth: 0,maxWidth: maxWidth);
        return tp;
      }
  Size drawTextCentered({required Offset offset, required String text , required TextStyle style , required double maxWidth,required Function (Size sz) bgCb }){
     TextStyle modified = labelStyle.copyWith(fontSize:size.width/30);
     final tp = measureText(text: text, style:modified, maxWidth:maxWidth, align:TextAlign.center);
     final pos = offset + Offset(-tp.width/2, -tp.height/2);
     tp.paint(canvas,pos);
     bgCb(tp.size);
     return tp.size;

  }
  void drawLabels(double radius, double startAngle, Offset c,double sweepAngle, String label) {
     final r = radius* 0.4;
     final dx = r*cos(startAngle + sweepAngle/2);
     final dy = r*sin(startAngle + sweepAngle/2);
     final position = c + Offset(dx, dy);
     drawTextCentered(offset:position, text:label, style: labelStyle, maxWidth:size.width/7,
     bgCb: (Size sz){
      // final rect = Rect.fromCenter(center:position, width:sz.width+5, height:sz.height+5);
      // final rrect = RRect.fromRectAndRadius(rect,Radius.circular(5));
      // canvas.drawRRect(rrect, midpaint);
     }
     );


  }
}