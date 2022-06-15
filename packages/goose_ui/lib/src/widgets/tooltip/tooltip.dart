import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

import '../../enums/alignment.dart';
import 'tooltip_box.dart';
import 'tooltip_theme.dart';

class AToolTip extends StatefulWidget {
  const AToolTip({
    super.key,
    this.alignment = AAlignment.topCenter,
    this.color,
    this.shadowColor,
    required this.child,
    this.labelColor,
    this.labelText,
    this.label,
  }) : assert(
            label != null || labelText != null, 'must set label or label text');

  final AAlignment alignment;
  final Color? color;
  final Color? shadowColor;
  final Color? labelColor;

  final Widget child;
  final String? labelText;
  final Widget? label;

  @override
  State<AToolTip> createState() => _AToolTipState();
}

class _AToolTipState extends State<AToolTip> {
  bool _state = false;
  Timer? _timer;

  countDown() {
    _timer = Timer(const Duration(milliseconds: 300), () {
      setState(() {
        if (mounted) _state = false;
      });
    });
  }

  removeTimer() {
    _timer?.cancel();
    _timer = null;
  }

  Anchor get _anchor {
    late Alignment target;
    late Alignment follower;
    switch (widget.alignment) {
      case AAlignment.topLeft:
        target = Alignment.topLeft;
        follower = Alignment.bottomLeft;
        break;
      case AAlignment.topCenter:
        target = Alignment.topCenter;
        follower = Alignment.bottomCenter;
        break;
      case AAlignment.topRight:
        target = Alignment.topRight;
        follower = Alignment.bottomRight;
        break;
      case AAlignment.leftTop:
        target = Alignment.topLeft;
        follower = Alignment.topRight;
        break;
      case AAlignment.leftCenter:
        target = Alignment.centerLeft;
        follower = Alignment.centerRight;
        break;
      case AAlignment.leftBottom:
        target = Alignment.bottomLeft;
        follower = Alignment.bottomRight;
        break;
      case AAlignment.rightTop:
        target = Alignment.topRight;
        follower = Alignment.topLeft;
        break;
      case AAlignment.rightCenter:
        target = Alignment.centerRight;
        follower = Alignment.centerLeft;
        break;
      case AAlignment.rightBottom:
        target = Alignment.bottomRight;
        follower = Alignment.bottomLeft;
        break;
      case AAlignment.bottomLeft:
        target = Alignment.bottomLeft;
        follower = Alignment.topLeft;
        break;
      case AAlignment.bottomCenter:
        target = Alignment.bottomCenter;
        follower = Alignment.topCenter;
        break;
      case AAlignment.bottomRight:
        target = Alignment.bottomRight;
        follower = Alignment.topRight;
        break;
    }

    return Aligned(follower: follower, target: target);
  }

  Color get _color {
    return widget.color ?? ATooltipTheme.of(context).color ?? Colors.black;
  }

  Color get _shadowColor {
    if (widget.shadowColor == null && widget.color != null) {
      return widget.color!.withOpacity(0.2);
    }
    return widget.shadowColor ??
        ATooltipTheme.of(context).shadowColor ??
        Colors.black.withOpacity(0.2);
  }

  Color get _labelColor {
    return widget.labelColor ??
        ATooltipTheme.of(context).labelColor ??
        Colors.white;
  }

  TextStyle get _textStyle {
    return ATooltipTheme.of(context).style ?? const TextStyle(fontSize: 14);
  }

  Widget get _labelWidget {
    late Widget label;
    if (widget.labelText != null) {
      label = Text(widget.labelText!);
    } else if (widget.label != null) {
      label = widget.label!;
    } else {
      throw UnimplementedError();
    }
    return DefaultTextStyle(
      style: _textStyle.copyWith(color: _labelColor),
      child: label,
    );
  }

  @override
  void dispose() {
    removeTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PortalTarget(
      visible: _state,
      // visible: true,
      anchor: _anchor,
      portalFollower: MouseRegion(
        onEnter: (_) => removeTimer(),
        onExit: (_) => countDown(),
        child: TooltipBox(
          alignment: widget.alignment,
          color: _color,
          shadowColor: _shadowColor,
          child: _labelWidget,
        ),
      ),
      child: MouseRegion(
        hitTestBehavior: HitTestBehavior.translucent,
        onEnter: (event) {
          removeTimer();
          setState(() {
            _state = true;
          });
        },
        onExit: (event) {
          countDown();
        },
        child: widget.child,
      ),
    );
  }
}
