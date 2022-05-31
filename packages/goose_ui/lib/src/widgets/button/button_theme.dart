import 'package:flutter/material.dart';

import 'package:goose_ui/src/themes/theme.dart';

class AButtonThemeData {
  const AButtonThemeData({
    this.autoInsertSpaceInButton = true,
    this.primaryColor,
  });

  final bool autoInsertSpaceInButton;
  final Color? primaryColor;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AButtonThemeData &&
        other.autoInsertSpaceInButton == autoInsertSpaceInButton &&
        other.primaryColor == primaryColor;
  }

  @override
  int get hashCode => autoInsertSpaceInButton.hashCode ^ primaryColor.hashCode;
}

class AButtonTheme extends InheritedTheme {
  const AButtonTheme({super.key, required super.child, this.data});

  const AButtonTheme.fromButtonThemeData({
    Key? key,
    required this.data,
    required Widget child,
  })  : assert(data != null),
        super(key: key, child: child);

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
