import 'dart:async';
import 'package:chartui/color.dart';
import 'package:chartui/src/layout/layout.dart';
import 'package:flutter/material.dart';
import '../../chart_item.dart';
import '../context/paint_contexts.dart';
import '../layout/doughnut.dart';


// ignore: must_be_immutable
class DoughnutChart extends StatefulWidget {
   DoughnutChart({super.key,  
    required this.dataset,
    required this.height,
    required this.width,
    this.mode,
    this.listColor,
    this.labelStyle,
    this.centerRadius,
    this.dividerColor,
    this.dividerWidth,
    this.centerColor
   });

  List<DoughnutItem> dataset;
  List<Color>? listColor;
  TextStyle? labelStyle;
  double? centerRadius;
  Color? centerColor;
  double height;
  double width;
  Mode? mode;
  Color? dividerColor;
  double? dividerWidth;

  @override
  // ignore: library_private_types_in_public_api
  _DoughnutChartState createState() => _DoughnutChartState();
}



class _DoughnutChartState extends State<DoughnutChart> {
  late Timer timer;
  // double fullAngle = 0.0;
  double fullAngle = 360.0;
  double secondsToComplete = 5.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:widget.height,
      width:widget.width,
      child: CustomPaint(
        painter: DoughnutPainter(
        dataset: widget.dataset,
        fullAngle: fullAngle,
        mode: widget.mode ?? Mode.vertical,
        listColor: widget.listColor?? colorList,
        labelStyle: widget.labelStyle ?? const TextStyle(fontWeight: FontWeight.w700,color: Colors.black54),
        centerRadius: widget.centerRadius,
        dividerColor: widget.dividerColor,
        dividerWidth: widget.dividerWidth,
        centerColor: widget.centerColor
        ),
      child: Container(),
     ),
    );
    
    
  }
}


class DoughnutPainter extends CustomPainter{
  List<DoughnutItem> dataset;
  TextStyle labelStyle;
  double? centerRadius;
  Mode mode;
  double fullAngle;
  List<Color> listColor;
  Color? dividerColor;
  double? dividerWidth;
  Color? centerColor;
  DoughnutPainter({
    required this.dataset,
    required this.fullAngle,
    required this.mode,
    required this.listColor,
    required this.labelStyle,
    required this.centerRadius,
    this.dividerColor,
    this.dividerWidth,
    this.centerColor
  });
  @override
  void paint(Canvas canvas, Size size) {

    PaintContext paintContext = PaintContext(
          canvas: canvas, 
          size: size, 
          themeData:ThemeData(
            primaryColor:colorList[5]
          ), 
          mode:mode);

     DoughnutLayout layout = DoughnutLayout(
              paintContext: paintContext,
              dataset: dataset,
              fullAngle: fullAngle,
              listColor: listColor,
              labelStyle: labelStyle,
              centerRadius: centerRadius,
              dividerColor: dividerColor,
              dividerWidth: dividerWidth,
              centerColor: centerColor);
     layout.designLayout();
  }
    @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>true;
}