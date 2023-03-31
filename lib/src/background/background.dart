import 'package:chartui/src/context/offset.dart';
import 'package:chartui/src/painting/netpaint.dart';
import 'package:flutter/material.dart';

import '../context/paint_contexts.dart';

class BackGroundDrawer {
  bool drawNet;
  PaintContext paintContext;
  Color backgroundColor;
  double bottomMarginRoot;
  OffsetContext offsetContext;
  Color netColor;
  double netStrokeWidth;
  double barGap;
  BackGroundDrawer({
    required this.drawNet,
    required this.paintContext,
    required this.backgroundColor,
    required this.offsetContext,
    required this.netColor,
    required this.netStrokeWidth,
    required this.bottomMarginRoot,
    required this.barGap
  });
  
  void _setSize(){
        final clipRect = Rect.fromLTWH(0, 0,paintContext.size.width,paintContext.size.height);
        paintContext.canvas.clipRect(clipRect);
  }
  void _setColor(){
      paintContext.canvas.drawPaint(Paint()..color =backgroundColor);
  }

  void _drawNet(){
     NetPaint(
      paintContext: paintContext,
      color:netColor, 
      strokeWidth:netStrokeWidth, 
      xOffsetGap: offsetContext.xOffsetGap, 
      yOffsetGap:offsetContext.yOffsetGap, 
      bottomMarginRoot: bottomMarginRoot, 
      barGap:barGap).drawNet();
  }
  void draw(){
     _setSize();
     _setColor();
     if(drawNet){
      _drawNet();
     }
  }
  

}


