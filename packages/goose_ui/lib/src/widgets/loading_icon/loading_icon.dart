import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ALoadingIcon extends LeafRenderObjectWidget {
  const ALoadingIcon({
    super.key,
    this.color = Colors.black54,
    this.size = 16,
    this.width = 2,
    this.speed = 1,
    this.sweep = 0.25,
  });

  final Color color;
  final double size;
  final double width;
  final double speed;
  final double sweep;

  @override
  RenderALoadingIcon createRenderObject(BuildContext context) {
    return RenderALoadingIcon()
      ..color = color
      ..defaultSize = Size(size, size)
      ..width = width
      ..speed = speed
      ..sweep = sweep;
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderALoadingIcon renderObject) {
    renderObject
      ..color = color
      ..defaultSize = Size(size, size)
      ..width = width
      ..speed = speed
      ..sweep = sweep;
  }
}

class RenderALoadingIcon extends RenderBox {
  Color color = Colors.black;
  Size defaultSize = const Size(16, 16);
  double width = 2;
  double speed = 1;
  double value = 0;
  double sweep = 0.25;
  Duration? _timeStampCache;

  @override
  void performLayout() {
    size = constraints.constrain(
      constraints.isTight ? Size.infinite : defaultSize,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    needPaint(context, offset);
    scheduleNeedPaint();
  }

  scheduleNeedPaint() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (_timeStampCache == null) {
        _timeStampCache = timeStamp;
        markNeedsPaint();
        return;
      }
      if (_timeStampCache != timeStamp) {
        final delta = timeStamp - _timeStampCache!;
        value = value + delta.inMilliseconds * 0.005 * speed;
        if (value > pi * 2) {
          value -= pi * 2;
        }
      }

      _timeStampCache = timeStamp;
      markNeedsPaint();
    });
  }

  needPaint(PaintingContext context, Offset offset) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;

    final canvas = context.canvas;
    canvas.drawArc(
      Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height),
      value,
      pi * 2 * sweep,
      false,
      paint,
    );
  }
}
