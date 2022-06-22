//TODO

import 'package:ant_color/ant_color.dart';
import 'package:flutter/material.dart';

import 'package:goose_ui/src/extensions/color_extension.dart';
import 'package:goose_ui/src/widgets/badge/ribbon_badge.dart';

import '../../themes/theme.dart';

class ABadgeThemeData {}

class ARibbonBadgeThemeData {
  ARibbonBadgeThemeData({
    this.color,
    this.darkColor,
    this.placement,
    this.padding,
  });

  final Color? color;
  final Color? darkColor;
  final ARibbonPlacement? placement;
  final EdgeInsets? padding;

  Color get computedColor => color ?? AntColors.dustRed;
  Color get computedDarkColor {
    if (darkColor == null) {
      return computedColor.darken(0.8);
    } else {
      return darkColor!;
    }
  }

  ARibbonPlacement computedPlacement(BuildContext context) {
    if (placement == null) {
      return Directionality.of(context) == TextDirection.ltr
          ? ARibbonPlacement.end
          : ARibbonPlacement.start;
    } else {
      return placement!;
    }
  }

  EdgeInsets get computedPadding =>
      padding ?? const EdgeInsets.symmetric(horizontal: 8);

  ARibbonBadgeThemeData copyWith({
    Color? color,
    Color? darkColor,
    ARibbonPlacement? placement,
    EdgeInsets? padding,
  }) {
    return ARibbonBadgeThemeData(
      color: color ?? this.color,
      darkColor: darkColor ?? this.darkColor,
      placement: placement ?? this.placement,
      padding: padding ?? this.padding,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ARibbonBadgeThemeData &&
        other.color == color &&
        other.darkColor == darkColor &&
        other.placement == placement &&
        other.padding == padding;
  }

  @override
  int get hashCode {
    return color.hashCode ^
        darkColor.hashCode ^
        placement.hashCode ^
        padding.hashCode;
  }
}

class ABadgeTheme {}

class ARibbonBadgeTheme extends InheritedTheme {
  const ARibbonBadgeTheme({
    super.key,
    required super.child,
    required this.data,
  });

  const ARibbonBadgeTheme.fromRibbonBadgeThemeData({
    super.key,
    required this.data,
    required super.child,
  }) : assert(data != null);

  final ARibbonBadgeThemeData? data;

  static ARibbonBadgeThemeData of(BuildContext context) {
    final ARibbonBadgeTheme? buttonTheme =
        context.dependOnInheritedWidgetOfExactType<ARibbonBadgeTheme>();
    return buttonTheme?.data ?? ATheme.of(context).ribbonBadgeTheme;
  }

  @override
  bool updateShouldNotify(ARibbonBadgeTheme oldWidget) =>
      oldWidget.data != data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ARibbonBadgeTheme.fromRibbonBadgeThemeData(
      data: data,
      child: child,
    );
  }
}
