import 'package:ant_color/ant_color.dart';
import 'package:flutter/material.dart';

import 'package:goose_ui/src/themes/theme.dart';

class AButtonThemeData {
  const AButtonThemeData({
    this.autoInsertSpaceInButton = true,
    this.primaryColor,
    this.neutralColor,
    this.pulseColor,
    this.iconSpacing = 4,
  });

  final bool autoInsertSpaceInButton;
  final AntColor? primaryColor;
  final AntNeutralColor? neutralColor;
  final Color? pulseColor;
  final double iconSpacing;

  AButtonThemeData copyWith({
    bool? autoInsertSpaceInButton,
    AntColor? primaryColor,
    AntNeutralColor? neutralColor,
    Color? pulseColor,
    double? iconSpacing,
  }) {
    return AButtonThemeData(
      autoInsertSpaceInButton:
          autoInsertSpaceInButton ?? this.autoInsertSpaceInButton,
      primaryColor: primaryColor ?? this.primaryColor,
      neutralColor: neutralColor ?? this.neutralColor,
      pulseColor: pulseColor ?? this.pulseColor,
      iconSpacing: iconSpacing ?? this.iconSpacing,
    );
  }

  AButtonThemeData merge(AButtonThemeData? other) {
    if (other == null) return this;
    return copyWith(
      autoInsertSpaceInButton: other.autoInsertSpaceInButton,
      primaryColor: other.primaryColor,
      neutralColor: other.neutralColor,
      pulseColor: other.pulseColor,
      iconSpacing: other.iconSpacing,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AButtonThemeData &&
        other.autoInsertSpaceInButton == autoInsertSpaceInButton &&
        other.primaryColor == primaryColor &&
        other.neutralColor == neutralColor &&
        other.pulseColor == pulseColor &&
        other.iconSpacing == iconSpacing;
  }

  @override
  int get hashCode {
    return autoInsertSpaceInButton.hashCode ^
        primaryColor.hashCode ^
        neutralColor.hashCode ^
        pulseColor.hashCode ^
        iconSpacing.hashCode;
  }
}

class AButtonTheme extends InheritedTheme {
  const AButtonTheme({super.key, required super.child, this.data});

  const AButtonTheme.fromButtonThemeData({
    super.key,
    required this.data,
    required super.child,
  }) : assert(data != null);

  final AButtonThemeData? data;

  static AButtonThemeData of(BuildContext context) {
    final AButtonTheme? buttonTheme =
        context.dependOnInheritedWidgetOfExactType<AButtonTheme>();
    return buttonTheme?.data ?? ATheme.of(context).buttonTheme;
  }

  @override
  bool updateShouldNotify(AButtonTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return AButtonTheme.fromButtonThemeData(data: data, child: child);
  }
}
