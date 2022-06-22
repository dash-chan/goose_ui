import 'package:flutter/material.dart';

extension ColorExt on Color {
  Color darken([double value = 0.8]) {
    assert(value >= 0 && value <= 1, 'value must be between 0 and 1');
    return Color.fromARGB(
      alpha,
      (red * value).round(),
      (green * value).round(),
      (blue * value).round(),
    );
  }

  Color lighten([double value = 0.8]) {
    assert(value >= 0 && value <= 1, 'value must be between 0 and 1');
    return Color.fromARGB(
      alpha,
      (red + (255 - red) * value).round(),
      (green + (255 - green) * value).round(),
      (blue + (255 - blue) * value).round(),
    );
  }
}
