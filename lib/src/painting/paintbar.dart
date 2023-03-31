import 'package:flutter/material.dart';
import '../context/paint_contexts.dart';

class PaintBar{
  PaintContext paintContext;
  List<double> listData;
  List<Color> barColorList;
  double barWidth;
  double top = 0;
  double yOffsetGap;
  Offset offsetLocal;
  double leftMarginRoot;
  double bottomMarginRoot;
  double? right;
  double barGap;
  double bottom =0;
  double yLabelWidth;
  Color color;
  double barHeightAllotVar;
  bool isRefactored;
  Function offRefactor;
   PaintBar({
    required this.barColorList,
    required this.yLabelWidth,
    required this.barHeightAllotVar,
    required this.yOffsetGap,
    required this.offsetLocal,
    required this.leftMarginRoot,
    required this.listData,
    required this.paintContext,
    required this.color,
    required this.barWidth,
    required this.barGap,
    required this.isRefactored,
    required this.offRefactor,
    required this.bottomMarginRoot
    });
   

   void paint(){
    _calaculateTop();
      // List<double> revList 
      listData = listData.reversed.toList();
      for (var i = 0; i <listData.length; i++) {
        Paint paint = Paint()..color =barColorList[i%barColorList.length];
        top =top +barGap  +  yOffsetGap;   // barWidth ;
        bottom = top + barWidth;
        final barf = Rect.fromLTRB(leftMarginRoot, top,yLabelWidth+ barHeightAllotVar* listData[i],bottom);
        paintContext.canvas.drawRect(barf, paint);
      }
   }
   void _calaculateTop(){
     for (var i = 0; i <listData.length; i++) {
        // top =i==0 ? 0 : top +barGap  + barWidth ; ______should not remove
        top =top +barGap  +   yOffsetGap;  // barWidth ;
        bottom = top + yOffsetGap;   //barWidth;
      }
      top = paintContext.size.height-top-(barGap  + yOffsetGap  // barWidth
      )-bottomMarginRoot+5;
   
   }
}


class PaintStackedBar{
  PaintContext paintContext;
  List<List<double>> listData;
  List<Color> barColorList;
  double barWidth;
  double top = 0;
  double yOffsetGap;
  Offset offsetLocal;
  double leftMarginRoot;
  double bottomMarginRoot;
  double? right;
  double barGap;
  double bottom =0;
  double yLabelWidth;
  Color color;
  double barHeightAllotVar;
  bool isRefactored;
  Function offRefactor;
   PaintStackedBar({
    required this.barColorList,
    required this.yLabelWidth,
    required this.barHeightAllotVar,
    required this.yOffsetGap,
    required this.offsetLocal,
    required this.leftMarginRoot,
    required this.listData,
    required this.paintContext,
    required this.color,
    required this.barWidth,
    required this.barGap,
    required this.isRefactored,
    required this.offRefactor,
    required this.bottomMarginRoot
    });
   

   void paint(){
    _calaculateTop();
     //index longcolorindex
     int cin = 0;
      // List<double> revList 
      listData = listData.reversed.toList();
      for (var i = 0; i <listData.length; i++) {
        top =top +barGap  +  yOffsetGap;   // barWidth ;
        bottom = top + barWidth;

        // listData[i] = listData[i].reversed.toList();

        listData[i].sort((b, a) => a.compareTo(b));

        ///____________________this_here_stacked_follow___________________________
        
        double leftXfactor = leftMarginRoot;
        for (var j = 0; j <listData[i].length; j++) {
           
           Paint paint = Paint()..color =barColorList[cin%barColorList.length];
           cin++;
           final barf = Rect.fromLTRB(leftMarginRoot, top,yLabelWidth+ barHeightAllotVar* listData[i][j],bottom);
           leftXfactor = leftXfactor + barHeightAllotVar* listData[i][j];
           paintContext.canvas.drawRect(barf, paint);
        }
        // for (var element in listData[i]) {
           
        // }
        // final barf = Rect.fromLTRB(leftMarginRoot, top,yLabelWidth+ barHeightAllotVar* listData[i][0],bottom);
        // paintContext.canvas.drawRect(barf, paint);
      }
   }
   void _calaculateTop(){
     for (var i = 0; i <listData.length; i++) {
        // top =i==0 ? 0 : top +barGap  + barWidth ; ______should not remove
        top =top +barGap  +   yOffsetGap;  // barWidth ;
        bottom = top + yOffsetGap;   //barWidth;
      }
      top = paintContext.size.height-top-(barGap  + yOffsetGap  // barWidth
      )-bottomMarginRoot+5;
   
   }
}



