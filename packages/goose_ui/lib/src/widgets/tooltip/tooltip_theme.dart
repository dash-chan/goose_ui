import 'package:flutter/material.dart';

import '../../themes/theme.dart';

class ATooltipThemeData {
  ATooltipThemeData({
    this.color,
  });
  final Color? color;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ATooltipThemeData && other.color == color;
  }

  @override
  int get hashCode => color.hashCode;
}

class ATooltipTheme extends InheritedTheme {
  const ATooltipTheme({super.key, required super.child, this.data});

  const ATooltipTheme.fromATooltipThemeData({
    super.key,
    required this.data,
    required super.child,
  }) : assert(data != null);

  final ATooltipThemeData? data;

  static ATooltipThemeData of(BuildContext context) {
    final ATooltipTheme? tooltipTheme =
        context.dependOnInheritedWidgetOfExactType<ATooltipTheme>();
    return tooltipTheme?.data ?? ATheme.of(context).tooltipTheme;
  }

  @override
  bool updateShouldNotify(ATooltipTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ATooltipTheme.fromATooltipThemeData(data: data, child: child);
  }
}
