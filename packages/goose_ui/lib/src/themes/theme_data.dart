import 'package:ant_color/ant_color.dart';
import 'package:flutter/material.dart';

import 'package:goose_ui/src/widgets/badge/badge_theme.dart';
import 'package:goose_ui/src/widgets/switch/switch_theme.dart';

import '../widgets/button/button_theme.dart';
import '../widgets/tooltip/tooltip_theme.dart';

class AThemeData {
  factory AThemeData({
    Color? primaryColor,
    AntColor? primaryAntColor,
    AntNeutralColor? neutralColor,
    Color? pulseColor,
    AntColor? errorColor,
    AButtonThemeData? buttonTheme,
    ATooltipThemeData? tooltipTheme,
    ARibbonBadgeThemeData? ribbonBadgeTheme,
    ASwitchThemeData? switchTheme,
  }) {
    primaryAntColor ??= AntColors.daybreakBlue;
    neutralColor ??= AntColors.neutral;
    primaryColor ??= primaryAntColor.primary;
    pulseColor ??= primaryAntColor.primary;

    buttonTheme ??= const AButtonThemeData();

    buttonTheme = AButtonThemeData(
      primaryColor: primaryAntColor,
      neutralColor: neutralColor,
      pulseColor: pulseColor,
    ).merge(buttonTheme);

    errorColor ??= AntColors.dustRed;

    tooltipTheme ??= ATooltipThemeData(
      color: neutralColor.shade1200,
      shadowColor: neutralColor.shade1200.withOpacity(0.2),
      labelColor: neutralColor.shade100,
      style: const TextStyle(fontSize: 14),
    );

    ribbonBadgeTheme ??= ARibbonBadgeThemeData(
      color: primaryAntColor,
      darkColor: primaryAntColor.shade800,
    );

    switchTheme ??= ASwitchThemeData();
    switchTheme = ASwitchThemeData(
      thumbColor: neutralColor.shade100,
      trackColor: neutralColor.shade600,
      activeTrackColor: primaryAntColor,
    ).merge(switchTheme);

    return AThemeData.raw(
      primaryColor: primaryColor,
      primaryAntColor: primaryAntColor,
      buttonTheme: buttonTheme,
      neutralColor: neutralColor,
      pulseColor: pulseColor,
      errorColor: errorColor,
      tooltipTheme: tooltipTheme,
      ribbonBadgeTheme: ribbonBadgeTheme,
      switchTheme: switchTheme,
    );
  }

  const AThemeData.raw({
    required this.primaryColor,
    required this.primaryAntColor,
    required this.neutralColor,
    required this.pulseColor,
    required this.errorColor,
    required this.buttonTheme,
    required this.tooltipTheme,
    required this.ribbonBadgeTheme,
    required this.switchTheme,
  });

  final Color primaryColor;
  final AntColor primaryAntColor;
  final AntNeutralColor neutralColor;
  final Color pulseColor;
  final AntColor errorColor;
  final AButtonThemeData buttonTheme;
  final ATooltipThemeData tooltipTheme;
  final ARibbonBadgeThemeData ribbonBadgeTheme;
  final ASwitchThemeData switchTheme;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AThemeData &&
        other.primaryColor == primaryColor &&
        other.primaryAntColor == primaryAntColor &&
        other.neutralColor == neutralColor &&
        other.pulseColor == pulseColor &&
        other.errorColor == errorColor &&
        other.buttonTheme == buttonTheme &&
        other.tooltipTheme == tooltipTheme &&
        other.ribbonBadgeTheme == ribbonBadgeTheme &&
        other.switchTheme == switchTheme;
  }

  @override
  int get hashCode {
    return primaryColor.hashCode ^
        primaryAntColor.hashCode ^
        neutralColor.hashCode ^
        pulseColor.hashCode ^
        errorColor.hashCode ^
        buttonTheme.hashCode ^
        tooltipTheme.hashCode ^
        ribbonBadgeTheme.hashCode ^
        switchTheme.hashCode;
  }
}
