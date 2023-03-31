import 'package:flutter/material.dart';
import '../../chart_item.dart';
import '../context/paint_contexts.dart';
import '../painting/doughpaint.dart';
import 'layout.dart';

class DoughnutLayout implements DesignLayout {
  PaintContext paintContext;
  List<DoughnutItem> dataset;
  List<Color> listColor;
  double fullAngle;
  TextStyle labelStyle;
  double? centerRadius;
  Color? dividerColor;
  double? dividerWidth;
  Color? centerColor;
  DoughnutLayout({
    required this.paintContext,
    required this.dataset,
    required this.fullAngle,
    required this.listColor,
    required this.labelStyle,
    required this.centerRadius,
    this.dividerColor,
    this.dividerWidth,
    this.centerColor
  });

  @override
  void designLayout() {
     Paint midpaint = Paint()..color = centerColor??Colors.white ..strokeWidth=dividerWidth??3 ..style = PaintingStyle.fill;

    DoughPaint doughPaint = DoughPaint(
        paintContext: paintContext, 
        dataset: dataset, 
        fullAngle: fullAngle,
        listColor: listColor,
        labelStyle: labelStyle,
        dividerColor: dividerColor,
        dividerWidth: dividerWidth
        );
    final radiusAndCenter =  doughPaint.drawLineAndSector();
    paintContext.canvas.drawCircle(radiusAndCenter.center, centerRadius ?? radiusAndCenter.radius*.32, midpaint);
  }
   
}