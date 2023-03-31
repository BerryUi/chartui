import 'package:flutter/material.dart';
import '../context/paint_contexts.dart';

class PaintColumnBar{
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
  // Color color;
  double barHeightAllotVar;
  // bool isRefactored;
  // Function offRefactor;
   PaintColumnBar({
    required this.xOffsetGap,
    required this.barColorList,
    required this.yLabelWidth,
    required this.barHeightAllotVar,
    required this.yOffsetGap,
    required this.offsetLocal,
    required this.leftMarginRoot,
    required this.listData,
    required this.paintContext,
    // required this.color,
    required this.barWidth,
    required this.barGap,
    // required this.isRefactored,
    // required this.offRefactor,
    required this.bottomMarginRoot
    });
   

   void paint(){
     
      double xtop = paintContext.size.height - bottomMarginRoot ;// top+30;
      for (var i = 0; i <listData.length; i++) {
        Paint paint = Paint()..color =barColorList[i%barColorList.length];
        // top =top +barGap  +  yOffsetGap;   // barWidth ;
        bottom = xtop;// + barWidth;
        
        double right = leftMarginRoot + barWidth;
        double div = paintContext.size.height -bottomMarginRoot - 
         barHeightAllotVar* listData[i];
        paintContext.canvas.drawRect(Rect.fromLTRB(leftMarginRoot,div,right,bottom)
          , paint);
        leftMarginRoot = leftMarginRoot + xOffsetGap;
      }
   }
}










// _________________________WATERFALL____________________

// void paint(){
//     _calculateTop();    //
//       // List<double> revList 
//       print("column");
//       double xtop = top-40;
//       listData = listData.reversed.toList();
//       for (var i = 0; i <listData.length; i++) {
//         Paint paint = Paint()..color =barColorList[i%barColorList.length];
//         top =top +barGap  +  yOffsetGap;   // barWidth ;
//         bottom = xtop;// + barWidth;
//         leftMarginRoot = leftMarginRoot + xOffsetGap;
//         double right = leftMarginRoot + barWidth;

//         // final barf = Rect.fromLTRB(leftMarginRoot, top,yLabelWidth+ barHeightAllotVar* listData[i],bottom);
//         // paintContext.canvas.drawRect(barf, paint);

//         paintContext.canvas.drawRect(Rect.fromLTRB(leftMarginRoot, top,right,bottom)
//           , paint);
//       }
//    }