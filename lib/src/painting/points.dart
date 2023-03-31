import 'package:flutter/material.dart';

class PointDraw {
   static get instance => PointDraw();

   void paint({required List<Offset> points,required Canvas canvas,required double radius,required Paint paint}){
       for (var element in points) {
        canvas.drawCircle(element, radius, paint);
       }
   }

}