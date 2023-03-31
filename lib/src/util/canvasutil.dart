import 'dart:math';
import 'package:chartui/chart_item.dart';
import 'package:chartui/color.dart';
import 'package:chartui/src/painting/textpainter.dart';
import 'package:flutter/material.dart';


class DrawSectorAndLine{
    
    late List<PieChartItem> _dataset;
    Canvas canvas;
    Rect rect;
    double radius;
    Size size;
    late Paint linePaint;
    TextStyle labelStyle;
    DrawSectorAndLine({required List<PieChartItem> dataset , 
                        required this.canvas,required this.rect, 
                        required this.radius,
                        required double strokeWidth,
                        required Color divisonColor,
                        required this.labelStyle,
                        required this.size
                        }){
      _dataset = dataset;
      linePaint = Paint()..color =divisonColor ..style = PaintingStyle.stroke ..strokeWidth = strokeWidth;
    }

    void drawLineAndSector({required double startAngle,required Offset offset,required double fullAngle}){
      int colorIndex = 0;
       for (var element in _dataset) {
        if(colorIndex==colorList.length){colorIndex=1;}
        Color sectorColor = element.color ==null ? colorList[colorIndex++]:element.color as Color;
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

    double drawSector({ required PieChartItem element,required Rect rect,required double startAngle,required double fullAngle,required Color sectorColor}) {
        final sweepAngle =element.value*fullAngle *pi /180.0; 
        final paint = Paint()
              ..style = PaintingStyle.fill
              ..color = sectorColor;
        canvas.drawArc(rect, startAngle, sweepAngle,true, paint);
        return sweepAngle;
    }

}

