import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class RoundedDashBorder extends RoundedRectangleBorder {
  const RoundedDashBorder(
      {super.side, super.borderRadius, required this.interval});
  final List<double> interval;
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    canvas.drawPath(
      dashPath(getInnerPath(rect), dashArray: CircularIntervalList(interval)),
      side.toPaint(),
    );
  }
}

class StadiumDashBorder extends StadiumBorder {
  const StadiumDashBorder({super.side, required this.interval});
  final List<double> interval;

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    canvas.drawPath(
      dashPath(getInnerPath(rect), dashArray: CircularIntervalList(interval)),
      side.toPaint(),
    );
  }
}
