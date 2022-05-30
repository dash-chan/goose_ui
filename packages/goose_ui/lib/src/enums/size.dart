enum ASize {
  small,

  medium,

  large,
}

extension ASizeX on ASize {
  /// small: 24
  /// medium: 32
  /// large: 40
  double get button {
    switch (this) {
      case ASize.small:
        return 24;
      case ASize.medium:
        return 32;
      case ASize.large:
        return 40;
    }
  }

  double get buttonHorizontalPadding {
    switch (this) {
      case ASize.small:
        return 8;
      case ASize.medium:
      case ASize.large:
        return 16;
    }
  }

  double get buttonSize {
    switch (this) {
      case ASize.small:
      case ASize.medium:
        return 14;
      case ASize.large:
        return 16;
    }
  }
}
