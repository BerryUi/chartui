// import 'package:chartui/src/layout/stacked.bar.layout.dart';
import 'package:chartui/color.dart';
import 'package:chartui/src/pstackbar.layout.dart';
import 'package:flutter/material.dart';
import 'context/paint_contexts.dart';
import 'layout/layout.dart';




// ignore: must_be_immutable
class StackedBarPercent extends StatefulWidget {
   double? bottomLabelHeight;
   double? barWidth;
   Color? netColor;
   double? netStrokeWidth;
   double? labelWidth;
   double? barGap;
   List<Color>? barColorList;
   List<dynamic> y;
   double height=500;
   double width=350;
   List<List<double>> x;
   Color? axisColor;
   Color? backgroundColor;
   double? border;
   TextStyle? axisLabelStyle;
   EdgeInsets? edgeInsets;
   Mode? mode;
  // ignore: use_key_in_widget_constructors
  StackedBarPercent({Key? key,this.mode,
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
      }
      );


  @override
  // ignore: library_private_types_in_public_api
  _StackedBarPercentState createState() => _StackedBarPercentState();
}

class _StackedBarPercentState extends State<StackedBarPercent> {
  // bool _isRefactored = false;

  Offset offsetLocal = const Offset(0, 0);

  Offset offsetLocalHold = const Offset(0,0);

  // void _getDiff(Offset current){
  //   offsetLocal  += Offset(current.dx- offsetLocalHold.dx,current.dy- offsetLocalHold.dy);
     
  // }

  @override
  Widget build(BuildContext context) {
    // print(offsetLocal);
    return Container(
      margin://widget.edgeInsets ??
      const EdgeInsets.only(top: 100,left:22,right: 22,bottom: 20),
      child: GestureDetector(
        // onPanUpdate: (details) {
        //   setState(() {
        //      _getDiff(details.localPosition);
        //      offsetLocalHold =details.localPosition;
        //     // print("oddsetlocal $offsetLocal");
        //     // offsetLocal = details.localPosition;
        //   });
        // },
        // onPanStart: (details) {
        //   offsetLocalHold =details.localPosition;
        // },
        // onP
        // onVerticalDragUpdate: (details) {
           
           
        //    setState(() {
        //      _getDiff(details.localPosition);
        //      offsetLocalHold =details.localPosition;
        //     //  offsetLocal =details.localPosition;
        //    });
        //    print("oddsetlocal $offsetLocal");
           
        // },
        // onVerticalDragEnd: (details) {
        //        setState(() {
        //      offsetLocal2 =details.;               //NO USE   onVerticalDragDown,  onVerticalDragEnd
        //    });
        //    print("oddsetDragDown $offsetLocal2");
        // },
        // onVerticalDragDown: (details) {
        //     setState(() {
        //      offsetLocal2 =details.localPosition;               //NO USE
        //    });
        //    print("oddsetDragDown $offsetLocal2");
        // },
        child: SizedBox(
          height: widget.height,
          width:widget.width,
          child: CustomPaint(
              painter: StackedBarPerChartPainter(
                offsetLocal: offsetLocal,
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

class StackedBarPerChartPainter extends CustomPainter {
  
  Offset offsetLocal;

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
  // Offset offsetLocal;
  Color backgroundColor;
  TextStyle axisLabelStyle;
  double border;
  StackedBarPerChartPainter({//this.mode,
    required this.barWidth,
    required this.barGap,
    required this.barColorList,
    required this.netColor,
    required this.netStrokeWidth,
    required this.axisColor,
    required this.x,
    required this.y,
    required this.axisLabelStyle,
    required this.border,
    required this.backgroundColor,
    required this.labelWidth,
    required this.heightBottomLabel,
    required this.offsetLocal
    });
  Mode? mode;
  
   @override
  void paint(Canvas canvas, Size size) {
                                            // print(offsetLocal);
                                            // Offset p1 = Offset(size.width/2,size.width/2)+offsetLocal;
                                            // Offset p2 = Offset(205,205);
                                            // canvas.drawLine(p1,p2,Paint()..color=Colors.black);
                                            // canvas.drawCircle(p1, 20, Paint()..color=Colors.black);




     PaintContext paintContext = PaintContext(
              canvas: canvas, 
              size: size,
              mode: mode ?? Mode.vertical,
              themeData: ThemeData(
                primaryColor: Colors.yellow
              ));
     PercentStackedBarChartLayout layout = PercentStackedBarChartLayout(
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
              );
     layout.designLayout();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>true;
}
