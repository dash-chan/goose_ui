import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:goose_ui/src/widgets/badge/badge.dart';

class RibbonWidget extends SingleChildRenderObjectWidget {
  const RibbonWidget({
    super.key,
    super.child,
    required this.color,
    required this.darkColor,
    required this.placement,
    required this.padding,
  });

  final Color color;
  final Color darkColor;
  final ARibbonPlacement placement;
  final EdgeInsets padding;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RibbonRenderObject(
      color: color,
      darkColor: darkColor,
      placement: placement,
      padding: padding,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RibbonRenderObject renderObject) {
    renderObject
      ..color = color
      ..darkColor = darkColor
      ..placement = placement
      ..padding = padding;
  }
}

class RibbonRenderObject extends RenderProxyBox {
  RibbonRenderObject({
    required this.color,
    required this.darkColor,
    required this.placement,
    required this.padding,
  });

  Color color;
  Color darkColor;
  ARibbonPlacement placement;
  EdgeInsets padding;

  Offset get _computedOffset {
    switch (placement) {
      case ARibbonPlacement.start:
        return Offset(-padding.left, 0);
      case ARibbonPlacement.end:
        return Offset(padding.right, 0);
    }
  }

  @override
  void performLayout() {
    child!.layout(constraints, parentUsesSize: true);
    size = child!.size;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final paint = Paint()..color = color;
    final darkPaint = Paint()..color = darkColor;
    const radius = Radius.circular(2);
    final paintRect = offset & size;

    final nextOffset = offset + _computedOffset;

    switch (placement) {
      case ARibbonPlacement.start:
        context.canvas.drawRRect(
          RRect.fromRectAndCorners(
            nextOffset & size,
            topLeft: radius,
            topRight: radius,
            bottomRight: radius,
          ),
          paint,
        );
        context.canvas.drawPath(
          Path()
            ..moveTo(paintRect.left, paintRect.bottom)
            ..lineTo(paintRect.left + _computedOffset.dx, paintRect.bottom)
            ..lineTo(paintRect.left, paintRect.bottom - _computedOffset.dx / 2)
            ..close(),
          darkPaint,
        );
        break;
      case ARibbonPlacement.end:
        context.canvas.drawRRect(
          RRect.fromRectAndCorners(
            nextOffset & size,
            topLeft: radius,
            topRight: radius,
            bottomLeft: radius,
          ),
          paint,
        );
        context.canvas.drawPath(
          Path()
            ..moveTo(paintRect.right, paintRect.bottom)
            ..lineTo(paintRect.right + _computedOffset.dx, paintRect.bottom)
            ..lineTo(paintRect.right, paintRect.bottom + _computedOffset.dx / 2)
            ..close(),
          darkPaint,
        );
        break;
    }

    super.paint(context, nextOffset);
  }
}
