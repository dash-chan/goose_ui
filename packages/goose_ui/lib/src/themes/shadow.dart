import 'package:flutter/material.dart';

class ElShadow extends BoxShadow {
  const ElShadow({
    super.color,
    super.offset,
    super.blurRadius,
    super.spreadRadius,
    super.blurStyle = BlurStyle.normal,
  });

  static const lighter = ElShadow(
    color: Color.fromARGB(31, 0, 0, 0),
    blurRadius: 6,
  );

  static const light = ElShadow(
    color: Color.fromARGB(31, 0, 0, 0),
    blurRadius: 12,
  );

  static const shadow = [
    ElShadow(
      color: Color.fromARGB(10, 0, 0, 0),
      blurRadius: 12,
    ),
  ];
}
