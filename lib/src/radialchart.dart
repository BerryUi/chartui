import 'package:chartui/chartui.dart';
import 'package:chartui/src/layout/layout.dart';
import 'package:chartui/src/layout/radialchart.dart';
import 'package:flutter/material.dart';

import '../color.dart';
import 'context/paint_contexts.dart';

// ignore: must_be_immutable
class Radialchart extends StatefulWidget {
   double width;
   double height;
   List<DoughnutItem> dataset;
   List<Color>? listColor;
   TextStyle? labelStyle;
   double? centerRadius;
   Mode? mode;
   Radialchart({super.key, 
    required this.height,
    required this.width,
    required this.dataset,
    this.listColor,
    this.labelStyle,
    this.centerRadius,
    this.mode
   });


  @override
  // ignore: library_private_types_in_public_api
  _RadialchartState createState() => _RadialchartState();
}

class _RadialchartState extends State<Radialchart> {
  double fullAngle = 360;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height,
        width: widget.width,
        child: CustomPaint(
          painter: RadialchartPainter(
            dataset:widget.dataset,
            fullAngle: fullAngle,
            listColor: widget.listColor ??  colorList,
            labelStyle: widget.labelStyle ?? const TextStyle(fontWeight: FontWeight.w700,color: Colors.black54),
            centerRadius: widget.centerRadius,
            mode: widget.mode ?? Mode.vertical,
        
          ),
          child: Container(),
        ),
    );
  }
}


class RadialchartPainter extends CustomPainter {
  List<DoughnutItem> dataset;
  double fullAngle;
  List<Color> listColor;
  TextStyle labelStyle;
  double? centerRadius;
  Mode mode;
  RadialchartPainter({
    required this.dataset,
    required this.fullAngle,
    required this.listColor,
    required this.labelStyle,
    required this.mode,
    this.centerRadius,
  });
  @override
  void paint(Canvas canvas, Size size) {
     RadialLayout radialLayout =  RadialLayout(
          paintContext: PaintContext(
            canvas: canvas,
            size: size, 
            themeData:ThemeData(
              primaryColor:colorList[5]
            ), 
            mode:mode
          ),
          dataset: dataset, 
          fullAngle: fullAngle, 
          listColor: listColor, 
          labelStyle: labelStyle, 
          centerRadius: centerRadius
          );
        radialLayout.designLayout();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>true;
   
}