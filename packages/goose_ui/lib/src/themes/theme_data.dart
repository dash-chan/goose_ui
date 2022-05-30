import '../widgets/button/button_theme.dart';

class AThemeData {
  factory AThemeData({
    AButtonThemeData? buttonTheme,
  }) {
    buttonTheme ??= const AButtonThemeData();
    return AThemeData.raw(buttonTheme: buttonTheme);
  }

  const AThemeData.raw({
    required this.buttonTheme,
  });

  final AButtonThemeData buttonTheme;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AThemeData && other.buttonTheme == buttonTheme;
  }

  @override
  int get hashCode => buttonTheme.hashCode;
}
