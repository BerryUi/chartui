// import 'package:chartui/src/context/paintContext.dart';

// class Calculate<T> {
//    List<T> listData;
//    double top;
//    double bottom;
//    double barGap;
//    double yOffsetGap;
//    double bottomMarginRoot;
//    PaintContext paintContext;
//    Calculate({
//     required this.listData,
//     required this.barGap,
//     required this.top,
//     required this.yOffsetGap,
//     required this.bottom,
//     required this.paintContext,
//     required this.bottomMarginRoot
//    });
//    void calculateTop(){
//      for (var i = 0; i <listData.length; i++) {
//         top =top +barGap  +   yOffsetGap;
//         bottom = top + yOffsetGap;
//       }
//       top = paintContext.size.height-top-(barGap  + yOffsetGap)-bottomMarginRoot+5;
//    }

//    double get getTop => top;
// }


class Calculate {
   double max = double.minPositive;
  //  double min = double.maxFinite;
   getMax(List<double> items){
     for (var element in items) {
        max = max < element? element: max;
     }
   }
  //  getMin(List<double> items){
  //    for (var element in items) {
  //       max = max < element? element: max;
  //    }
  //  }
}