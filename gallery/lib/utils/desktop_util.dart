import 'dart:io';

import 'package:flutter/foundation.dart';

class DesktopUtil {
  static bool get isDesktop =>
      kIsWeb || Platform.isLinux || Platform.isWindows || Platform.isMacOS;

  static bool get isDesktopExceptWeb {
    if (kIsWeb) return false;
    return isDesktop;
  }
}
