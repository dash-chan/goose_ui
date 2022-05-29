library ant_icons;

import 'package:ant_icons/gen/assets.gen.dart';

class AntIcons {
  AntIcons._();
  static const filled = Assets.filled;
  static const outlined = Assets.outlined;
  static const twoTone = Assets.twotone;
}

test() {
  AntIcons.filled.save.svg();
}
