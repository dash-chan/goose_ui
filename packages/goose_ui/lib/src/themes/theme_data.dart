import 'package:ant_color/ant_color.dart';
import 'package:flutter/material.dart';

import '../widgets/button/button_theme.dart';

class AThemeData {
  factory AThemeData({
    Color? primaryColor,
    AntColor? primaryAntColor,
    AButtonThemeData? buttonTheme,
  }) {
    primaryAntColor ??= AntColors.daybreakBlue;
    primaryColor ??= primaryAntColor.primary;
    buttonTheme ??= AButtonThemeData(
      primaryColor: primaryColor,
    );

    return AThemeData.raw(
      primaryColor: primaryColor,
      primaryAntColor: primaryAntColor,
      buttonTheme: buttonTheme,
    );
  }

  const AThemeData.raw({
    required this.primaryColor,
    required this.primaryAntColor,
    required this.buttonTheme,
  });

  final AButtonThemeData buttonTheme;
  final Color primaryColor;
  final AntColor primaryAntColor;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AThemeData &&
        other.buttonTheme == buttonTheme &&
        other.primaryColor == primaryColor &&
        other.primaryAntColor == primaryAntColor;
  }

  @override
  int get hashCode =>
      buttonTheme.hashCode ^ primaryColor.hashCode ^ primaryAntColor.hashCode;
}
