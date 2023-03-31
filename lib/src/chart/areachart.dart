import 'package:chartui/color.dart';
import 'package:chartui/src/layout/arealayout.dart';
import 'package:chartui/src/layout/layout.dart';
import 'package:flutter/material.dart';

import '../context/paint_contexts.dart';


// ignore: must_be_immutable
class AreaChart extends StatefulWidget {
  AreaChart({super.key, 
    required this.xAxisData,
    required this.yAxisData,
    this.bottomLabelHeight,
    this.drawNet,
    this.drawAxis,
    this.netStrokeWidth,
    this.netColor,
    this.axisColor,
    this.axisLabelStyle,
    this.border,
    this.backgroundColor,
    this.labelWidth,
    this.extraGap,
    this.lineColor,
    this.lineWidth,
  });
  double? xFixedLabelGap;
  List<double> yAxisData;
  List<dynamic> xAxisData;
  double? lineWidth;
  Color? lineColor;
  double? extraGap;
  double? bottomLabelHeight;
  bool? drawNet;
  bool? drawAxis;
  double? netStrokeWidth;
  Color? netColor;
  Color? axisColor;
  TextStyle? axisLabelStyle;
  double? border;
  Color? backgroundColor;
  double? labelWidth;

  @override
  // ignore: library_private_types_in_public_api
  _AreaChartState createState() => _AreaChartState();
}

class _AreaChartState extends State<AreaChart> {



  Offset offsetLocal = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical:100,horizontal:20),
      height: 500,
      width: 350,
      child: CustomPaint(
        painter: AreaChartPainter(
          xFixedLabelGap:widget.xFixedLabelGap ?? 40,
          lineColor: widget.lineColor?? Colors.blue.shade200,
          lineWidth: widget.lineWidth??2,
          extraGap: widget.extraGap ?? 10,
          xAxisData:widget.xAxisData,
          yAxisData:widget.yAxisData,
          drawAxis: widget.drawAxis ?? true,
          drawNet: widget.drawNet ?? true,
          netStrokeWidth: widget.netStrokeWidth ?? .5,
          netColor: widget.netColor ?? Colors.blueAccent,
          axisColor:widget.axisColor ??colorList[6],
          border: widget.border ?? 10.0,
          backgroundColor: widget.backgroundColor ?? Colors.black12,
          labelWidth: widget.labelWidth ?? 60,
          offsetLocal: offsetLocal,
          heightBottomLabel: widget.bottomLabelHeight ?? 40,
          axisLabelStyle: widget.axisLabelStyle ??const TextStyle(color: Color.fromARGB(97, 150, 12, 12),fontSize: 16,fontWeight: FontWeight.bold),
                

          ),
        child: Container(),
      ),
    );
  }
}

class AreaChartPainter extends CustomPainter {
  List<double> yAxisData;
  List<dynamic> xAxisData;
  double xFixedLabelGap;
  double extraGap;
  double lineWidth;
  Color lineColor;
  bool drawNet;
  bool drawAxis;
  double heightBottomLabel;
  double labelWidth;
  Color axisColor;
  Color netColor;
  double netStrokeWidth;
  Offset offsetLocal;
  Color backgroundColor;
  TextStyle axisLabelStyle;
  double border;
  AreaChartPainter({
    required this.xFixedLabelGap,
    required this.lineColor,
    required this.lineWidth,
    required this.extraGap,
    required this.yAxisData,
    required this.xAxisData,
    required this.drawAxis,
    required this.drawNet,
    required this.netColor,
    required this.netStrokeWidth,
    required this.offsetLocal,
    required this.axisColor,
    required this.axisLabelStyle,
    required this.border,
    required this.backgroundColor,
    required this.labelWidth,
    required this.heightBottomLabel
  });
  @override
  void paint(Canvas canvas, Size size) {

    PaintContext paintContext = PaintContext(
      canvas: canvas, 
      size: size, 
      themeData:ThemeData(), 
      mode:Mode.vertical);

    final layout = AreaChartLayout(
      xFixedLabelGap:xFixedLabelGap ,
      lineColor: lineColor,
      lineWidth: lineWidth,
      extraGap: extraGap,
      drawAxis: drawAxis, 
      drawNet: drawNet, 
      netStrokeWidth: netStrokeWidth, 
      netColor: netColor, y: yAxisData,x: xAxisData, 
      backgroundColor: backgroundColor, 
      xLabelstyle:axisLabelStyle, 
      yLabelstyle:axisLabelStyle, 
      border: border, axisColor: axisColor, 
      labelWidth: labelWidth, 
      paintContext: paintContext, 
      offsetLocal: offsetLocal, 
      bottomMarginRoot:heightBottomLabel);
      layout.designLayout();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>true;
   
}
