import 'package:chartui/src/helper/drawText.dart';
import 'package:flutter/material.dart';
import '../context/paint_contexts.dart';
import '../layout/layout.dart';

class AxisDrawer{

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
  // List<double> xAxisdata;
  List<double> xdoubleAxisdata;
  List<double>? ydoubleAxisdata;
  List<dynamic> yAxisdata;
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

  
  AxisDrawer({
    this.ydoubleAxisdata,
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
    required this.xdoubleAxisdata,
    required this.yAxisdata,
    required this.xOffset,
    required this.yOffset,
    required this.xOffsetGap,
    required this.yIncrement,
    required this.yOffsetGap,
    required this.xIncrement,
    required this.xLabelstyle

  });

   void drawAxis(){

    //  paintContext = paintContext.copyWith(mode: Mode.landscape);
    // ____________________________MODE_LANDSCAPE_DONED_LATER_VERSION___________________
     Paint rectpaintline = Paint()..color = axisColor..strokeWidth=axisWidth ?? 3;
     xAxis(rectpaintline);
     yAxis(rectpaintline);

     paintContext.canvas.drawLine(Offset(labelWidth,paintContext.size.height-(bottomMarginRoot)-2),Offset(drawableWidth+labelWidth,paintContext.size.height-(bottomMarginRoot)-2),Paint()..color=Colors.black..strokeWidth=1);
    
   }

   void drawXlabel()=> _drawXlabels();
   void drawYlabel()=> _drawYlabels();
   void drawXFixedlabels()=> _drawXFixedlabels();
   void drawYFixedlabels()=> _drawYFixedlabels();
   

   void yAxis(Paint rectpaintline) =>paintContext.mode == Mode.vertical ? 
            paintContext.canvas.drawLine(
            Offset(paintContext.size.width,paintContext.size.height-(bottomMarginRoot) ), 
            Offset(labelWidth,paintContext.size.height-(bottomMarginRoot)), 
            rectpaintline) : paintContext.canvas.drawLine(
            Offset(paintContext.size.width,labelWidth ), 
            Offset(bottomMarginRoot,labelWidth), 
            rectpaintline);

   void xAxis(Paint rectpaintline) => paintContext.canvas.drawLine(
            Offset(labelWidth,0 ), 
            Offset(labelWidth,paintContext.size.height-(bottomMarginRoot)), 
            rectpaintline);
   
   void _drawXFixedlabels(){
    for (var element in xdoubleAxisdata) {
      DrawText(textStyle: xLabelstyle, paintContext: paintContext, text:element.toStringAsFixed(0),
      maxWidth: maxWidth).drawTextCentered(xOffset);
      xOffset+= Offset(xOffsetGap,0);
    }
  }
  void drawXPercentFixedlabels(){
    // for (var element in xdoubleAxisdata) {
      for (int i =0;i<11;i++) {
      DrawText(textStyle: xLabelstyle, paintContext: paintContext, text:(i*10).toStringAsFixed(0),
      maxWidth: maxWidth).drawTextCentered(xOffset);
      xOffset+= Offset(xOffsetGap,0);
    }
  }
  void _drawYFixedlabels(){
     for (var element in yAxisdata) {
       DrawText(textStyle: xLabelstyle, paintContext: paintContext, text:"$element",//.toStringAsFixed(0),///.toStringAsFixed(3), 
        maxWidth: maxWidth).drawTextCentered(yOffset);
      yOffset-= Offset(0,yOffsetGap+barGap);
     }
  }
  double _drawYlabels(){
    // Paint rectpaintline = Paint()..color = axisColor..strokeWidth=axisWidth ?? 3;
    
    double incLoop = 0.0;
    double hline = paintContext.size.height-(bottomMarginRoot);//yOffsetGap
    // double offgapCount =drawableHeight;
    while (yOffset.dy>=0) {
      DrawText(textStyle: xLabelstyle, paintContext: paintContext, text:incLoop.toStringAsFixed(0), maxWidth: maxWidth)
              .drawTextCentered(yOffset);
      
      drawNet(hline);
      hline-=yOffsetGap*3;
      yOffset-= Offset(0,yOffsetGap);
      incLoop +=yIncrement;
    }
   





    return incLoop-yIncrement;
  }

  void drawNet(double hline) => paintContext.canvas.drawLine(Offset(labelWidth,hline),Offset(drawableWidth+labelWidth,hline),Paint()..color=Colors.black..strokeWidth=1);

  double _drawXlabels(){
    double incLoop = 0.0;
    while (xOffset.dx<=paintContext.size.width) {
      DrawText(textStyle: xLabelstyle, paintContext: paintContext, text:incLoop.toStringAsFixed(0), maxWidth: maxWidth)
              .drawTextCentered(xOffset);
      xOffset+= Offset(xOffsetGap,0);
      incLoop +=xIncrement;
    }
    return incLoop-xIncrement;
  }
}