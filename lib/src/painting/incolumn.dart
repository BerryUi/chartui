import 'package:flutter/material.dart';
import '../context/paint_contexts.dart';

class PaintInvertColumnBar{
  PaintContext paintContext;
  List<double> listData;
  List<Color> barColorList;
  double barWidth;
  double top = 0;
  double yOffsetGap;
  double xOffsetGap;
  Offset offsetLocal;
  double leftMarginRoot;
  double bottomMarginRoot;
  double? right;
  double barGap;
  double bottom =0;
  double yLabelWidth;
  double barHeightAllotVar;
   PaintInvertColumnBar({
    required this.xOffsetGap,
    required this.barColorList,
    required this.yLabelWidth,
    required this.barHeightAllotVar,
    required this.yOffsetGap,
    required this.offsetLocal,
    required this.leftMarginRoot,
    required this.listData,
    required this.paintContext,
    required this.barWidth,
    required this.barGap,
    required this.bottomMarginRoot
    });
   

   void paint(){
     
      // double xtop = paintContext.size.height - bottomMarginRoot ;// top+30;
      for (var i = 0; i <listData.length; i++) {
        Paint paint = Paint()..color =barColorList[i%barColorList.length];
        double right = leftMarginRoot + barWidth;
        double div =0;
        double bottom = barHeightAllotVar* listData[i];
        paintContext.canvas.drawRect(Rect.fromLTRB(leftMarginRoot,div,right,bottom)
          , paint);
        leftMarginRoot = leftMarginRoot + xOffsetGap;
      }
   }
}