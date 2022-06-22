import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

export 'ribbon_badge.dart';

enum ABadgeStatus {
  success,
  processing,
  default_,
  error,
  warning,
}

class ABadge extends StatefulWidget {
  const ABadge({
    super.key,
    this.color,
    this.count,
    this.offset,
    this.overflowCount,
    this.showZero,
    this.size,
    this.status,
    this.tooltip,
    this.text,
    this.border,
    this.shape,
    required this.child,
  });

  final Color? color;
  final int? count;
  final Offset? offset;
  final int? overflowCount;
  final bool? showZero;
  final ASize? size;
  final ABadgeStatus? status;
  final Widget? tooltip;
  final Widget? text;
  final BorderSide? border;
  final ShapeBorder? shape;
  final Widget child;

  @override
  State<ABadge> createState() => _ABadgeState();
}

class _ABadgeState extends State<ABadge> {
  Offset get _offset => widget.offset ?? Offset.zero;
  ASize get _size => widget.size ?? ASize.medium;
  EdgeInsets get _padding {
    if (_size == ASize.small) return EdgeInsets.zero;
    return const EdgeInsets.symmetric(horizontal: 8);
  }

  BorderSide get _border {
    if (widget.border != null) return widget.border!;
    return const BorderSide(color: Colors.white, width: 1);
  }

  ShapeBorder get _shape {
    if (widget.shape != null) {
      return widget.shape!;
    }
    return StadiumBorder(side: _border);
  }

  @override
  Widget build(BuildContext context) {
    Widget badgeChild = widget.text ?? const SizedBox.shrink();

    // wrap padding
    if (_padding != EdgeInsets.zero) {
      badgeChild = Padding(padding: _padding, child: badgeChild);
    }

    badgeChild = ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 6, minHeight: 6),
      child: badgeChild,
    );

    badgeChild = Material(
      color: Colors.red,
      shape: _shape,
      child: badgeChild,
    );
    return Stack(
      children: [
        widget.child,
        Positioned(
          top: _offset.dx,
          right: _offset.dy,
          child: badgeChild,
        ),
      ],
    );
  }
}
