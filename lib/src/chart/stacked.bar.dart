import 'package:chartui/src/layout/stacked.bar.layout.dart';
import 'package:flutter/material.dart';
import 'package:chartui/color.dart';
import '../context/paint_contexts.dart';
import '../layout/layout.dart';




// ignore: must_be_immutable
class StackedBarChart extends StatefulWidget {
   double? bottomLabelHeight;
   double? barWidth;
   Color? netColor;
   double? netStrokeWidth;
   double? labelWidth;
   double? barGap;
   List<Color>? barColorList;
   List<dynamic> y;
   double height;
   double width;
   List<List<double>> x;
   Color? axisColor;
   Color? backgroundColor;
   double? border;
   TextStyle? axisLabelStyle;
   EdgeInsets? edgeInsets;
   Mode? mode;
  StackedBarChart({ Key? key,this.mode,
      required this.width,
      required this.height,
      required this.x,
      required this.y,
      this.barWidth,
      this.barGap,
      this.edgeInsets,
      this.labelWidth,
      this.barColorList,
      this.netColor,
      this.border,
      this.axisColor,
      this.backgroundColor,
      this.bottomLabelHeight,
      this.axisLabelStyle
      }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StackedBarChartState createState() => _StackedBarChartState();
}

class _StackedBarChartState extends State<StackedBarChart> {
  bool _isRefactored = false;

  Offset offsetLocal = const Offset(0,0);

  void offRefactor()=> _isRefactored = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:widget.edgeInsets ??const EdgeInsets.only(top: 100,left:22,right: 22,bottom: 20),
      child: GestureDetector(
        onPanDown: (details) {
          setState(() {
            offsetLocal = details.localPosition;
          });
        },
        child: SizedBox(
          height: widget.height,
          width:widget.width,
          child: CustomPaint(
              painter: StackedBarChartPainter(
                barWidth:widget.barWidth ?? 35 ,
                barGap: widget.barGap ?? 10,
                barColorList: widget.barColorList ?? longListColor,
                x: widget.x,y: widget.y,
                netStrokeWidth: widget.netStrokeWidth ?? .5,
                netColor: widget.netColor ?? Colors.blueAccent,
                axisColor:widget.axisColor ??colorList[6],
                border: widget.border ?? 10.0,
                backgroundColor: widget.backgroundColor ?? Colors.black12,
                labelWidth: widget.labelWidth ?? 60,
                offsetLocal: offsetLocal,
                isRefactored: _isRefactored,
                offRefactor: offRefactor,
                heightBottomLabel: widget.bottomLabelHeight ?? 30,
                axisLabelStyle: widget.axisLabelStyle ??const TextStyle(color: Color.fromARGB(96, 7, 3, 237),fontSize: 15,fontWeight: FontWeight.bold),
                ),
              child: Container(),
          ),
        ),
      ),
    );
  }
}

class StackedBarChartPainter extends CustomPainter {
  double heightBottomLabel;
  double labelWidth;
  double barGap;
  List<Color> barColorList;
  double barWidth;
  Color axisColor;
  Color netColor;
  double netStrokeWidth;
  // List<double> x;
  List<List<double>> x;
  List<dynamic> y;
  Offset offsetLocal;
  Color backgroundColor;
  TextStyle axisLabelStyle;
  double border;
  StackedBarChartPainter({this.mode,
    required this.barWidth,
    required this.barGap,
    required this.barColorList,
    required this.netColor,
    required this.netStrokeWidth,
    required this.offsetLocal,
    required this.axisColor,
    required this.x,
    required this.y,
    required this.axisLabelStyle,
    required this.border,
    required this.backgroundColor,
    required this.labelWidth,
    required this.isRefactored,
    required this.offRefactor,
    required this.heightBottomLabel
    });
  Mode? mode;
  bool isRefactored;
  Function offRefactor;
  
   @override
  void paint(Canvas canvas, Size size) {
     PaintContext paintContext = PaintContext(
              canvas: canvas, 
              size: size,
              mode: mode ?? Mode.vertical,
              themeData: ThemeData(
                primaryColor: Colors.yellow
              ));
     StackedBarChartLayout layout = StackedBarChartLayout(
              x: x,y: y,
              barWidth: barWidth,
              bargap: barGap,
              barColorList: barColorList,
              netColor: netColor,
              netStrokeWidth: netStrokeWidth,
              axisColor: axisColor,
              yLabelstyle: axisLabelStyle,
              xLabelstyle: axisLabelStyle,
              border: border,
              backgroundColor: backgroundColor,
              offsetLocal: offsetLocal,
              paintContext: paintContext,
              bottomMarginRoot: heightBottomLabel,
              labelWidth: labelWidth,
              isRefactored: isRefactored,
              offRefactor: offRefactor
              );
     layout.designLayout();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>true;
}