class PaintPerStackedBar{
  PaintContext paintContext;
  List<List<double>> listData;
  List<Color> barColorList;
  double barWidth;
  double top = 0;
  List<double> maxfromValue;
  double drawableWidth;
  double drawableHeight;
  double yOffsetGap;
  Offset offsetLocal;
  double leftMarginRoot;
  double bottomMarginRoot;
  double? right;
  double barGap;
  double bottom =0;
  double yLabelWidth;
  Color color;
  double barHeightAllotVar;
   PaintPerStackedBar({
    required this.maxfromValue,
    required this.drawableHeight,
    required this.drawableWidth,
    required this.barColorList,
    required this.yLabelWidth,
    required this.barHeightAllotVar,
    required this.yOffsetGap,
    required this.offsetLocal,
    required this.leftMarginRoot,
    required this.listData,
    required this.paintContext,
    required this.color,
    required this.barWidth,
    required this.barGap,
    required this.bottomMarginRoot
    });
   

   void paint(){
    _calculateTop();
    
    listData = listData.reversed.toList();

    List<List<double>> listDataPM = [];


    for (var element in listData) {
       listDataPM.add(element);
    }
    
    
    for (var i = 0; i <listDataPM.length; i++) {
      //  element = element * maxfromValue[]
       for (var j = 0; j<listDataPM[i].length; j++) {
          listDataPM[i][j] = (j==0 ? 0: listDataPM[i][j-1]) +  listDataPM[i][j]*100/maxfromValue[i] ;
       }
    }



     int cin = 0;
      // List<double> revList 
      // listData = listData.reversed.toList();
      for (var i = 0; i <listDataPM.length; i++) {
        top =top +barGap  +  yOffsetGap;   // barWidth ;
        bottom = top + barWidth;
        listDataPM[i].sort((b, a) => a.compareTo(b));

        ///____________________this_here_stacked_follow___________________________
        
        // double leftXfactor = leftMarginRoot;
          

        //  for (var j = 0; j <listData[i].length; j++) {
        //    listData[i][j] = listData[i][j] *(100/maxfromValue[i]);
           
        // }


        double percAdder =0;
        double percAdder2 =0;


        ///____________________Up_Calculate_Pecentage___________________________
        for (var j = 0; j <listDataPM[i].length; j++) {
           percAdder += listDataPM[i][j];
           Paint paint = Paint()..color =barColorList[cin%barColorList.length];
           cin++;
           final barf = Rect.fromLTRB(percAdder2, top,percAdder ,bottom);
          //  leftXfactor = leftXfactor + barHeightAllotVar* listData[i][j];
           paintContext.canvas.drawRect(barf, paint);
           percAdder2 += listDataPM[i][j];
        }
      }
   }
   void _calculateTop(){
     for (var i = 0; i <listData.length; i++) {
        // top =i==0 ? 0 : top +barGap  + barWidth ; ______should not remove
        top =top +barGap  +   yOffsetGap;  // barWidth ;
        bottom = top + yOffsetGap;   //barWidth;
      }
      top = paintContext.size.height-top-(barGap  + yOffsetGap  // barWidth
      )-bottomMarginRoot+5;
   
   }
}

