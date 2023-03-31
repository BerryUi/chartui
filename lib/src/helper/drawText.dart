// ignore: filenames
// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../context/paint_contexts.dart';

class DrawText {

    PaintContext paintContext;
    String text;
    TextStyle textStyle;
    double maxWidth;
    DrawText({
      required this.paintContext,
      required this.text,
      required this.maxWidth,
      required this.textStyle
    });
    TextPainter measureText(){
     final span = TextSpan(text:text,style:textStyle);
     final tp = TextPainter(text: span,textAlign:TextAlign.center,textDirection: TextDirection.ltr);
     tp.layout(minWidth: 0, maxWidth: maxWidth);
     return tp;
    }
      Size drawTextCentered(Offset c,) {
        final tp = measureText();
        final pos = c+Offset(-tp.width/2, -tp.height/2);
        tp.paint(paintContext.canvas, pos);
        return tp.size;
      }
}

