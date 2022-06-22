import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';
import 'package:goose_ui/src/widgets/badge/badge_theme.dart';
import 'package:goose_ui/src/widgets/badge/ribbon_widget.dart';

enum ARibbonPlacement {
  start,
  end,
}

class ARibbonBadge extends StatelessWidget {
  const ARibbonBadge({
    super.key,
    this.placement = ARibbonPlacement.end,
    this.color,
    this.darkColor,
    this.padding,
    required this.text,
    required this.child,
  });

  /// 缎带的位置，start 和 end 随文字方向（RTL 或 LTR）变动
  final ARibbonPlacement placement;

  /// 缎带的颜色
  final Color? color;

  /// 缎带暗部的颜色
  final Color? darkColor;

  /// 缎带中填入的内容
  final Widget text;

  /// 缎带边距
  final EdgeInsets? padding;

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final computedPadding =
        padding ?? ARibbonBadgeTheme.of(context).computedPadding;

    double? left = placement == ARibbonPlacement.start ? 0 : null;
    double? right = placement == ARibbonPlacement.end ? 0 : null;
    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          left: left,
          right: right,
          child: RibbonWidget(
            color: color ??
                ARibbonBadgeTheme.of(context).color ??
                AntColors.dustRed,
            darkColor:
                darkColor ?? ARibbonBadgeTheme.of(context).computedDarkColor,
            placement: placement,
            padding: computedPadding,
            child: Padding(
              padding: computedPadding,
              child: text,
            ),
          ),
        ),
      ],
    );
  }
}
