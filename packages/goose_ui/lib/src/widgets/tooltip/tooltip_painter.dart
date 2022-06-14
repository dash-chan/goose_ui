import 'package:flutter/material.dart';
import 'package:goose_ui/src/painting/arrow_box_path.dart';

import '../../enums/alignment.dart';

class TooltipPainter extends CustomPainter {
  const TooltipPainter({
    required this.alignment,
    required this.color,
  });

  final AAlignment alignment;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Paint shadowPaint = Paint()
      ..color = color.withOpacity(0.1)
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 8)
      ..strokeWidth = 1;

    const left = 0.0;
    const top = 0.0;
    final bottom = size.height;
    final right = size.width;

    canvas.drawPath(
      arrowBoxPath(
        rect: Rect.fromLTRB(left, top, right, bottom),
        alignment: alignment,
      ),
      shadowPaint,
    );
    canvas.drawPath(
      arrowBoxPath(
        rect: Rect.fromLTRB(left, top, right, bottom),
        alignment: alignment,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(TooltipPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TooltipPainter oldDelegate) => false;
}
