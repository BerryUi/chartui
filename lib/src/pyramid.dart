import 'package:chartui/chartui.dart';
import 'package:chartui/src/layout/layout.dart';
import 'package:chartui/src/pyramidlayout.dart';
import 'package:flutter/material.dart';

import 'context/paint_contexts.dart';

// ignore: must_be_immutable
class PyramidChart extends StatefulWidget {
  Mode? mode;
  List<String> label;
  List<double> y;

  PyramidChart({super.key, 
    this.mode,
    required this.label,
    required this.y
  });

  @override
  // ignore: library_private_types_in_public_api
  _PyramidChartState createState() => _PyramidChartState();
}

class _PyramidChartState extends State<PyramidChart> {
  @override
  Widget build(BuildContext context) {
    
    List<PyramidData> data = [];
    for (var i = 0; i < widget.y.length; i++) {
      data.add(PyramidData(label: widget.label[i], y: widget.y[i] ));
    }
    

    return CustomPaint( 
     painter: PyramidPainter(
       mode: widget.mode ?? Mode.vertical,
       data: data
     ), 
     child: Container(),
    );
  }
}


class PyramidPainter extends CustomPainter {
  Mode mode;
  List<PyramidData> data;
  PyramidPainter({
    required this.mode,
    required this.data
  });
  @override
  void paint(Canvas canvas, Size size) {
    PaintContext paintContext = PaintContext(
          canvas: canvas, 
          size: size, 
          themeData: ThemeData(), 
          mode: mode
        );
    PyramidLayout(
      paintContext:paintContext,
      data: data
      ).designLayout();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=>true;
   
}