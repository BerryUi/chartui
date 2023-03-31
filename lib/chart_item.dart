import 'package:flutter/material.dart';

class PieChartItem {
    double value;
    String label;
    Color? color;
    PieChartItem({
       required this.value,
       required this.label,
       this.color
    });
}

class BarChartItem {
   String label;
   double value;
  //  Color? barColor
   BarChartItem({
    required this.label,
    required this.value
    });

}


class DoughnutItem {
   double value;
   String label;
   DoughnutItem({
    required this.label,
    required this.value
    });
}

class RadiusAndCenter{
   double radius;
   Offset center;
   RadiusAndCenter({
    required this.radius,
    required this.center
   });
}



class Score{
   late double value;
   late DateTime time;
   Score(this.value,this.time);
}

// class RadialItemNL{
//    double x;
//    double y;
//    double z;
//    RadialItemNL({
//     required this.x,
//     required this.y,
//     required this.z
//    });
// }


















// ______________________________________________NEW_STYLE_CODING__________________________________


class PyramidData {
   String label;
   double y;
   PyramidData({
    required this.label,
    required this.y
   });
}


class XYdouble {
   double x;
   double y;
   XYdouble({
    required this.x,
    required this.y
   });
}