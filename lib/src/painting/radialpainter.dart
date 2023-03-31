import 'dart:math';
import 'package:chartui/src/painting/textpainter.dart';
import 'package:flutter/material.dart';
import '../../chart_item.dart';
import '../context/paint_contexts.dart';
import '../data/pfit.dart';

class RadialPaint {
   PaintContext paintContext;
   List<DoughnutItem> dataset;
   double fullAngle;
   List<Color> listColor;
   TextStyle labelStyle;
   double? dividerWidth;
   Color? dividerColor;
  //  Size size;
   double radius;
  //  double startAngle =0.0;
   RadialPaint({
    required this.paintContext,
    required this.dataset,
    required this.fullAngle,
    required this.listColor,
    required this.labelStyle,
    this.dividerColor,
    this.dividerWidth,
    // required this.size,
    required this.radius


    // required this.startAngle
   });


   Paint linePaint = Paint()..color = Colors.blueAccent ..style = PaintingStyle.stroke ..strokeWidth = 2.0;


   RadiusAndCenter drawLineAndSector(){
        List<DoughnutItem> fittedData =  DoughNutFit(listData:dataset).fit();
        final center = Offset(paintContext.size.width/2,paintContext.size.height/2);
        var startAngle = 0.0;
        
        final rect = Rect.fromCenter(center:center, width: radius, height:radius);
        RadialPainter(
                listColor: listColor, 
                labelStyle:labelStyle,
                divisonColor:dividerColor??Colors.white, strokeWidth:dividerWidth ?? 2, 
                dataset:fittedData, 
                canvas: paintContext.canvas,
                rect: rect, 
                radius: radius,
                size:paintContext.size
                ).drawLineAndSector(fullAngle:fullAngle,startAngle: startAngle,offset:center);




      //           final rect2 = Rect.fromCenter(center:center, width: radius-100, height:radius-100);
      //   RadialPainter(
      //           listColor: listColor, 
      //           labelStyle:labelStyle,
      //           divisonColor:dividerColor??Colors.white, strokeWidth:dividerWidth ?? 2, 
      //           dataset:fittedData, 
      //           canvas: paintContext.canvas,
      //           rect: rect2, 
      //           radius: radius-100,
      //           size:paintContext.size
      //           ).drawLineAndSector(fullAngle:fullAngle,startAngle: startAngle,offset:center);
      //  print(">>>>");






       return RadiusAndCenter(radius: radius/2,center: center);
   }

}





class RadialPainter{
    
    late List<DoughnutItem> _dataset;
    List<Color> listColor;
    Canvas canvas;
    Rect rect;
    double radius;
    Size size;
    late Paint linePaint;
    TextStyle labelStyle;
    RadialPainter({required List<DoughnutItem> dataset , 
                        required this.canvas,required this.rect, 
                        required this.radius,
                        required double strokeWidth,
                        required Color divisonColor,
                        required this.labelStyle,
                        required this.size,
                        required this.listColor
                        }){
      _dataset = dataset;
      linePaint = Paint()..color =divisonColor ..style = PaintingStyle.stroke ..strokeWidth = strokeWidth;
    }

    void drawLineAndSector({required double startAngle,required Offset offset,required double fullAngle}){
      int colorIndex = 0;
       for (var element in _dataset) {
        if(colorIndex==listColor.length){colorIndex=1;}
        Color sectorColor = listColor[colorIndex++];
        double sweepAngle = drawSector(sectorColor: sectorColor, fullAngle: fullAngle, element: element,rect: rect,startAngle: startAngle);
        drawLine(offset: offset,startAngle: startAngle);
        CustomTextPainter(labelStyle:labelStyle,size: size,
          canvas: canvas).drawLabels(radius, startAngle,offset,sweepAngle, element.label);
        startAngle += sweepAngle;
      }
    }
    
    void drawLine({required Offset offset,required double startAngle}) {
        final dx = radius/2.0 * cos(startAngle);
        final dy = radius/2.0 * sin(startAngle);
        final p2 = offset + Offset(dx, dy);
        canvas.drawLine(offset, p2, linePaint);
    }

    double drawSector({ required DoughnutItem element,required Rect rect,required double startAngle,required double fullAngle,required Color sectorColor}) {
        final sweepAngle =element.value*fullAngle *pi /180.0; 
        final paint = Paint()
              ..style = PaintingStyle.fill
              ..color = sectorColor;
        canvas.drawArc(rect, startAngle, sweepAngle,true, paint);
        return sweepAngle;
    }

}