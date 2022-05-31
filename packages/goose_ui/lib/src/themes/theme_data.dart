import 'package:ant_color/ant_color.dart';
import 'package:flutter/material.dart';

import '../widgets/button/button_theme.dart';

class AThemeData {
  factory AThemeData({
    Color? primaryColor,
    AntColor? primaryAntColor,
    AntNeutralColor? neutralColor,
    AButtonThemeData? buttonTheme,
  }) {
    primaryAntColor ??= AntColors.daybreakBlue;
    neutralColor ??= AntColors.neutral;
    primaryColor ??= primaryAntColor.primary;
    buttonTheme ??= AButtonThemeData(
      primaryColor: primaryColor,
      normalColor: neutralColor,
    );

    return AThemeData.raw(
      primaryColor: primaryColor,
      primaryAntColor: primaryAntColor,
      buttonTheme: buttonTheme,
      neutralColor: neutralColor,
    );
  }

  const AThemeData.raw({
    required this.primaryColor,
    required this.primaryAntColor,
    required this.neutralColor,
    required this.buttonTheme,
  });

  final Color primaryColor;
  final AntColor primaryAntColor;
  final AntNeutralColor neutralColor;
  final AButtonThemeData buttonTheme;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AThemeData &&
        other.primaryColor == primaryColor &&
        other.primaryAntColor == primaryAntColor &&
        other.neutralColor == neutralColor &&
        other.buttonTheme == buttonTheme &&
        other.primaryAntColor.hashCode == primaryAntColor.hashCode;
  }

  @override
  int get hashCode {
    return primaryColor.hashCode ^
        primaryAntColor.hashCode ^
        neutralColor.hashCode ^
        buttonTheme.hashCode ^
        primaryAntColor.hashCode.hashCode;
  }
}
