import 'package:flutter/material.dart';

import '../../enums/alignment.dart';
import 'tooltip_painter.dart';

class TooltipBox extends StatelessWidget {
  const TooltipBox(
      {super.key,
      this.spacing = 12,
      required this.alignment,
      required this.color});

  final double spacing;
  final AAlignment alignment;
  final Color color;

  EdgeInsets get _padding {
    if (alignment.isTop) {
      return EdgeInsets.only(bottom: spacing);
    } else if (alignment.isLeft) {
      return EdgeInsets.only(right: spacing);
    } else if (alignment.isBottom) {
      return EdgeInsets.only(top: spacing);
    } else if (alignment.isRight) {
      return EdgeInsets.only(left: spacing);
    } else {
      return EdgeInsets.zero;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      // TODO refactor use [SingleChildRenderObjectWidget] & [RenderProxyBox]
      child: CustomPaint(
        painter: TooltipPainter(alignment: alignment, color: color),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Text('tooltip'),
        ),
      ),
    );
  }
}
