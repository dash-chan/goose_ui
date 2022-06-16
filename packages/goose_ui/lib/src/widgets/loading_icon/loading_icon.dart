import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ALoadingIcon extends StatefulWidget {
  const ALoadingIcon({super.key});

  @override
  State<ALoadingIcon> createState() => _ALoadingIconState();
}

class _ALoadingIconState extends State<ALoadingIcon> {
  @override
  Widget build(BuildContext context) {
    return const _ALoadingIcon(value: 0.0);
  }
}

class _ALoadingIcon extends LeafRenderObjectWidget {
  const _ALoadingIcon({Key? key, required this.value}) : super(key: key);

  final double value;

  @override
  RenderALoadingIcon createRenderObject(BuildContext context) {
    return RenderALoadingIcon(color: Colors.black);
  }
}

class RenderALoadingIcon extends RenderBox {
  RenderALoadingIcon({required this.color});

  final Color color;

  double value = 0;
  Duration? _timeStampCache;

  @override
  void performLayout() {
    size = constraints.constrain(
      constraints.isTight ? Size.infinite : const Size(16, 16),
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
        value = value + delta.inMilliseconds * 0.005;
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
      ..color = Colors.black
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final canvas = context.canvas;
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      value,
      pi / 2,
      false,
      paint,
    );
  }
}
