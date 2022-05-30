import 'package:flutter/material.dart';
import 'package:goose_ui/src/themes/theme_data.dart';

export 'theme_data.dart';

class ATheme extends InheritedWidget {
  const ATheme({
    super.key,
    required super.child,
    this.data,
  });

  final AThemeData? data;

  static AThemeData of(BuildContext context) {
    final ATheme? theme = context.dependOnInheritedWidgetOfExactType<ATheme>();
    return theme?.data ?? AThemeData();
  }

  @override
  bool updateShouldNotify(ATheme oldWidget) {
    return oldWidget.data != data;
  }
}
