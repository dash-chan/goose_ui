import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class RibbonWidget extends SingleChildRenderObjectWidget {
  const RibbonWidget({
    super.key,
    super.child,
    required this.color,
    required this.darkColor,
  });

  final Color color;
  final Color darkColor;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RibbonRenderObject(
      color: color,
      darkColor: darkColor,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RibbonRenderObject renderObject) {
    renderObject
      ..color = color
      ..darkColor = darkColor;
  }
}

class RibbonRenderObject extends RenderProxyBox {
  RibbonRenderObject({required this.color, required this.darkColor});

  Color color;
  Color darkColor;

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

    context.canvas.drawRRect(
      RRect.fromRectAndCorners(
        offset & (size + const Offset(8, 0)),
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
      ),
      paint,
    );

    context.canvas.drawPath(
      Path()
        ..moveTo(paintRect.right, paintRect.bottom)
        ..lineTo(paintRect.right + 8, paintRect.bottom)
        ..lineTo(paintRect.right, paintRect.bottom + 4)
        ..close(),
      darkPaint,
    );

    super.paint(context, offset);
  }
}
