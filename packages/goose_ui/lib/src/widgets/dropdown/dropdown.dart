import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

import '../../enums/enums.dart';

enum ADropdownAnchor {
  topLeft,
  topCenter,
  topRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
}

class ADropdown extends StatefulWidget {
  const ADropdown({
    super.key,
    this.anchor = ADropdownAnchor.bottomLeft,
    this.trigger = AInteractive.hover,
    required this.child,
  });

  final ADropdownAnchor anchor;
  final AInteractive trigger;
  final Widget child;

  @override
  State<ADropdown> createState() => _ADropdownState();
}

class _ADropdownState extends State<ADropdown> {
  bool _visible = false;

  Alignment get _follower {
    switch (widget.anchor) {
      case ADropdownAnchor.topLeft:
        return Alignment.topLeft;
      case ADropdownAnchor.topCenter:
        return Alignment.topCenter;
      case ADropdownAnchor.topRight:
        return Alignment.topRight;
      case ADropdownAnchor.bottomLeft:
        return Alignment.bottomLeft;
      case ADropdownAnchor.bottomCenter:
        return Alignment.bottomCenter;
      case ADropdownAnchor.bottomRight:
        return Alignment.bottomRight;
    }
  }

  Alignment get _target {
    switch (widget.anchor) {
      case ADropdownAnchor.topLeft:
        return Alignment.bottomLeft;
      case ADropdownAnchor.topCenter:
        return Alignment.bottomCenter;
      case ADropdownAnchor.topRight:
        return Alignment.bottomRight;
      case ADropdownAnchor.bottomLeft:
        return Alignment.topLeft;
      case ADropdownAnchor.bottomCenter:
        return Alignment.topCenter;
      case ADropdownAnchor.bottomRight:
        return Alignment.topRight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PortalTarget(
      visible: _visible,
      anchor: Aligned(
        follower: _follower,
        target: _target,
      ),
      closeDuration: const Duration(milliseconds: 300),
      portalFollower: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _visible ? Text('test') : const SizedBox.shrink(),
      ),
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            _visible = true;
          });
        },
        onExit: (event) {
          setState(() {
            _visible = false;
          });
        },
        child: GestureDetector(
          onTap: () {},
          child: widget.child,
        ),
      ),
    );
  }
}
