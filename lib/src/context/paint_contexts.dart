import 'package:flutter/material.dart';
import '../layout/layout.dart';

class PaintContext {
   Canvas canvas;
   ThemeData themeData;
   Size size;
   Mode mode;
   PaintContext({
      required this.canvas, 
      required this.size,
      required this.themeData,
      required this.mode
    });

    PaintContext copyWith({
        Canvas? canvas,
        ThemeData? themeData,
        Size? size,
        Mode? mode,
    }){
      return PaintContext(
        canvas: canvas ?? this.canvas, 
        size: size ?? this.size, 
        themeData: themeData ?? this.themeData, 
        mode: mode??this.mode);
    }
}