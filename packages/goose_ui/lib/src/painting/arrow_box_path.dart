import 'dart:math';

import 'package:flutter/material.dart';

Path arrowBoxPath({
  required Rect rect,
  required BorderRadius borderRadius,
  required ArrowControlPoints? control,
}) {
  AxisDirection _direction(Offset point) {
    final dx = point.dx;
    final dy = point.dy;

    if (dx <= rect.left) return AxisDirection.left;
    if (dx >= rect.right) return AxisDirection.right;
    if (dy <= rect.top) return AxisDirection.up;
    if (dy >= rect.bottom) return AxisDirection.down;

    return AxisDirection.down;
  }

  final path = Path();
  if (control == null && borderRadius == BorderRadius.zero) {
    path.addRect(rect);
  } else if (control == null) {
    path.addRRect(borderRadius.toRRect(rect));
  } else {
    final needleDirection = _direction(control.needle);
    final startDirection = _direction(control.start);
    final endDirection = _direction(control.end);
    // check border radius
    // moveTo(rect.left, rect.top);

    // top-left
    path.arcTo(
      Rect.fromLTWH(
        rect.left,
        rect.top,
        borderRadius.topLeft.x,
        borderRadius.topLeft.y,
      ),
      -pi,
      pi / 2,
      false,
    );
    if (startDirection == AxisDirection.up) {
      path.lineTo(control.start.dx, control.start.dy);
      path.lineTo(control.needle.dx, control.needle.dy);
    }
    if (endDirection == AxisDirection.up) {
      path.lineTo(control.end.dx, control.end.dy);
    }

    path.arcTo(
      Rect.fromLTWH(
        rect.right - borderRadius.topRight.x,
        rect.top,
        borderRadius.topLeft.x,
        borderRadius.topLeft.y,
      ),
      -pi / 2,
      pi / 2,
      false,
    );

    if (startDirection == AxisDirection.right) {
      path.lineTo(control.start.dx, control.start.dy);
      path.lineTo(control.needle.dx, control.needle.dy);
    }
    if (endDirection == AxisDirection.right) {
      path.lineTo(control.end.dx, control.end.dy);
    }

    path.arcTo(
      Rect.fromLTWH(
        rect.right - borderRadius.bottomRight.x,
        rect.bottom - borderRadius.bottomRight.y,
        borderRadius.bottomRight.x,
        borderRadius.bottomRight.y,
      ),
      0,
      pi / 2,
      false,
    );

    if (startDirection == AxisDirection.down) {
      path.lineTo(control.start.dx, control.start.dy);
      path.lineTo(control.needle.dx, control.needle.dy);
    }
    if (endDirection == AxisDirection.down) {
      path.lineTo(control.end.dx, control.end.dy);
    }

    path.arcTo(
      Rect.fromLTWH(
        rect.left,
        rect.bottom - borderRadius.bottomLeft.y,
        borderRadius.bottomLeft.x,
        borderRadius.bottomLeft.y,
      ),
      pi / 2,
      pi / 2,
      false,
    );

    if (startDirection == AxisDirection.left) {
      path.lineTo(control.start.dx, control.start.dy);
      path.lineTo(control.needle.dx, control.needle.dy);
    }
    if (endDirection == AxisDirection.left) {
      path.lineTo(control.end.dx, control.end.dy);
    }

    path.close();
  }

  return path;
}

class ArrowControlPoints {
  const ArrowControlPoints({
    required this.start,
    required this.end,
    required this.needle,
  });

  factory ArrowControlPoints.fromBaseline(
    Rect rect,
    AxisDirection axis,
    // from zero to one
    double base,
    double height,
    double width,
  ) {
    late Offset baseOffset;
    late Offset needleOffset;
    late Offset startOffset;
    late Offset endOffset;
    double rectWidth = rect.width;
    double rectHeight = rect.height;
    double halfWidth = width / 2;

    switch (axis) {
      case AxisDirection.up:
        baseOffset = Offset(rect.left + rectWidth * base, rect.top);
        needleOffset = baseOffset.translate(0, -height);
        startOffset = baseOffset.translate(-halfWidth, 0);
        endOffset = baseOffset.translate(halfWidth, 0);
        break;
      case AxisDirection.down:
        baseOffset = Offset(rect.left + rectWidth * base, rect.bottom);
        needleOffset = baseOffset.translate(0, height);
        endOffset = baseOffset.translate(-halfWidth, 0);
        startOffset = baseOffset.translate(halfWidth, 0);
        break;
      case AxisDirection.right:
        baseOffset = Offset(rect.right, rect.top + rectHeight * base);
        needleOffset = baseOffset.translate(height, 0);
        startOffset = baseOffset.translate(0, -halfWidth);
        endOffset = baseOffset.translate(0, halfWidth);
        break;
      case AxisDirection.left:
        baseOffset = Offset(rect.left, rect.top + rectHeight * base);
        needleOffset = baseOffset.translate(-height, 0);
        endOffset = baseOffset.translate(0, -halfWidth);
        startOffset = baseOffset.translate(0, halfWidth);
        break;
    }

    return ArrowControlPoints(
      start: startOffset,
      end: endOffset,
      needle: needleOffset,
    );
  }

  final Offset start;
  final Offset end;
  final Offset needle;
}
