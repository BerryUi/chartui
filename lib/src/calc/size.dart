import 'package:chartui/src/calc/mnmx.dart';
import 'package:flutter/material.dart';

import '../context/paint_contexts.dart';

class DrawableSize {
    double drawableHeight;
    double drawableWidth;
    //_________________________Modified
    final Offset cXlabelOffsetStart;     //______LEGIT_BYME
    final Offset cYlabelOffsetStart;     //______LEGIT_BYME

    //super__modified;

    double singleIncrementY;
    double singleIncrementX;
    double drawableYGap;
    double drawableXGap;

    DrawableSize({
      required this.drawableHeight,
      required this.drawableWidth,
      //_________________________Modified
      required this.cXlabelOffsetStart,
      required this.cYlabelOffsetStart,
      //__super_modified
      required this.drawableXGap,
      required this.drawableYGap,
      required this.singleIncrementX,
      required this.singleIncrementY,
    });

   
}












class SizeCalculas {

    List<double>? y;
    List<double> x;

    
   final minMaxInstance = MinMax();

    double noYSection;
    double noXSection;

  
    var maxY = -double.maxFinite;
    var maxX = -double.maxFinite;

    double bottomMarginRoot;
    double labelWidth;
    double barWidth;
    PaintContext paintContext;

    SizeCalculas({
      required this.x,
      required this.y,
      required this.noXSection,
      required this.noYSection,
      required this.bottomMarginRoot,
      required this.labelWidth,
      required this.paintContext,
      required this.barWidth
      });
    
    DrawableSize getDrawableSize(){

       final drawableHeight = paintContext.size.height - bottomMarginRoot; 
       final drawableWidth = paintContext.size.width - labelWidth;
       //_________________________Modified
    
       final cXlabelOffset = Offset(labelWidth + barWidth/2 ,drawableHeight + 10  );
       final cYlabelOffset = Offset(labelWidth/2,drawableHeight);
       
        maxY = minMaxInstance.getMax(list:y ?? [])+200;              //-------------------->>> 200 added new
        maxX = minMaxInstance.getMax(list:x);  

       
       return DrawableSize(
        drawableHeight: drawableHeight, 
        drawableWidth: drawableWidth,
        cXlabelOffsetStart: cXlabelOffset,
        cYlabelOffsetStart: cYlabelOffset,
        singleIncrementX:maxX/noXSection,
        singleIncrementY: maxY/noYSection,
        drawableYGap: y==null ? barWidth: drawableHeight/noYSection,
        drawableXGap: x.isEmpty? barWidth : drawableWidth/noXSection
       );
    
    }
 
}