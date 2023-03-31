

// import 'package:flutter/material.dart';
// import 'dart:math';
// class ChartPainter extends CustomPainter{
//   final List<String> x;
//   final List<double> y;
//   final double min;
//   final double max;
//   ChartPainter({required this.x,required this.y,required this.max,required this.min});
//   static double border = 10.0;
//   final linePaint = Paint()
//   ..color = Colors.white
//   ..style = PaintingStyle.stroke
//   ..strokeWidth = 1.0;

//   final Color backgroundColor = Color(0xff1a1e23);

//   final labelStyle = TextStyle(color: Colors.white38,fontSize: 16);
//   final xLabelstyle = TextStyle(color: Colors.white38,fontSize: 16,fontWeight: FontWeight.bold);
//   @override
//   void paint(Canvas canvas, Size size) {
//     // final c = Offset(size.width/2,size.height/2);
//     // final r = 50.0;
//     // final paint = Paint()..color = Colors.black;
//     // canvas.drawCircle(c,r, paint);
//     final clipRect = Rect.fromLTWH(0, 0,size.width
//     ,size.height);
//     canvas.clipRect(clipRect);
//     canvas.drawPaint(Paint()..color = backgroundColor);
//     final drawableHeight = size.height - 2*border;
//     final drawableWidth = size.width -2*border;
//     final hd = drawableHeight/5;
//     final wd = drawableWidth/this.x.length.toDouble();

//     final height = hd*3.0;
//     final width = drawableWidth;

//     //if values are invalid;
//     if(height <= 0.0 || width <=0.0) return;
//     if(max -min <1.0*e -6) return ;

//     final hr = height/(max-min);
//     final left = border;
//     final top = border;
//     final c = Offset(left+wd/2.0,top+height/2.0);
    
//     _drawOutline(canvas,c,wd,height);

//     final points = _computePoints(c: c, width: wd, height: height, hr: hr);
//     // final path = _computePath(points);
    
//     final labels = _computeLabel();

     

//     // canvas.drawPath(path,linePaint);

//     _drawdatapoint(points,canvas,labels,c,wd);
//     // _drawlabels(canvas,labels,c,wd,points,top);
//     // points.forEach((element) {
//     //     label
//     //   
//     ///draw x label
//     final c1 = Offset(c.dx,top+ 4*hd);
//     _drawXlabels(canvas,c1,wd); 
        
//     // });
//     // TODO: implement paint
//   }

//   void _drawXlabels(Canvas canvas ,Offset c, double wd){
//     x.forEach((element) {
//       drawTextCentered(canvas, c,element, xLabelstyle, wd);
//       c+= Offset(wd,0);
//     });
//   }

//   void _drawdatapoint(List<Offset> points,Canvas canvas,
//       List<String> labels,Offset c,double wd
//       ){
//      for(var i =0;i<points.length;i++){
//       // final label = labels[i];
//       //  drawTextCentered(canvas,c,label,labelStyle,wd);
//        canvas.drawCircle(points[i],4.0,Paint()..color =Colors.white ..strokeWidth=1.0..style=PaintingStyle.stroke);
//       //  c=c+Offset(wd,0);
//     }
//   }

//   List<String> _computeLabel(){
//       return y.map((e) => "${e.toStringAsFixed(1)}").toList();
//   }

//   _computePath(List<Offset> points) {
//     final path  = Path();
    
//     for(var i =0; i<points.length ; i++){
//       final p = points[i];
//       if(i==0){
//         path.moveTo(p.dx, p.dy);
//       }else{
//         path.lineTo(p.dx, p.dy);
//       }
//     }
//     // path.(x1, y1, x2, y2)
//     path.quadraticBezierTo(points[points.length-1].dx, points[points.length-1].dy,points[0].dx,points[1].dy);
//     return path;
//   }
  
//   List<Offset> _computePoints({required Offset c,required double width, required double height, required double hr }){
//     List<Offset>  points =[];
//       y.forEach((element) {
//          final yy = (element -min)*hr;
//          final dp = Offset(c.dx, c.dy-height/2.0 + yy);
//          points.add(dp);
//           c += Offset(width,0);
//       });
//       return points;
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//      return true;
//     // TODO: implement shouldRepaint
//     // throw UnimplementedError();
//   }

//   final Paint outLinePaint = Paint()
//   ..strokeWidth = 1.0
//   ..style = PaintingStyle.stroke
//   ..color = Colors.white;

//   void _drawOutline(Canvas canvas, Offset c, double width, double height){
//       y.forEach((element) {
//         print(element);
//          final rect = Rect.fromCenter(center: c, width:width , height: height);
//          canvas.drawRect(rect,outLinePaint);
//          c+=Offset(width,0);
//       });
//   }
  
//   TextPainter measureText(String s ,TextStyle style , double maxWidth ,TextAlign align){
//      final span = TextSpan(text: s,style: style);
//      final tp = TextPainter(text: span,textAlign: align,textDirection: TextDirection.ltr);
//      tp.layout(minWidth: 0, maxWidth: maxWidth);
//      return tp;
//   }
//   Size drawTextCentered(Canvas canvas, Offset c, String text, TextStyle style, double maxWidth) {

//     final tp = measureText(text,style,maxWidth,TextAlign.center);
//     final pos = c+Offset(-tp.width/2, -tp.height/2);
//     tp.paint(canvas, pos);
//     return tp.size;
//   }
  
//   void _drawlabels(Canvas canvas, List<String> labels, Offset c, double wd,List<Offset> points,double top) {
//     var i =0;
//     labels.forEach((element) {
//        final dp = points[i];
//        final dy = (dp.dy -15.0) <top? 15.0 : -15.0;
//        final ly = dp + Offset(0, dy);
//        drawTextCentered(canvas,dp,element,labelStyle,wd);
//       //  c=c+Offset(wd,0);
//       i++;
//     });
//   }
  

// }

