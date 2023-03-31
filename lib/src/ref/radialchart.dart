// import 'dart:async';
// import 'dart:math';

// import 'package:flutter/material.dart';

// class Radialchart extends StatefulWidget {
//   final double percentage = 100.0;
//   const Radialchart({ Key? key }) : super(key: key);

//   @override
//   _RadialchartState createState() => _RadialchartState();
// }

// class _RadialchartState extends State<Radialchart> {
//  late Timer timer;
//  var value = 0.0;
//  final speed = 0.5;
//  final List<Particle> particle = List<Particle>.generate(200, (index){
//     return Particle(color:Colors.white, opacity: getRandomRange(min:0.3, max:1.0), theta: getRandomRange(min: 0.0, max:360.0)*pi/180.0, orbit: radialSize+thickness/2.0, originalOrbit:radialSize+thickness/2.0);
//  }).toList();

//  @override
//   void initState() {
//     this.timer = Timer.periodic(Duration(milliseconds: 1000~/60), (timer) { 
//       var v = value;
//       // if(v<=widget.percentage){
//       //   v+=speed;
//       // }else{

//       // }
//       if(v <=widget.percentage){
//         v += speed;
//       }else{
//         setState(() {
//           particle.forEach((element) {
//           element.Update();
//         });
//         });
//       }
//       setState(() {
//         value =v;
//       });
//     });
//   }

//  @override
//   void dispose() {
//     timer.cancel();
//     super.dispose();
//   }



//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//        child: Container(),
//        painter: RadialProgressPainter(percentage:this.value,particles: particle),

//     );
//   }
// }
// final random = Random();
// final Color col1 = Color(0xff110f14);
// final Color col2 = Color(0xff2a2732);
// final Color col3 = Color(0xff3c3973f);
// final Color col4 = Color(0xff6047f5);
// final Color col5  = Color(0xffa3b0ef);
// class Particle{
//    double orbit;
//    double originalOrbit;
//    double theta;
//    double opacity;
//    Color color;
//    Particle({required this.color,required this.opacity,required this.theta,
//     required this.orbit,required this.originalOrbit});

//   void Update(){
//     this.orbit+=0.1;
//     this.opacity -= 0.0025;
//     if(this.opacity<=0.0){
//       this.orbit = this.originalOrbit;
//       this.opacity = getRandomRange(min:1.0, max:1.0);
//     }
//   }
// }

// double getRandomRange({required double min ,required double max}){
  
//   return random.nextDouble()*(max-min)+min;
// }


// const double radialSize = 100.0;
// const double thickness = 10.0;
// final TextStyle textStyle = TextStyle(color:Colors.pink.shade300,fontSize:30,fontWeight: FontWeight.bold );

// class RadialProgressPainter extends CustomPainter{
//   double percentage;
//   List<Particle> particles;
//   RadialProgressPainter({required this.particles, required this.percentage});
//    @override
//   void paint(Canvas canvas, Size size) {
//     canvas.drawPaint(Paint()..color = Colors.lightBlueAccent);

//     final c = Offset(size.width/2.0, size.height/2.0);
//     drawBackGround(canvas: canvas, c: c, extent: size.height/2.0);
//     final rect = Rect.fromCenter(center:c, width:2*radialSize, height:2*radialSize);

//     // canvas.drawRect(rect,Paint()..color=Colors.grey);
//      _drawGuidline(canvas: canvas, offset:c, radius: radialSize);
//      _drawArc(canvas: canvas, rect: rect);
//      _drawTextCentered(canvas: canvas, position:c, text:"${percentage.toInt()}", style:textStyle, maxWidth:radialSize *2*0.8);
//     //  if(percentage >=100.0){
//        _drawParticles(canvas: canvas, offset:c);
//     //  }
     
//     }

//     void _drawParticles({required Canvas canvas ,required Offset offset}){
       
//         particles.forEach((element) {
//           final paint = Paint()..color = element.color.withOpacity(element.opacity);
//            final cc = polarToCartesian(orbit:element.orbit, theta:element.theta) + offset;
//            canvas.drawCircle(cc,1.0, paint);
//         });
//     }

//     Offset polarToCartesian({required double orbit, required double theta}){
//        final dx = orbit*cos(theta);
//        final dy = orbit*sin(theta);
//        return Offset(dx, dy);
//     }

//     void drawBackGround({required Canvas canvas,required Offset c,required double extent}){
//        final rect = Rect.fromCenter(center:c, width:extent, height: extent);
//        final bgPaint = Paint()
//        ..shader = RadialGradient(colors: [col1,col2]).createShader(rect)
//        ..style=PaintingStyle.fill;
//        canvas.drawPaint(bgPaint);

//     }

//     void _drawArc({required Canvas canvas,required Rect rect}){
//       final fgPaint = Paint()
//       ..strokeWidth=thickness
//       ..style =PaintingStyle.stroke
//       ..shader = LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         tileMode: TileMode.mirror,
//         colors:[col4,col5]).createShader(rect);
//       final startAngle = -90.0*pi/180;
//       final paint = Paint()..style = PaintingStyle.stroke ..color = Colors.greenAccent..strokeWidth = thickness;
//       final sweepAngle = 360 *this.percentage/100 *pi/180.0;
//       canvas.drawArc(rect, startAngle, sweepAngle,false,fgPaint);
//     }

//     void _drawGuidline({required Canvas canvas , required Offset offset , required double radius}){
//        Paint paint = Paint()..color = Colors.grey.shade600
//               ..style = PaintingStyle.stroke
//               ..strokeWidth = 1.0;
//        canvas.drawCircle(offset, radius, paint);
//     }

//     void _drawTextCentered({required Canvas canvas ,required Offset position
//             ,required String text , required TextStyle style , required double maxWidth}){
            
//             final tp = measureText(text: text, style: style, maxWidth: maxWidth, align:   TextAlign.center);
//             tp.paint(canvas,position+Offset(-tp.width/2.0,-tp.height/2.0));
//     }

//     TextPainter measureText({required String text , required TextStyle style , required double maxWidth , required TextAlign align}){
//         final span = TextSpan(text: text,style: style);
//         final tp = TextPainter(text: span,textAlign: align,textDirection: TextDirection.ltr);
//          print("tp");
//         tp.layout(minWidth: 0,maxWidth: maxWidth);
//         return tp;
//     }



//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }