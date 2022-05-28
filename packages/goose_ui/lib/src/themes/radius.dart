import 'package:flutter/material.dart';

class ElRadius extends Radius {
  const ElRadius(double radius) : super.circular(radius);

  static const empty = ElRadius(0);
  static const small = ElRadius(2);
  static const large = ElRadius(4);

  /// prefer use StadiumBorder
  static const round = ElRadius(20);
}
