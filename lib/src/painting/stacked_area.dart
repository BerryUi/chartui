import 'package:chartui/src/calc/path.dart';
import 'package:flutter/material.dart';
import '../context/paint_contexts.dart';

class StackedAreaPainting{
  PaintContext paintContext;
  List<Color> areaColorList;
  List<double> listDataY;
  List<double> listDataX;
  List<List<double>> yNestedData;
  double barWidth;
  Color lineColor;
  double lineWidth;
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
  StackedAreaPainting({
    required this.areaColorList,
    required this.yNestedData,
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

      Path path = Path();
      
      int topLen = yNestedData.length;
      int subLen = yNestedData[0].length;
      

      for (int index =subLen-1;index>=0;index--) {
            bottom = 0;
            listDataX.sort();

            List<Offset> points =[];
            double dx = leftMarginRoot;

            double remX = leftMarginRoot;

            points.add(Offset(leftMarginRoot,paintContext.size.height -bottomMarginRoot));

            points.add(Offset(leftMarginRoot,paintContext.size.height -bottomMarginRoot-barHeightAllotVarY*(//listDataX.isNotEmpty ? bindXY[listDataX[0]] :
                                                                                                              yNestedData[0][index])));
            double xtop = paintContext.size.height - bottomMarginRoot ;

            for (var i = 0; i <topLen; i++) {
              bottom = xtop;
              //__________correction of Xaxis Double type data doned later ________________//

              double divY = paintContext.size.height -bottomMarginRoot - barHeightAllotVarY*  (//listDataX.isNotEmpty ? bindXY[listDataX[i]] :
                                                                                                  yNestedData[i][index] );          //listDataY[i];
              double divX =0;
              listDataX.isEmpty ? divX =remX+ 40 : dx+barHeightAllotVarX * listDataX[i];
              remX = divX;
        
              final offset = Offset(divX ,divY);
              points.add(offset);
              // leftMarginRoot = leftMarginRoot + xOffsetGap;
            }
            // print(areaColorList[index]);
            points.add(Offset(paintContext.size.height,paintContext.size.height -bottomMarginRoot));

            path = Compute.instance.computePath(points,path); 
            final paint = Paint()..color=areaColorList[index]..style=PaintingStyle.fill..strokeWidth=lineWidth;
            paintContext.canvas.drawPath(path,paint);

            
            path.moveTo(leftMarginRoot,paintContext.size.height);
      }

   }
}


