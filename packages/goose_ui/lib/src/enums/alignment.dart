enum AAlignment {
  topLeft,
  topCenter,
  topRight,
  leftTop,
  leftCenter,
  leftBottom,
  rightTop,
  rightCenter,
  rightBottom,
  bottomLeft,
  bottomCenter,
  bottomRight,
}

extension AAlignmentX on AAlignment {
  bool get isTop =>
      this == AAlignment.topLeft ||
      this == AAlignment.topCenter ||
      this == AAlignment.topRight;

  bool get isLeft =>
      this == AAlignment.leftTop ||
      this == AAlignment.leftCenter ||
      this == AAlignment.leftBottom;

  bool get isRight =>
      this == AAlignment.rightTop ||
      this == AAlignment.rightCenter ||
      this == AAlignment.rightBottom;

  bool get isBottom =>
      this == AAlignment.bottomLeft ||
      this == AAlignment.bottomCenter ||
      this == AAlignment.bottomRight;
}
