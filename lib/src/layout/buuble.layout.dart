// import 'package:chartui/color.dart';
import 'package:chartui/src/helper/axis.dart';
import 'package:flutter/material.dart';
import '../context/paint_contexts.dart';
import 'layout.dart';


class BubbleChartLayout implements DesignLayout {
   PaintContext paintContext;
   final List<double> x;
   final List<double> y;
   final List<double> z;
   final List<Color> colorList;
   double dotRadius;
   Color axisColor;
   Color dotColor;
   double border;
   Color backgroundColor;
   TextStyle xLabelstyle;
   TextStyle yLabelstyle;
   double labelWidth;
   double bottomMarginRoot;
   BubbleChartLayout({
    required this.yLabelstyle,
    required this.colorList,
    required this.z,
    required this.paintContext,
    required this.dotRadius,
    required this.x,
    required this.y,
    required this.axisColor,
    required this.border,
    required this.xLabelstyle,
    required this.backgroundColor,
    required this.bottomMarginRoot,
    required this.labelWidth,
    required this.dotColor,
   });
  @override
  void designLayout() {

   double bargap = 10;

  //  var min = double.maxFinite;
    var maxY = -double.maxFinite;
    var maxX = -double.maxFinite;
    for (var element in y) {
      // min = min>element.value ? element.value : min;
      maxY = maxY<element ? element : maxY;
    }
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
    double drawableYGap = drawableHeight/11;
    double singleIncrementX = maxX/8;
    double drawableXGap = drawableWidth/9;

     

    final axisDrawer =AxisDrawer(
      barGap: bargap,
      yLabelstyle: yLabelstyle,
      drawableWidth: drawableWidth,
      xLabelstyle:xLabelstyle,
      paintContext: paintContext, 
      labelWidth: labelWidth, 
      bottomMarginRoot: bottomMarginRoot, 
      maxWidth:drawableYGap,
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
    axisDrawer.drawYlabel();

    final points = _computePoints(
            drawableHeight: drawableHeight, 
            drawableYGap: drawableYGap,
            drawableXGap: drawableXGap, 
            singleIncrementX: singleIncrementX, 
            singleIncrementY: singleIncrementY
            );
   _drawdatapoint(points: points);

  }


 

  void _drawdatapoint({required List<Offset> points}){
     int len = colorList.length;
     for(var i =0;i<points.length;i++){
      paintContext.canvas.drawCircle(points[i],y[i]/5,Paint()..color =colorList[i%len] ..strokeWidth=2.0..style=PaintingStyle.fill); 
      }
  }

  List<Offset> _computePoints ({required double drawableHeight,required double drawableYGap,required double drawableXGap,required double singleIncrementX,required double singleIncrementY}){
     List<Offset>  points =[];
     for (var i = 0; i < y.length; i++) {
        double ddy = (bottomMarginRoot)/1.6 +(drawableYGap/singleIncrementY)*y[i];
        double ddx =labelWidth+ (drawableXGap/singleIncrementX)*x[i];
        final divY = Offset(ddx,drawableHeight -ddy);
        points.add(divY);
     }
     return points;
  }
 

}
