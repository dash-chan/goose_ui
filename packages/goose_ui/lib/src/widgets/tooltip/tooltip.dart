import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

import '../../enums/alignment.dart';
import 'tooltip_box.dart';
import 'tooltip_theme.dart';

class AToolTip extends StatefulWidget {
  const AToolTip(
      {super.key,
      this.alignment = AAlignment.topCenter,
      this.color,
      required this.child});

  final AAlignment alignment;
  final Color? color;
  final Widget child;

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

  @override
  void initState() {
    super.initState();
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
        child: TooltipBox(alignment: widget.alignment, color: _color),
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
