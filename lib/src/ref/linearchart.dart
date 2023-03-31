
// import 'dart:math';

// import 'package:chartui/src/ref/chartpainter.dart';
// import 'package:flutter/material.dart';

// class Linearchart extends StatefulWidget {
//   // final List<Score> scores;
//   // const Linearchart({ Key? key, required this.scores }) : super(key: key);
//   Linearchart();

//   @override
//   _LinearchartState createState() => _LinearchartState();
// }
// // const dayCount = 7;
// const WeekDays = ["","Mon","Tue","Wed","Thu","Fri","Sat","Sun"];
// class _LinearchartState extends State<Linearchart> {

//   double? _min , _max;
//   List<double> _Y = [];
//   List<String> _X = []; 
//   static final rn = Random();

//   final List<Score> scores = List<Score>.generate(7, (index){
     
//      final y = rn.nextDouble()+ 30.0;
//      final d= DateTime.now().add(Duration(days: 7-index));
//      return Score(y,d);
//   });


//   @override
//   void initState() {
//     var min = double.maxFinite;
//     var max = -double.maxFinite;
//     scores.forEach((element) {
//       print(element.value);
//       print("y");
//       min = min>element.value ? element.value : min;
//       max = max<element.value ? element.value : max;

//     });

//     setState(() {
//       _max = max;
//       _min = min;
//       _Y = scores.map((e) =>e.value).toList();
//       _X = scores.map((e) =>"${WeekDays[e.time.weekday]}\n${e.time.day}").toList();
//     });
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: CustomPaint(
//         child: Container(),
//         painter: ChartPainter(x:_X,y:_Y,min:_min as double,max:_max as double),
//       ),
//     );
//   }
// }

// class Score{
//    late double value;
//    late DateTime time;
//    Score(this.value,this.time);
// }
