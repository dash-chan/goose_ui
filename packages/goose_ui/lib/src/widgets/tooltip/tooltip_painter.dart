import 'package:flutter/material.dart';
import 'package:goose_ui/src/painting/arrow_box_path.dart';

import '../../enums/alignment.dart';

class TooltipPainter extends CustomPainter {
  const TooltipPainter({
    required this.alignment,
    required this.color,
    required this.shadowColor,
  });

  final AAlignment alignment;
  final Color color;
  final Color shadowColor;

  double get _base {
    switch (alignment) {
      case AAlignment.topLeft:
      case AAlignment.bottomLeft:
      case AAlignment.leftTop:
      case AAlignment.rightTop:
        return 0.3;
      case AAlignment.topRight:
      case AAlignment.leftBottom:
      case AAlignment.rightBottom:
      case AAlignment.bottomRight:
        return 0.7;
      case AAlignment.topCenter:
      case AAlignment.bottomCenter:
      case AAlignment.rightCenter:
      case AAlignment.leftCenter:
        return 0.5;
    }
  }

  AxisDirection get _direction {
    if (alignment.isTop) return AxisDirection.down;
    if (alignment.isBottom) return AxisDirection.up;
    if (alignment.isLeft) return AxisDirection.right;
    if (alignment.isRight) return AxisDirection.left;
    return AxisDirection.down;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Paint shadowPaint = Paint()
      ..color = shadowColor
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 8)
      ..strokeWidth = 1;

    const left = 0.0;
    const top = 0.0;
    final bottom = size.height;
    final right = size.width;

    final rect = Rect.fromLTRB(left, top, right, bottom);
    final borderRadius = BorderRadius.circular(4);
    final control = ArrowControlPoints.fromBaseline(
      Rect.fromLTRB(left, top, right, bottom),
      _direction,
      _base,
      6,
      12,
    );
    final path = arrowBoxPath(
      rect: rect,
      borderRadius: borderRadius,
      control: control,
    );

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TooltipPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TooltipPainter oldDelegate) => false;
}
