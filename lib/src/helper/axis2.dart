import 'package:chartui/src/helper/drawText.dart';
import 'package:flutter/material.dart';
import '../context/paint_contexts.dart';
import '../layout/layout.dart';

class AxisLayout{
  bool drawAxis;
  double maxYLabel = 0;
  double maxXLabel = 0;
  TextStyle xLabelstyle;
  TextStyle yLabelstyle;
  PaintContext paintContext;
  double labelWidth;      ///??
  double bottomMarginRoot;   ///??
  double? axisWidth;    ///??
  Color axisColor;   ///??
  TextStyle? labelStyle;  ///??
  List<dynamic> yAxisdata;
  List<dynamic> xAxisdata;
  Offset xOffset;
  Offset yOffset;
  double maxWidth;
  double xOffsetGap;
  double yOffsetGap;
  double yIncrement;
  double xIncrement;
  double drawableHeight;
  double drawableWidth;
  double barGap;
  bool xFixed;

  
  AxisLayout({
    required this.xFixed,
    required this.drawAxis,
    required this.barGap,
    required this.yLabelstyle,
    required this.paintContext,
    required this.labelWidth,
    required this.bottomMarginRoot,
    required this.maxWidth,
    required this.drawableHeight,
    required this.drawableWidth,
    this.labelStyle,
    required this.axisColor,
    this.axisWidth,
    required this.yAxisdata,
    required this.xAxisdata,
    required this.xOffset,
    required this.yOffset,
    required this.xOffsetGap,
    required this.yIncrement,
    required this.yOffsetGap,
    required this.xIncrement,
    required this.xLabelstyle

  });

   void draw(){

     Paint rectpaintline = Paint()..color = axisColor..strokeWidth=axisWidth ?? 3;
     final xAxis =XAxis(
            barGap: barGap, paintContext: paintContext, 
            labelWidth: labelWidth, bottomMarginRoot: bottomMarginRoot, 
            maxWidth: maxWidth, drawableWidth: drawableWidth, 
            axisColor: axisColor, xOffset: xOffset, 
            xOffsetGap: xOffsetGap, xIncrement: xIncrement, 
            xLabelstyle: xLabelstyle);
     final yAxis = YAxis(
            barGap: barGap, yLabelstyle: yLabelstyle, 
            paintContext: paintContext, labelWidth: labelWidth, 
            bottomMarginRoot: bottomMarginRoot, maxWidth: maxWidth, 
            drawableHeight: drawableHeight, axisColor: axisColor, 
            yAxisdata: yAxisdata, yOffset: yOffset, yIncrement: yIncrement, 
            yOffsetGap: yOffsetGap);
     if(drawAxis){
       xAxis.xAxis(rectpaintline);
       yAxis.yAxis(rectpaintline);       
     }
     if(xFixed){
        xAxis.drawXFixedlabels(xAxisdata: xAxisdata);
     }else{
        xAxis.drawXlabels();
     }
     
     yAxis.drawYlabels(); 
   }

}


class YAxis {
   double maxYLabel = 0;
  TextStyle yLabelstyle;
  PaintContext paintContext;
  double labelWidth;      ///??
  double bottomMarginRoot;   ///??
  double? axisWidth;    ///??
  Color axisColor;   ///??
  TextStyle? labelStyle;  ///??
  List<double>? ydoubleAxisdata;
  List<dynamic> yAxisdata;
  Offset yOffset;
  double maxWidth;
  double yOffsetGap;
  double yIncrement;
  double drawableHeight;
  double barGap;
   YAxis({
    this.ydoubleAxisdata,
    required this.barGap,
    required this.yLabelstyle,
    required this.paintContext,
    required this.labelWidth,
    required this.bottomMarginRoot,
    required this.maxWidth,
    required this.drawableHeight,
    this.labelStyle,
    required this.axisColor,
    this.axisWidth,
    required this.yAxisdata,
    required this.yOffset,
    required this.yIncrement,
    required this.yOffsetGap,

  });
   void yAxis(Paint rectpaintline) =>paintContext.mode == Mode.vertical ? 
            paintContext.canvas.drawLine(
            Offset(paintContext.size.width,paintContext.size.height-(bottomMarginRoot) ), 
            Offset(labelWidth,paintContext.size.height-(bottomMarginRoot)), 
            rectpaintline) : paintContext.canvas.drawLine(
            Offset(paintContext.size.width,labelWidth ), 
            Offset(bottomMarginRoot,labelWidth), 
            rectpaintline);
   void drawYlabels(){
    double incLoop = 0.0;
    while (yOffset.dy>=0) {
      DrawText(textStyle: yLabelstyle, paintContext: paintContext, text:incLoop.toStringAsFixed(0), maxWidth: maxWidth)
              .drawTextCentered(yOffset);
      yOffset-= Offset(0,yOffsetGap);
      incLoop +=yIncrement;
    }
  }
}

class XAxis {
  double maxXLabel = 0;
  TextStyle xLabelstyle;
  PaintContext paintContext;
  double labelWidth;      ///??
  double bottomMarginRoot;   ///??
  double? axisWidth;    ///??
  Color axisColor;   ///??
  TextStyle? labelStyle;  ///??
  Offset xOffset;
  double maxWidth;
  double xOffsetGap;
  double xIncrement;
  double drawableWidth;
  double barGap;
  XAxis({
    required this.barGap,
    required this.paintContext,
    required this.labelWidth,
    required this.bottomMarginRoot,
    required this.maxWidth,
    required this.drawableWidth,
    this.labelStyle,
    required this.axisColor,
    this.axisWidth,
    required this.xOffset,
    required this.xOffsetGap,
    required this.xIncrement,
    required this.xLabelstyle

  });
   void drawXFixedlabels({required List<dynamic> xAxisdata}){
    for (var element in xAxisdata) {
      DrawText(textStyle: xLabelstyle, paintContext: paintContext, text:element,
      maxWidth: maxWidth).drawTextCentered(xOffset);
      xOffset+= Offset(xOffsetGap,0);
    }
   }
   double drawXlabels(){
    double incLoop = 0.0;
    while (xOffset.dx<=paintContext.size.width) {
      DrawText(textStyle: xLabelstyle, paintContext: paintContext, text:incLoop.toStringAsFixed(0), maxWidth: maxWidth)
              .drawTextCentered(xOffset);
      xOffset+= Offset(xOffsetGap,0);
      incLoop +=xIncrement;
    }
    return incLoop-xIncrement;
  }
  void drawXPercentFixedlabels(){
    for (int i =0;i<11;i++) {
      DrawText(textStyle: xLabelstyle, paintContext: paintContext, text:(i*10).toStringAsFixed(0),
      maxWidth: maxWidth).drawTextCentered(xOffset);
      xOffset+= Offset(xOffsetGap,0);
    }
  }
  void xAxis(Paint rectpaintline) => paintContext.canvas.drawLine(
            Offset(labelWidth,0 ), 
            Offset(labelWidth,paintContext.size.height-(bottomMarginRoot)), 
            rectpaintline);
}