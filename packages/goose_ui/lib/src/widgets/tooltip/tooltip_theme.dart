import 'package:flutter/material.dart';

import '../../themes/theme.dart';

class ATooltipThemeData {
  ATooltipThemeData({
    this.color,
    this.shadowColor,
    this.labelColor,
    this.style,
  });
  final Color? color;

  /// normally use Colors.black.withOpacity(0.2)
  final Color? shadowColor;
  final Color? labelColor;
  final TextStyle? style;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ATooltipThemeData &&
        other.color == color &&
        other.shadowColor == shadowColor &&
        other.labelColor == labelColor &&
        other.style == style;
  }

  @override
  int get hashCode {
    return color.hashCode ^
        shadowColor.hashCode ^
        labelColor.hashCode ^
        style.hashCode;
  }

  ATooltipThemeData copyWith({
    Color? color,
    Color? shadowColor,
    Color? labelColor,
    TextStyle? style,
  }) {
    return ATooltipThemeData(
      color: color ?? this.color,
      shadowColor: shadowColor ?? this.shadowColor,
      labelColor: labelColor ?? this.labelColor,
      style: style ?? this.style,
    );
  }

  ATooltipThemeData merge(ATooltipThemeData? data) {
    if (data == null) return this;
    return copyWith(
      color: data.color,
      shadowColor: data.shadowColor,
      labelColor: data.labelColor,
      style: data.style,
    );
  }
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
