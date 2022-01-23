import 'package:flutter/material.dart';

class AnimatedSizedBox extends ImplicitlyAnimatedWidget {
  final Widget child;
  final Size size;
  const AnimatedSizedBox({
    Key? key,
    Duration duration = const Duration(milliseconds: 600),
    Curve curve = Curves.easeInOutCubic,
    required this.child,
    required this.size,
  }) : super(
          key: key,
          duration: duration,
          curve: curve,
        );

  @override
  _AnimatedSizedBoxState createState() => _AnimatedSizedBoxState();
}

class _AnimatedSizedBoxState extends AnimatedWidgetBaseState<AnimatedSizedBox> {
  Tween<double>? _heightTween;
  Tween<double>? _widthTween;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _heightTween?.evaluate(animation),
      width: _widthTween?.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    if (widget.size.height != double.infinity) {
      _heightTween = visitor(_heightTween, widget.size.height,
          (dynamic value) => Tween<double>(begin: value)) as Tween<double>?;
    }

    if (widget.size.width != double.infinity) {
      _widthTween = visitor(_widthTween, widget.size.width,
          (dynamic value) => Tween<double>(begin: value)) as Tween<double>?;
    }
  }
}
