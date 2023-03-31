import 'package:flutter/material.dart';

class Compute {
   static Compute instance = Compute(); 
   Path computePath(List<Offset> points,Path path) {
        for(var i =0; i<points.length ; i++){
          final p = points[i];
          if(i==0){
            path.moveTo(p.dx, p.dy);
          }else{
            path.lineTo(p.dx, p.dy);
          }
        }
        // path.quadraticBezierTo(points[points.length-1].dx, points[points.length-1].dy,points[0].dx,points[1].dy);
        return path;
    }
    Path computePathA(List<Offset> points) {
         final path = Path();
        for(var i =0; i<points.length ; i++){
          final p = points[i];
          if(i==0){
            path.moveTo(p.dx, p.dy);
          }else{
            path.lineTo(p.dx, p.dy);
          }
        }
        // path.quadraticBezierTo(points[points.length-1].dx, points[points.length-1].dy,points[0].dx,points[1].dy);
        return path;
    }
}