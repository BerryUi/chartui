import 'package:chartui/src/painting/radialpainter.dart';
import 'package:flutter/material.dart';
import '../../chart_item.dart';
import '../context/paint_contexts.dart';
import 'layout.dart';

class RadialLayout implements DesignLayout {
  PaintContext paintContext;
  List<DoughnutItem> dataset;
  List<Color> listColor;
  double fullAngle;
  TextStyle labelStyle;
  double? centerRadius;
  Color? dividerColor;
  double? dividerWidth;
  Color? centerColor;
  RadialLayout({
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


    List<DoughnutItem> items = [];
    items.add(dataset[0]);
    items.add(DoughnutItem(label:"div", value: 5));
    List<DoughnutItem> items2 = [];
    items2.add(dataset[0]);
    items2.add(DoughnutItem(label:"div", value: 6));

    
        // RadialPaint doughPaint2 = 
        RadialPaint(
        paintContext: paintContext, 
        // dataset: dataset, 
        dataset: items2,
        fullAngle: fullAngle,
        listColor: [const Color.fromARGB(255, 127, 43, 10)],
        labelStyle: labelStyle,
        dividerColor: dividerColor,
        dividerWidth: dividerWidth,
        radius: paintContext.size.width*0.75
        // size: paintContext.size

        );


    check(items: items,midpaint: midpaint);
    // print("dddddd");
    // final radiusAndCenter2=      doughPaint2.drawLineAndSector();
    // paintContext.canvas.drawCircle(radiusAndCenter2.center, centerRadius ?? radiusAndCenter2.radius*.88, midpaint);
  }



  void check({required List<DoughnutItem> items ,required Paint midpaint }){
      RadialPaint doughPaint = RadialPaint(
        paintContext: paintContext, 
        // dataset: dataset, 
        dataset: items,
        fullAngle: fullAngle,
        listColor: listColor,
        labelStyle: labelStyle,
        dividerColor: dividerColor,
        dividerWidth: dividerWidth,
        radius: paintContext.size.width*0.9
        // size: paintContext.size

        );
        final radiusAndCenter =  doughPaint.drawLineAndSector();
        paintContext.canvas.drawCircle(radiusAndCenter.center, centerRadius ?? radiusAndCenter.radius*.88, midpaint);
      
  }
   
}