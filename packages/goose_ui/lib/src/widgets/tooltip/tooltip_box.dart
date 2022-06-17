import 'package:flutter/material.dart';
import 'package:goose_ui/src/painting/arrow_box_path.dart';

import '../../enums/alignment.dart';
import 'tooltip_painter.dart';

class TooltipBox extends StatelessWidget {
  const TooltipBox({
    super.key,
    this.spacing = 12,
    required this.alignment,
    required this.color,
    required this.shadowColor,
    required this.child,
  });

  final double spacing;
  final AAlignment alignment;
  final Color color;
  final Color shadowColor;
  final Widget child;

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
        painter: TooltipPainter(
          alignment: alignment,
          color: color,
          shadowColor: shadowColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: child,
        ),
      ),
    );
  }
}

// TODO performance issue.
class TooltipShape extends ShapeBorder {
  const TooltipShape({
    this.side = BorderSide.none,
    this.borderRadius = BorderRadius.zero,
    this.alignment = AAlignment.topLeft,
  });
  final BorderSide side;
  final BorderRadius borderRadius;
  final AAlignment alignment;
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  AxisDirection get _direction {
    if (alignment.isTop) return AxisDirection.down;
    if (alignment.isBottom) return AxisDirection.up;
    if (alignment.isLeft) return AxisDirection.right;
    if (alignment.isRight) return AxisDirection.left;
    return AxisDirection.down;
  }

  double get _base {
    switch (alignment) {
      case AAlignment.topLeft:
      case AAlignment.bottomLeft:
      case AAlignment.leftTop:
      case AAlignment.rightTop:
        return 0.2;
      case AAlignment.topRight:
      case AAlignment.leftBottom:
      case AAlignment.rightBottom:
      case AAlignment.bottomRight:
        return 0.8;
      case AAlignment.topCenter:
      case AAlignment.bottomCenter:
      case AAlignment.rightCenter:
      case AAlignment.leftCenter:
        return 0.5;
    }
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return ArrowBoxPath(
      rect: rect,
      borderRadius: borderRadius,
      control: ArrowControlPoints.fromBaseline(
        rect,
        _direction,
        _base,
        8,
        12,
      ),
    );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return ArrowBoxPath(
      rect: rect,
      borderRadius: borderRadius,
      control: ArrowControlPoints.fromBaseline(
        rect,
        _direction,
        _base,
        8,
        12,
      ),
    );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (side.style == BorderStyle.none) return;
    final Paint paint = Paint()
      ..color = side.color
      ..strokeWidth = side.width;
    canvas.drawPath(getOuterPath(rect), paint);
  }

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}
