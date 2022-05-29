library ant_design_icons;

import 'package:antd_icons/gen/assets.gen.dart';

class AntdIcons {
  AntdIcons._();
  static const filled = Assets.filled;
  static const outlined = Assets.outlined;
  static const twoTone = Assets.twotone;
}

test() {
  AntdIcons.filled.save.svg();
}
