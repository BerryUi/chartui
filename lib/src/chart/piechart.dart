import 'dart:async';
import 'package:chartui/animation.dart';
import 'package:chartui/chart_item.dart';
import 'package:chartui/src/painting/piechartpainter.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PieChart extends StatefulWidget {
    List<PieChartItem> dataset;
    ChartAnimation? animation;
    Color? strokeColor;
    double? strokeWidth;
    TextStyle? labelStyle;
    double height;
    double width;
    PieChart({super.key,
      required this.height,
      required this.width,
      this.animation, 
      required this.dataset,
      this.strokeColor,
      this.strokeWidth , 
      this.labelStyle});

  @override
  // ignore: library_private_types_in_public_api
  _PieChartState createState() => _PieChartState();
}


class _PieChartState extends State<PieChart> {
  
  late Timer timer;
  double fullAngle = 0.0;
  double secondsToComplete = 5.0;
  @override
  void initState() {
    if(widget.animation==null){
      fullAngle = 360;
      setState(() {
        
      });
      return ;
    } else if(widget.animation == ChartAnimation.rounded){
      timer = Timer.periodic(const Duration(milliseconds: 1000~/60), (timer) {
        setState(() {
          fullAngle += 360.0/(secondsToComplete*1000~/60);
          if(fullAngle>=360){
            fullAngle = 360.0;
            timer.cancel();
          }
        });
     });
    super.initState();
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: CustomPaint(  
        painter: PieChartPainter(labelStyle: widget.labelStyle==null ? const TextStyle(color: Colors.black) : widget.labelStyle as TextStyle,
          strokeColor: widget.strokeColor==null ? Colors.white : widget.strokeColor as Color,
          dataset:widget.dataset,fullAngle: fullAngle,strokeWidth:widget.strokeWidth==null ? 2 : widget.strokeWidth as double),  
        child: Container(),
      ),
    );
  }
}