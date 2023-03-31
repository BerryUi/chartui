import 'package:chartui/src/helper/axis.dart';
import 'package:chartui/src/painting/netpaint.dart';
import 'package:flutter/material.dart';
import '../context/paint_contexts.dart';
import '../painting/paintbar.dart';
import './layout.dart';


class BarChartLayout implements DesignLayout {
   Color netColor;
   List<Color> barColorList;
   double netStrokeWidth;
   PaintContext paintContext;
   Offset offsetLocal;
   final List<double> x;
   final List<dynamic> y;
   Color axisColor;
   TextStyle xLabelstyle;
   TextStyle yLabelstyle;
   Color backgroundColor;
  //  List<BarChartItem> listData;
   double labelWidth;
   bool isRefactored;
   double bargap;
   double border;
   double barWidth;
   Function offRefactor;
   double bottomMarginRoot;
   BarChartLayout({
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
    required this.isRefactored,
    required this.offRefactor,
    required this.bottomMarginRoot
   });
   
    @override
    void designLayout() {

      

     var maxY = -double.maxFinite;
    var maxX = -double.maxFinite;
    // for (var element in y) {
    //   // min = min>element.value ? element.value : min;
    //   maxY = maxY<element ? element : maxY;                                     //?? 30
    // }
    for (var element in x) {

      maxX = maxX<element ? element : maxX;
    }

       

    final clipRect = Rect.fromLTWH(0, 0,paintContext.size.width,paintContext.size.height);
    paintContext.canvas.clipRect(clipRect);
    paintContext.canvas.drawPaint(Paint()..color =backgroundColor);
    final drawableHeight = paintContext.size.height - 2*border;
    final drawableWidth = paintContext.size.width -2*border;
    final hd = drawableHeight/4.1;
    final wd = drawableWidth/x.length.toDouble();

    final height = hd*3.0;
    final width = drawableWidth;

    //if values are invalid;
    if(height <= 0.0 || width <=0.0) return;
    // if(max -min <1.0*e -6) return ;
    // final hr = height/(max-min);
    final left = border;
    final top = border;
    final c = Offset(left+wd/2.0,top+height/2.0);

    final cXlabelOffset = Offset(c.dx+20,top+ 4*hd);
    final cYlabelOffset = Offset(labelWidth-20.0,top+ 3.71*hd);
    double singleIncrementY = maxY/10;

    //_______________________________THIS_IS_ONLY_WHEN_Y_AXIS__HAS_TO_BE_CALCULATED____________________________//
                                    
                                     // double drawableYGap = drawableHeight/11;


    
    double drawableYGap = barWidth;
    double singleIncrementX = maxX/8;
    double drawableXGap = drawableWidth/9;


    double barHeightAllotVarX = drawableXGap/singleIncrementX;

      final axisDrawer =AxisDrawer(
        barGap: bargap,
        yLabelstyle: yLabelstyle,
        drawableWidth: drawableWidth,
        xLabelstyle:xLabelstyle,
        paintContext: paintContext, 
        labelWidth: labelWidth, 
        bottomMarginRoot: bottomMarginRoot, 
        maxWidth: labelWidth ,                          //drawableYGap,
        xdoubleAxisdata: x,
        yAxisdata:y, 
        drawableHeight: drawableHeight-3*border,
        xOffset:cXlabelOffset, 
        yOffset: cYlabelOffset,
        xOffsetGap:drawableXGap, 
        yOffsetGap: drawableYGap,
        yIncrement: singleIncrementY,
        xIncrement: singleIncrementX,
        axisColor: axisColor,
      );
    
    axisDrawer.drawAxis();
    axisDrawer.drawXlabel();
    axisDrawer.drawYFixedlabels();


    NetPaint(
      paintContext: paintContext, 
      color:netColor, 
      strokeWidth:netStrokeWidth, 
      xOffsetGap: drawableXGap, 
      yOffsetGap:drawableYGap, 
      bottomMarginRoot: bottomMarginRoot, 
      barGap:bargap).drawNet();


      labelWidth = labelWidth + 5;
      PaintBar(
        barColorList: barColorList,
        yLabelWidth: labelWidth,
        barHeightAllotVar: barHeightAllotVarX,
        yOffsetGap: drawableYGap,
        offsetLocal: offsetLocal,
        leftMarginRoot: labelWidth, 
        color: Colors.greenAccent,
        paintContext: paintContext,
        barWidth: 30,  //barWidth: 40,
        barGap: bargap,
        listData:x,
        isRefactored: isRefactored,
        bottomMarginRoot:bottomMarginRoot,
        offRefactor: offRefactor).paint();
    }
    
  

}



