import 'package:flutter/material.dart';

const Duration _kFadeOutDuration = Duration(milliseconds: 300);

/// a ink pulse feature.
///
/// This feature is used to create a ink pulse effect.
///
/// normally apply to a `Button`
class InkPulse extends InteractiveInkFeature {
  /// create a ink pulse feature.
  InkPulse({
    required super.controller,
    required super.referenceBox,
    required super.color,
    BorderRadius? borderRadius,
    ShapeBorder? shapeBorder,
    RectCallback? clipCallback,
  }) {
    _borderRadius = borderRadius;
    _shapeBorder = shapeBorder;
    _clipCallback = clipCallback;
    _fadeOutController = AnimationController(
        duration: _kFadeOutDuration, vsync: controller.vsync)
      ..addListener(controller.markNeedsPaint)
      ..addStatusListener(_handleAnimationStatusChanged);
    _fadeOut = _fadeOutController!
        .drive(Tween<double>(begin: 1, end: 0).chain(_fadeOutIntervalTween));
    _opacity = _fadeOutController!
        .drive(Tween<double>(begin: 1, end: 0).chain(_opacityIntervalTween));
    controller.addInkFeature(this);
  }
  AnimationController? _fadeOutController;
  late Animation<double> _fadeOut;
  late Animation<double> _opacity;
  late BorderRadius? _borderRadius;
  late ShapeBorder? _shapeBorder;
  late RectCallback? _clipCallback;

  static final Animatable<double> _fadeOutIntervalTween =
      CurveTween(curve: const Interval(0, 0.5));
  static final Animatable<double> _opacityIntervalTween =
      CurveTween(curve: const Interval(0.5, 1));

  /// Used to specify this type of ink splash for an [InkWell], [InkResponse],
  /// material [Theme], or [ButtonStyle].
  static const InteractiveInkFeatureFactory splashFactory = _InkPulseFactory();
  static const InteractiveInkFeatureFactory noSplashFactory =
      _InkNoPulseFactory();

  void _handleAnimationStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      dispose();
    }
  }

  @override
  void cancel() {
    dispose();
  }

  @override
  void confirm() {
    _fadeOutController?.animateTo(1, duration: _kFadeOutDuration);
  }

  @override
  void dispose() {
    _fadeOutController?.dispose();
    _fadeOutController = null;
    super.dispose();
  }

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {
    if (_fadeOutController?.isAnimating ?? false) {
      _paintFeature(
        canvas,
        transform,
        referenceBox.size,
        _fadeOut.value,
        _opacity.value,
        color,
        _borderRadius,
        _shapeBorder,
        _clipCallback,
      );
    }
  }
}

class NoInkFeature extends InteractiveInkFeature {
  NoInkFeature(
      {required super.controller,
      required super.referenceBox,
      required super.color});

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {
    return;
  }
}

class _InkPulseFactory extends InteractiveInkFeatureFactory {
  const _InkPulseFactory();

  @override
  InteractiveInkFeature create(
      {required MaterialInkController controller,
      required RenderBox referenceBox,
      required Offset position,
      required Color color,
      required TextDirection textDirection,
      bool containedInkWell = false,
      RectCallback? rectCallback,
      BorderRadius? borderRadius,
      ShapeBorder? customBorder,
      double? radius,
      VoidCallback? onRemoved}) {
    return InkPulse(
      controller: controller,
      referenceBox: referenceBox,
      color: color,
      borderRadius: borderRadius,
      shapeBorder: customBorder,
    );
  }
}

class _InkNoPulseFactory extends InteractiveInkFeatureFactory {
  const _InkNoPulseFactory();

  @override
  InteractiveInkFeature create(
      {required MaterialInkController controller,
      required RenderBox referenceBox,
      required Offset position,
      required Color color,
      required TextDirection textDirection,
      bool containedInkWell = false,
      RectCallback? rectCallback,
      BorderRadius? borderRadius,
      ShapeBorder? customBorder,
      double? radius,
      VoidCallback? onRemoved}) {
    return NoInkFeature(
        controller: controller, referenceBox: referenceBox, color: color);
  }
}

_paintFeature(
  Canvas canvas,
  Matrix4 transform,
  Size size,
  double fadeOut,
  double opacity,
  Color color,
  BorderRadius? borderRadius,
  ShapeBorder? shapeBorder,
  RectCallback? clipCallback,
) {
  final Offset? originOffset = MatrixUtils.getAsTranslation(transform);

  if (originOffset == null) {
    return;
  }

  final paint = Paint()
    ..color = color.withOpacity(opacity * 0.2)
    ..style = PaintingStyle.fill;
  Path path = Path();
  path.fillType = PathFillType.evenOdd;

  double diff = 4 * (1 - fadeOut);
  if (shapeBorder != null) {
    final borderPathInner = shapeBorder.getOuterPath(Rect.fromLTRB(
      originOffset.dx,
      originOffset.dy,
      originOffset.dx + size.width,
      originOffset.dy + size.height,
    ));
    final borderPathOuter = shapeBorder.getOuterPath(Rect.fromLTRB(
      originOffset.dx - diff,
      originOffset.dy - diff,
      originOffset.dx + size.width + diff,
      originOffset.dy + size.height + diff,
    ));
    path.addPath(borderPathInner, Offset.zero);
    path.addPath(borderPathOuter, Offset.zero);
  } else {
    path.addRect(Rect.fromLTRB(
      originOffset.dx,
      originOffset.dy,
      originOffset.dx + size.width,
      originOffset.dy + size.height,
    ));
    path.addRRect(
      RRect.fromLTRBR(
        originOffset.dx - diff,
        originOffset.dy - diff,
        originOffset.dx + size.width + diff,
        originOffset.dy + size.height + diff,
        const Radius.circular(4),
      ),
    );
  }

  canvas.drawPath(path, paint);
}
