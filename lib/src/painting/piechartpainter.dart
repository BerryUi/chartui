
import 'package:chartui/chartui.dart';
import 'package:chartui/src/util/canvasutil.dart';
import 'package:flutter/material.dart';

import '../data/pfit.dart';

class PieChartPainter extends CustomPainter {
    TextStyle labelStyle;
    double strokeWidth;
    Color strokeColor;
    final List<PieChartItem> dataset;
    double fullAngle;
    PieChartPainter({required this.labelStyle, required this.strokeColor, required this.strokeWidth, required this.dataset,required this.fullAngle});
    @override
    void paint(Canvas canvas, Size size) {
        final List<PieChartItem> fittedData =  DataFitting().dataFitting(dataList:dataset);
        final c = Offset(size.width/2,size.height/2);
        var startAngle = 0.0;
        final radius = size.width * 0.9;
        final rect = Rect.fromCenter(center:c, width: radius, height:radius);
        DrawSectorAndLine(labelStyle: labelStyle, divisonColor:strokeColor, strokeWidth:strokeWidth, dataset:fittedData, canvas: canvas,rect: rect, radius: radius,size: size).
                  drawLineAndSector(fullAngle:fullAngle,startAngle: startAngle,offset:c);
 
    }
    
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>true;
}