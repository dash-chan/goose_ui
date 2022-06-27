import 'package:ant_color/ant_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:goose_ui/src/themes/theme.dart';

class ASwitchThemeData {
  ASwitchThemeData({
    this.trackColor,
    this.thumbColor,
    this.activeTrackColor,
  });

  final Color? trackColor;
  final Color? thumbColor;
  final Color? activeTrackColor;

  Color get computedTrackColor => trackColor ?? AntColors.neutral.shade600;
  Color get computedThumbColor => thumbColor ?? AntColors.neutral.shade100;
  Color get computedActiveTrackColor =>
      activeTrackColor ?? AntColors.daybreakBlue;

  ASwitchThemeData copyWith({
    Color? trackColor,
    Color? thumbColor,
    Color? activeTrackColor,
  }) {
    return ASwitchThemeData(
      trackColor: trackColor ?? this.trackColor,
      thumbColor: thumbColor ?? this.thumbColor,
      activeTrackColor: activeTrackColor ?? this.activeTrackColor,
    );
  }

  ASwitchThemeData merge(ASwitchThemeData? data) {
    if (data == null) return this;
    return copyWith(
      trackColor: data.trackColor,
      thumbColor: data.thumbColor,
      activeTrackColor: data.activeTrackColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ASwitchThemeData &&
        other.trackColor == trackColor &&
        other.thumbColor == thumbColor &&
        other.activeTrackColor == activeTrackColor;
  }

  @override
  int get hashCode =>
      trackColor.hashCode ^ thumbColor.hashCode ^ activeTrackColor.hashCode;
}

class ASwitchTheme extends InheritedTheme {
  const ASwitchTheme({super.key, required super.child, this.data});

  final ASwitchThemeData? data;

  const ASwitchTheme.fromThemeData({
    super.key,
    required super.child,
    required this.data,
  }) : assert(data != null);

  @override
  bool updateShouldNotify(ASwitchTheme oldWidget) => oldWidget.data != data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ASwitchTheme.fromThemeData(data: data, child: child);
  }

  static ASwitchThemeData of(BuildContext context) {
    final ASwitchTheme? buttonTheme =
        context.dependOnInheritedWidgetOfExactType<ASwitchTheme>();
    return buttonTheme?.data ?? ATheme.of(context).switchTheme;
  }
}
