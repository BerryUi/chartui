import 'package:flutter/material.dart';

class OffsetContext {
   double xOffsetGap;
   double yOffsetGap;
   Offset yOffsetStart;
   Offset xOffsetStart;
   OffsetContext({
    required this.xOffsetGap,
    required this.xOffsetStart,
    required this.yOffsetGap,
    required this.yOffsetStart
   });
}