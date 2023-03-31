import 'package:chartui/src/background/background.dart';
import 'package:chartui/src/calc/size.dart';
import 'package:chartui/src/context/offset.dart';
import 'package:chartui/src/helper/axis2.dart';
import 'package:chartui/src/painting/incolumn.dart';
import 'package:flutter/material.dart';
import '../context/paint_contexts.dart';
import 'layout.dart';


class InvertColumnChartLayout implements DesignLayout {
   bool drawNet;
   bool drawAxis;
   Color netColor;
   List<Color> barColorList;
   double netStrokeWidth;
   PaintContext paintContext;
   Offset offsetLocal;
   final List<dynamic> x;
   final List<double> y;
   Color axisColor;
   TextStyle xLabelstyle;
   TextStyle yLabelstyle;
   Color backgroundColor;
   double labelWidth;
   double bargap;
   double border;
   double barWidth;
   double bottomMarginRoot;
   InvertColumnChartLayout({
    required this.drawAxis,
    required this.drawNet,
    required this.barWidth,
    required this.bargap,
    required this.barColorList,
    required this.netStrokeWidth,
    required this.netColor,
    required this.y,
    required this.x,
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

     final sizeCalculas = SizeCalculas(
      bottomMarginRoot: bottomMarginRoot, 
      labelWidth: labelWidth, 
      paintContext: paintContext,
      barWidth: barWidth, noXSection:8, noYSection:10,y: y,x:getXList() );    //______LEGIT_BYME
     final drawableSize = sizeCalculas.getDrawableSize();             //______LEGIT_BYME


    //_______________________________THIS_IS_ONLY_WHEN_Y_AXIS__HAS_TO_BE_CALCULATED____________________________//
                                    
                                     // double drawableYGap = drawableHeight/11;

     //_DOCUMENTAION_---->>>>>_____________________________________________________________
     //_DOCUMENTAION_---->>>>>_____________________________________________________________
     //_DOCUMENTAION_---->>>>>_____________________________________________________________
     //_DOCUMENTAION_---->>>>>_____________________________________________________________
     





     //_______________________________________________________________<<<<<----DOCUMENTAION
     //_______________________________________________________________<<<<<----DOCUMENTAION
     //_______________________________________________________________<<<<<----DOCUMENTAION
     //_______________________________________________________________<<<<<----DOCUMENTAION
     
  

    double barHeightAllotVarY = drawableSize.drawableYGap/drawableSize.singleIncrementY;      //sizeCalculas.singleIncrementY;


     



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
              barGap: bargap, 
              bottomMarginRoot:bottomMarginRoot, 
              netStrokeWidth:netStrokeWidth, 
              netColor:netColor, 
              offsetContext: offsetContext);
      backGround.draw();


      final axisDrawer =AxisLayout(
        xFixed: true,
        drawAxis:drawAxis ,
        barGap: bargap,
        yLabelstyle: yLabelstyle,
        drawableWidth: drawableSize.drawableWidth,
        xLabelstyle:xLabelstyle,
        paintContext: paintContext, 
        labelWidth: labelWidth, 
        bottomMarginRoot: bottomMarginRoot, 
        maxWidth: labelWidth ,                          //drawableYGap,
        // xdoubleAxisdata:x,
        yAxisdata:y, 
        xAxisdata: x,
        drawableHeight: drawableSize.drawableHeight-3*border,
        xOffset:drawableSize.cXlabelOffsetStart, 
        yOffset:drawableSize.cYlabelOffsetStart,
        xOffsetGap:drawableSize.drawableXGap, 
        yOffsetGap:drawableSize.drawableYGap,  //singleIncrementY,       //drawableYGap,
        yIncrement:drawableSize.singleIncrementY,
        xIncrement:drawableSize.singleIncrementX,
        axisColor: axisColor,
      );
    

    axisDrawer.draw();
    
   


      labelWidth = labelWidth + 5;
      PaintInvertColumnBar(
        barColorList: barColorList,
        yLabelWidth: labelWidth,
        barHeightAllotVar: barHeightAllotVarY,
        yOffsetGap:drawableSize.drawableYGap,
        xOffsetGap:drawableSize.drawableXGap,
        offsetLocal: offsetLocal,
        leftMarginRoot: labelWidth, 
        // color: Colors.greenAccent,
        paintContext: paintContext,
        barWidth: 30,  //barWidth: 40,
        barGap: bargap,
        listData:y,
        // isRefactored: isRefactored,
        bottomMarginRoot:bottomMarginRoot,
        // offRefactor: offRefactor
        ).paint();
    }
    

}