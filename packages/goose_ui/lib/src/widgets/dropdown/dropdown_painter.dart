import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';
import 'package:goose_ui/src/painting/arrow_box_path.dart';

class ADropdownPainter extends CustomPainter {
  ADropdownPainter({
    required this.anchor,
    required this.showArrow,
    required this.shadowColor,
    required this.backgroundColor,
  });

  final ADropdownAnchor anchor;
  final bool showArrow;
  final Color shadowColor;
  final Color backgroundColor;

  double get _base {
    if (anchor == ADropdownAnchor.bottomLeft ||
        anchor == ADropdownAnchor.topLeft) {
      return 0.3;
    }
    if (anchor == ADropdownAnchor.bottomRight ||
        anchor == ADropdownAnchor.topRight) {
      return 0.7;
    }
    if (anchor == ADropdownAnchor.bottomCenter ||
        anchor == ADropdownAnchor.topCenter) {
      return 0.5;
    }
    return 0.5;
  }

  AxisDirection get _direction {
    switch (anchor) {
      case ADropdownAnchor.topLeft:
      case ADropdownAnchor.topCenter:
      case ADropdownAnchor.topRight:
        return AxisDirection.down;
      case ADropdownAnchor.bottomLeft:
      case ADropdownAnchor.bottomCenter:
      case ADropdownAnchor.bottomRight:
        return AxisDirection.up;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 10);
    final paint = Paint()..color = backgroundColor;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    ArrowControlPoints? control;
    if (showArrow) {
      control = ArrowControlPoints.fromBaseline(
        rect,
        _direction,
        _base,
        12,
        16,
      );
    }
    canvas.drawPath(
      ArrowBoxPath(
        rect: rect,
        borderRadius: BorderRadius.circular(4),
        control: control,
      ),
      shadowPaint,
    );
    canvas.drawPath(
      ArrowBoxPath(
        rect: rect,
        borderRadius: BorderRadius.circular(4),
        control: control,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(ADropdownPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ADropdownPainter oldDelegate) => false;
}
