import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:goose_ui/src/widgets/dropdown/dropdown_box.dart';

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
    this.sameWidth = true,
    this.showArrow = false,
    required this.dropChild,
    required this.child,
  });

  final ADropdownAnchor anchor;
  final AInteractive trigger;
  final bool sameWidth;
  final bool showArrow;
  final Widget child;
  final Widget dropChild;

  @override
  State<ADropdown> createState() => _ADropdownState();
}

class _ADropdownState extends State<ADropdown> {
  bool _visible = false;

  Alignment get _target {
    if (widget.trigger == AInteractive.rightClick) return Alignment.topLeft;

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

  Alignment get _follower {
    if (widget.trigger == AInteractive.rightClick) return Alignment.topLeft;

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

  Offset _contextMenuOffset = Offset.zero;

  Offset get _offset {
    if (widget.trigger != AInteractive.rightClick) return Offset.zero;
    return _contextMenuOffset;
  }

  @override
  Widget build(BuildContext context) {
    return PortalTarget(
      visible: _visible,
      anchor: Aligned(
        follower: _follower,
        target: _target,
        offset: _offset,
        widthFactor: widget.sameWidth ? 1 : null,
      ),
      closeDuration: const Duration(milliseconds: 300),
      portalFollower: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _visible
            ? MouseRegion(
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
                child: DropdownBox(
                  anchor: widget.anchor,
                  showArrow: widget.showArrow,
                  child: widget.dropChild,
                ),
              )
            : const SizedBox.shrink(),
      ),
      child: MouseRegion(
        onEnter: (event) {
          if (widget.trigger == AInteractive.hover) {
            setState(() {
              _visible = true;
            });
          }
        },
        onExit: (event) {
          setState(() {
            _visible = false;
          });
        },
        child: Listener(
          behavior: HitTestBehavior.opaque,
          onPointerDown: (event) {
            if (widget.trigger == AInteractive.rightClick &&
                event.kind == PointerDeviceKind.mouse &&
                event.buttons == kSecondaryMouseButton) {
              setState(() {
                _contextMenuOffset = event.localPosition;
                _visible = true;
              });
              return;
            }
          },
          onPointerUp: (event) {
            if (widget.trigger == AInteractive.click) {
              setState(() {
                _visible = true;
              });
              return;
            }
          },
          child: widget.child,
        ),
      ),
    );
  }
}
