import 'package:chartui/src/layout/scatterChartLayout.dart';
import 'package:flutter/material.dart';
import '../../color.dart';
import '../context/paint_contexts.dart';
import '../layout/layout.dart';

// ignore: must_be_immutable
class ScatterChart extends StatefulWidget {
  List<double> x;
  List<double> y;
  EdgeInsets? padding;
  double? bottomMarginRoot;
  double? labelWidth;
  double? dotRadius;
  TextStyle? axisLabelStyle;
  double width;
  double height;
  Color? dotColor;
  Color? axisColor;
  Mode? mode;
  Color? backgroundColor;
  ScatterChart({super.key, 
      required this.height,
      required this.width,
      required this.x,
      required this.y,
      this.backgroundColor,
      this.mode,
      this.dotRadius,
      this.bottomMarginRoot,
      this.labelWidth,
      this.dotColor,
      this.axisLabelStyle,
      this.axisColor,
      this.padding,
    });

  @override
  // ignore: library_private_types_in_public_api
  _ScatterChartState createState() => _ScatterChartState();
}

class _ScatterChartState extends State<ScatterChart> {

  @override
  Widget build(BuildContext context) {

    return Container(
      
      width: widget.width,
      height: widget.height,
      padding:widget.padding,
      child: CustomPaint(
        painter: ChartPainter(
          x:widget.x,y:widget.y,
          dotRadius: widget.dotRadius ?? 4.0,
          backgroundColor: widget.backgroundColor ?? Colors.black12,
          bottomMarginRoot: widget.bottomMarginRoot ?? 50,
          labelWidth: widget.labelWidth ?? 40,
          dotColor:widget.dotColor ?? Colors.white,
          axisLabelStyle: widget.axisLabelStyle ??const TextStyle(color: Colors.white38,fontSize: 16,fontWeight: FontWeight.bold),
          axisColor:widget.axisColor ??colorList[6],
        ),
        child: Container(),
      ),
    );
  }
}



class ChartPainter extends CustomPainter{
  final List<double> x;
  final List<double> y;
  double dotRadius;
  TextStyle axisLabelStyle;
  Color backgroundColor;
  double bottomMarginRoot;
  double labelWidth;
  Color dotColor;
  Color axisColor;
  ChartPainter({
    required this.x,required this.y,
    required this.dotRadius,
    required this.backgroundColor,
    required this.bottomMarginRoot,
    required this.labelWidth,
    required this.dotColor,
    required this.axisLabelStyle,
    required this.axisColor,
  });
  static double border = 10.0;
  final linePaint = Paint()
  ..color = Colors.white
  ..style = PaintingStyle.stroke
  ..strokeWidth = 1.0;

  @override
  void paint(Canvas canvas, Size size) {

    PaintContext paintContext = PaintContext(
      canvas: canvas, 
      size: size,
      themeData:ThemeData(
        primaryColor:colorList[5]
      ), 
      mode: Mode.vertical
    );

    ScatterChartLayout(
      dotRadius: dotRadius,
      paintContext: paintContext, 
      x: x, y: y, 
      border: border, 
      xLabelstyle: axisLabelStyle,
      yLabelstyle: axisLabelStyle,
      bottomMarginRoot:bottomMarginRoot,
      labelWidth: labelWidth,
      dotColor: dotColor,
      axisColor: axisColor,
      backgroundColor:backgroundColor).designLayout();

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>true;

}