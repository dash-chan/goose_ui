import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class RoundedDashBorder extends RoundedRectangleBorder {
  const RoundedDashBorder(
      {super.side, super.borderRadius, required this.interval});
  final List<double> interval;

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is RoundedDashBorder) {
      return RoundedDashBorder(
        side: BorderSide.lerp(side, b.side, t),
        borderRadius:
            BorderRadiusGeometry.lerp(borderRadius, b.borderRadius, t)!,
        interval: interval,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is RoundedDashBorder) {
      return RoundedDashBorder(
        side: BorderSide.lerp(a.side, side, t),
        borderRadius:
            BorderRadiusGeometry.lerp(a.borderRadius, borderRadius, t)!,
        interval: interval,
      );
    }
    return super.lerpFrom(a, t);
  }

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
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is StadiumDashBorder) {
      return StadiumDashBorder(
        side: BorderSide.lerp(side, b.side, t),
        interval: interval,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is StadiumDashBorder) {
      return StadiumDashBorder(
        side: BorderSide.lerp(a.side, side, t),
        interval: interval,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    canvas.drawPath(
      dashPath(getInnerPath(rect), dashArray: CircularIntervalList(interval)),
      side.toPaint(),
    );
  }
}
