import 'package:flutter/material.dart';

import '../enums/alignment.dart';

const _arrowWidth = 6;
const _arrowHeight = 3;

Path arrowBoxPath(
    {required Rect rect, required AAlignment alignment, double spacing = 6}) {
  final path = Path();

  final left = rect.left;
  final top = rect.top;
  final bottom = rect.bottom;
  final right = rect.right;

  List<Offset> offsets = [];

  switch (alignment) {
    case AAlignment.topLeft:
      offsets = [
        Offset(left, top),
        Offset(right, top),
        Offset(right, bottom),
        Offset(_arrowWidth + spacing, bottom),
        Offset(_arrowWidth / 2 + spacing, bottom + _arrowHeight),
        Offset(spacing, bottom),
        Offset(left, bottom),
      ];
      break;
    case AAlignment.topCenter:
      offsets = [
        Offset(left, top),
        Offset(right, top),
        Offset(right, bottom),
        Offset((right + _arrowWidth) / 2, bottom),
        Offset(right / 2, bottom + _arrowHeight),
        Offset((right - _arrowWidth) / 2, bottom),
        Offset(left, bottom),
      ];
      break;
    case AAlignment.topRight:
      offsets = [
        Offset(left, top),
        Offset(right, top),
        Offset(right, bottom),
        Offset(right - spacing, bottom),
        Offset(_arrowWidth / 2 + spacing, bottom + _arrowHeight),
        Offset(right - spacing - _arrowWidth, bottom),
        Offset(left, bottom),
      ];
      break;
    case AAlignment.leftTop:
      offsets = [
        Offset(left, top),
        Offset(right, top),
        Offset(right, top + spacing),
        Offset(right + _arrowHeight, top + spacing + _arrowWidth / 2),
        Offset(right, top + spacing + _arrowWidth),
        Offset(right, bottom),
        Offset(left, bottom),
      ];
      break;
    case AAlignment.leftCenter:
      offsets = [
        Offset(left, top),
        Offset(right, top),
        Offset(right, bottom / 2 - _arrowWidth / 2),
        Offset(right + _arrowHeight, bottom / 2),
        Offset(right, bottom / 2 + _arrowWidth / 2),
        Offset(right, bottom),
        Offset(left, bottom),
      ];
      break;
    case AAlignment.leftBottom:
      offsets = [
        Offset(left, top),
        Offset(right, top),
        Offset(right, bottom - spacing - _arrowWidth),
        Offset(right + _arrowHeight, bottom - spacing - _arrowWidth / 2),
        Offset(right, bottom - spacing),
        Offset(right, bottom),
        Offset(left, bottom),
      ];
      break;
    case AAlignment.rightTop:
      offsets = [
        Offset(left, top),
        Offset(right, top),
        Offset(right, bottom),
        Offset(left, bottom),
        Offset(left, top + spacing),
        Offset(left - _arrowHeight, top + spacing + _arrowWidth / 2),
        Offset(left, top + spacing + _arrowWidth),
      ];
      break;
    case AAlignment.rightCenter:
      offsets = [
        Offset(left, top),
        Offset(right, top),
        Offset(right, bottom),
        Offset(left, bottom),
        Offset(left, bottom / 2 - _arrowWidth / 2),
        Offset(left - _arrowHeight, bottom / 2),
        Offset(left, bottom / 2 + _arrowWidth / 2),
      ];
      break;
    case AAlignment.rightBottom:
      offsets = [
        Offset(left, top),
        Offset(right, top),
        Offset(right, bottom),
        Offset(left, bottom),
        Offset(left, bottom - spacing - _arrowWidth),
        Offset(left - _arrowHeight, bottom - spacing - _arrowWidth / 2),
        Offset(left, bottom - spacing),
      ];
      break;
    case AAlignment.bottomLeft:
      offsets = [
        Offset(left, top),
        Offset(_arrowWidth + spacing, top),
        Offset(_arrowWidth / 2 + spacing, top - _arrowHeight),
        Offset(spacing, top),
        Offset(right, top),
        Offset(right, bottom),
        Offset(left, bottom),
      ];
      break;
    case AAlignment.bottomCenter:
      offsets = [
        Offset(left, top),
        Offset((right + _arrowWidth) / 2, top),
        Offset(right / 2, top - _arrowHeight),
        Offset((right - _arrowWidth) / 2, top),
        Offset(right, top),
        Offset(right, bottom),
        Offset(left, bottom),
      ];
      break;
    case AAlignment.bottomRight:
      offsets = [
        Offset(left, top),
        Offset(right - spacing, top),
        Offset(_arrowWidth / 2 + spacing, top - _arrowHeight),
        Offset(right - spacing - _arrowWidth, top),
        Offset(right, top),
        Offset(right, bottom),
        Offset(left, bottom),
      ];
      break;
  }

  if (offsets.isNotEmpty) {
    path.moveTo(offsets.first.dx, offsets.first.dy);
    for (var element in offsets) {
      path.lineTo(element.dx, element.dy);
    }
    path.close();
  }

  return path;
}
