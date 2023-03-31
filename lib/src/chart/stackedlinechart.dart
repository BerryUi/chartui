import 'package:chartui/color.dart';
import 'package:chartui/src/layout/layout.dart';
import 'package:chartui/src/layout/stacklinelayout.dart';
import 'package:flutter/material.dart';

import '../context/paint_contexts.dart';


// ignore: must_be_immutable
class StackedLineChart extends StatefulWidget {
  StackedLineChart({super.key, 
    required this.height,
    required this.width,
    required this.xAxisData,
    required this.yNestedData,
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
    this.areaColorList,
    this.pointRadius
  });
  double? xFixedLabelGap;
  double height;
  double width;
  List<dynamic> xAxisData;
  List<List<double>> yNestedData;
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
  List<Color>? areaColorList;
  double? pointRadius;

  @override
  // ignore: library_private_types_in_public_api
  _StackedLineChartState createState() => _StackedLineChartState();
}

class _StackedLineChartState extends State<StackedLineChart> {



  Offset offsetLocal = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical:100,horizontal:20),
      height:widget.height,
      width:widget.width,
      child: CustomPaint(
        painter: StackedLineChartPainter(
          pointRadius: widget.pointRadius ?? 4.5,
          areaColorList: widget.areaColorList ?? longListColor,
          yNestedData:widget.yNestedData,
          xFixedLabelGap:widget.xFixedLabelGap ?? 40,
          lineColor: widget.lineColor?? Colors.blue.shade200,
          lineWidth: widget.lineWidth??2,
          extraGap: widget.extraGap ?? 10,
          xAxisData:widget.xAxisData,
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

class StackedLineChartPainter extends CustomPainter {
  List<List<double>> yNestedData;
  List<dynamic> xAxisData;
  double pointRadius;
  double xFixedLabelGap;
  double extraGap;
  double lineWidth;
  Color lineColor;
  bool drawNet;
  bool drawAxis;
  double heightBottomLabel;
  double labelWidth;
  List<Color> areaColorList;
  Color axisColor;
  Color netColor;
  double netStrokeWidth;
  Offset offsetLocal;
  Color backgroundColor;
  TextStyle axisLabelStyle;
  double border;
  StackedLineChartPainter({
    required this.pointRadius,
    required this.yNestedData,
    required this.xFixedLabelGap,
    required this.lineColor,
    required this.lineWidth,
    required this.extraGap,
    required this.areaColorList,
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

    final layout = StackedLineChartLayout(
      pointRadius: pointRadius,
      areaColorList: areaColorList,
      yNestedData: yNestedData,
      xFixedLabelGap:xFixedLabelGap ,
      lineColor: lineColor,
      lineWidth: lineWidth,
      extraGap: extraGap,
      drawAxis: drawAxis, 
      drawNet: drawNet, 
      netStrokeWidth: netStrokeWidth, 
      netColor: netColor,x: xAxisData, // y: yAxisData,
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
