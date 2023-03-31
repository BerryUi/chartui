import 'package:chartui/src/calc/path.dart';
import 'package:flutter/material.dart';
import '../context/paint_contexts.dart';

class AreaPainting{
  PaintContext paintContext;
  List<double> listDataY;
  List<double> listDataX;
  double barWidth;
  Color lineColor;
  double lineWidth;
  double top = 0;
  double yOffsetGap;
  double xOffsetGap;
  Offset offsetLocal;
  double leftMarginRoot;
  double bottomMarginRoot;
  double barHeightAllotVarX;
  double? right;
  double barGap;
  double bottom =0;
  double yLabelWidth;
  double barHeightAllotVarY;
  AreaPainting({
    required this.lineColor,
    required this.lineWidth,
    required this.xOffsetGap,
    required this.yLabelWidth,
    required this.barHeightAllotVarY,
    required this.barHeightAllotVarX,
    required this.yOffsetGap,
    required this.offsetLocal,
    required this.leftMarginRoot,
    required this.listDataY,
    required this.paintContext,
    required this.barWidth,
    required this.barGap,
    required this.bottomMarginRoot,
    required this.listDataX
    });

   void paint(){

      
      int lengthY = listDataY.length;
      final bindXY = {};
      if(listDataX.isNotEmpty){
          for (var i = 0; i <lengthY; i++) {
            bindXY[listDataX[i]] = listDataY[i];
          }
      }


      listDataX.sort();
      
      List<Offset> points =[];
      double dx = leftMarginRoot;

      double remX = leftMarginRoot;

      points.add(Offset(leftMarginRoot,paintContext.size.height -bottomMarginRoot));

      points.add(Offset(leftMarginRoot,paintContext.size.height -bottomMarginRoot-barHeightAllotVarY*(listDataX.isNotEmpty ? bindXY[listDataX[0]] :listDataY[0])));

      double xtop = paintContext.size.height - bottomMarginRoot ;



      for (var i = 0; i <lengthY; i++) {
        bottom = xtop;


        //__________correction of Xaxis Double type data doned later ________________//



        double divY = paintContext.size.height -bottomMarginRoot - barHeightAllotVarY*  (listDataX.isNotEmpty ? bindXY[listDataX[i]] :listDataY[i] );          //listDataY[i];
        double divX =0;// = dx+barHeightAllotVarX * listDataX[i];
        listDataX.isEmpty ? divX =remX+ 40 : dx+barHeightAllotVarX * listDataX[i];
        remX = divX;
  
        final offset = Offset(divX ,divY);
        points.add(offset);
        leftMarginRoot = leftMarginRoot + xOffsetGap;
      }
    points.add(Offset(paintContext.size.height,paintContext.size.height -bottomMarginRoot));
    
    final path = Compute.instance.computePathA(points);
    final paint = Paint()..color=lineColor..style=PaintingStyle.fill..strokeWidth=lineWidth;
    paintContext.canvas.drawPath(path,paint);

   }
}


