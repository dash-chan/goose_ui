library ant_design_icons;

import 'package:ant_design_icons/gen/assets.gen.dart';

class AntDesignIcons {
  AntDesignIcons._();
  static const filled = Assets.filled;
  static const outlined = Assets.outlined;
  static const twoTone = Assets.twotone;
}

test() {
  AntDesignIcons.filled.save.svg();
}
