import 'package:chartui/src/background/background.dart';
import 'package:chartui/src/calc/mnmx.dart';
import 'package:chartui/src/calc/size.dart';
import 'package:chartui/src/context/offset.dart';
import 'package:chartui/src/helper/axis2.dart';
import 'package:chartui/src/layout/layout.dart';
import 'package:chartui/src/painting/staline.dart';
import 'package:flutter/material.dart';
import '../context/paint_contexts.dart';


class StackedLineChartLayout extends DesignLayout {
   bool drawNet;
   bool drawAxis;
   double pointRadius;
   double xFixedLabelGap;
   Color lineColor;
   double lineWidth;
   double extraGap;
   Color netColor;
   double netStrokeWidth;
   PaintContext paintContext;
   Offset offsetLocal;
   final List<dynamic> x;
   List<Color> areaColorList;
   List<List<double>> yNestedData;
   Color axisColor;
   TextStyle xLabelstyle;
   TextStyle yLabelstyle;
   Color backgroundColor;
   double labelWidth;
   double border;
   double bottomMarginRoot;
   StackedLineChartLayout({
    required this.areaColorList,
    required this.yNestedData,
    required this.xFixedLabelGap,
    required this.lineColor,
    required this.lineWidth,
    required this.extraGap,
    required this.drawAxis,
    required this.drawNet,
    required this.netStrokeWidth,
    required this.netColor,
    required this.x,required this.pointRadius,
    required this.backgroundColor,
    required this.xLabelstyle,
    required this.yLabelstyle,
    required this.border,
    required this.axisColor,
    required this.labelWidth,
    required this.paintContext,
    required this.offsetLocal,
    required this.bottomMarginRoot
   });

  List<double> getXList(){
      List<double> list = [];
      if(x.runtimeType==List<double>){
         return x as List<double>; 
      }else {
        return list;
      }
   }
  @override
  void designLayout() {
     
     bool isXFixed = false;
      if(x.runtimeType == List<double>){
            isXFixed =false;
      }else{
        isXFixed = true;
      }

      final nestedMinMax = NestedMinMax(nestedAxisData:yNestedData);
      // final calculated = 
      nestedMinMax.calculate();

 
      final sizeCalculas = SizeCalculas(bottomMarginRoot: bottomMarginRoot,
        labelWidth: labelWidth,paintContext: paintContext,
        barWidth:xFixedLabelGap, noXSection:8, noYSection:10,x:getXList(),y:nestedMinMax.maxFromNested); 
      final drawableSize = sizeCalculas.getDrawableSize(); 


     final offsetContext = OffsetContext(
        xOffsetGap:drawableSize.drawableXGap, 
        yOffsetGap:drawableSize.drawableYGap, 
        xOffsetStart:drawableSize.cXlabelOffsetStart,
        yOffsetStart:drawableSize.cYlabelOffsetStart
        );


       final backGround = BackGroundDrawer(
              drawNet: drawNet,
              paintContext: paintContext,
              backgroundColor: backgroundColor, 
              barGap:10 ,            ///____PARAM DECIDED_LATER
              bottomMarginRoot:bottomMarginRoot, 
              netStrokeWidth:netStrokeWidth, 
              netColor:netColor, 
              offsetContext: offsetContext);
      backGround.draw();


      final axisDrawer =AxisLayout(
        xFixed: isXFixed,
        drawAxis:drawAxis ,
        barGap:extraGap,
        yLabelstyle: yLabelstyle,
        drawableWidth: drawableSize.drawableWidth,
        xLabelstyle:xLabelstyle,
        paintContext: paintContext, 
        labelWidth: labelWidth, 
        bottomMarginRoot: bottomMarginRoot, 
        maxWidth: labelWidth ,
        yAxisdata:nestedMinMax.maxFromNested, 
        xAxisdata: x,
        drawableHeight: drawableSize.drawableHeight,
        xOffset:drawableSize.cXlabelOffsetStart, 
        yOffset:drawableSize.cYlabelOffsetStart,
        xOffsetGap:drawableSize.drawableXGap, 
        yOffsetGap:drawableSize.drawableYGap,
        yIncrement:drawableSize.singleIncrementY,
        xIncrement:drawableSize.singleIncrementX,
        axisColor: axisColor,
      );

      axisDrawer.draw();

      double barHeightAllotVarY = drawableSize.drawableYGap/drawableSize.singleIncrementY;
      double barHeightAllotVarX = drawableSize.drawableXGap/drawableSize.singleIncrementX;


      labelWidth = labelWidth + 5;

      StackedLinePainting(
        pointRadius: pointRadius,
        areaColorList: areaColorList,
        yNestedData: yNestedData,
        lineColor: lineColor,
        lineWidth: lineWidth,
        xOffsetGap:drawableSize.drawableXGap,
        yLabelWidth:labelWidth, 
        barHeightAllotVarY: barHeightAllotVarY, 
        yOffsetGap:drawableSize.drawableYGap,
        offsetLocal: offsetLocal, 
        leftMarginRoot:labelWidth, 
        listDataY:nestedMinMax.maxFromNested,
        barHeightAllotVarX:barHeightAllotVarX ,
        paintContext: paintContext, 
        barWidth:40, barGap:10, 
        bottomMarginRoot: bottomMarginRoot,
        listDataX:getXList()
        ).paint();
  }

}