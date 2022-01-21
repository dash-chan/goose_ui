import 'package:flutter/material.dart';

/// GButton
class GRawButton extends StatelessWidget {
  ///点击事件
  final VoidCallback? onPressed;

  /// 自组件
  final Widget child;

  /// icon
  final Widget? icon;

  /// 宽度
  final double? width;

  /// 高度
  final double height;

  ///内边距
  final EdgeInsets padding;

  ///外边距
  final EdgeInsets margin;

  /// 形状
  final ShapeBorder shape;

  /// 圆角
  final BorderRadius? borderRadius;

  ///颜色
  final Color? color;

  /// 剪裁
  final Clip clip;

  /// 阴影高度
  final double elevation;

  ///阴影
  final List<BoxShadow>? shadow;

  const GRawButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.icon,
    this.width,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.height = 32,
    this.margin = EdgeInsets.zero,
    this.shape = const StadiumBorder(),
    this.borderRadius,
    this.color,
    this.clip = Clip.hardEdge,
    this.elevation = 0.0,
    this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSpecificWidth = width != null;
    bool hasIcon = icon != null;
    bool disabled = onPressed == null;
    Widget textChild = DefaultTextStyle(
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      overflow: isSpecificWidth ? TextOverflow.fade : TextOverflow.clip,
      softWrap: false,
      maxLines: 1,
      child: child,
    );

    Widget _child = textChild;

    if (hasIcon) {
      if (isSpecificWidth) {
        _child = Expanded(child: _child);
      }
      List<Widget> _children = [
        icon!,
        const SizedBox(width: 4),
        _child,
      ];
      _child = Row(
        mainAxisSize: isSpecificWidth ? MainAxisSize.max : MainAxisSize.min,
        children: _children,
      );
    }

    if (!isSpecificWidth) {
      _child = Center(child: _child);
    }

    if (padding != EdgeInsets.zero) {
      _child = Padding(padding: padding, child: _child);
    }

    _child = Material(
      shape: shape,
      borderRadius: borderRadius,
      clipBehavior: clip,
      color: disabled ? color?.withOpacity(0.22) ?? Colors.grey : color,
      elevation: elevation,
      child: SizedBox(
        height: height,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onPressed,
          child: _child,
        ),
      ),
    );

    if (shadow != null) {
      _child = DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: shadow,
        ),
        child: _child,
      );
    }

    if (isSpecificWidth) {
      _child = SizedBox(
        width: width,
        child: _child,
      );
    }

    if (margin == EdgeInsets.zero) {
      _child = Padding(
        padding: margin,
        child: _child,
      );
    }

    return Semantics(
      child: MouseRegion(
        cursor: SystemMouseCursors.grab,
        child: IntrinsicWidth(child: _child),
      ),
    );
  }
}
