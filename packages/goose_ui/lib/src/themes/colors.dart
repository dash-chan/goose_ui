import 'package:flutter/material.dart';

class AColor extends ColorSwatch<int> {
  const AColor(super.primary, super.swatch);

  Color get shade100 => this[100]!;
  Color get shade200 => this[200]!;
  Color get shade300 => this[300]!;
  Color get shade400 => this[400]!;
  Color get shade500 => this[500]!;
  Color get shade600 => this[600]!;
  Color get shade700 => this[700]!;
  Color get shade800 => this[800]!;
  Color get shade900 => this[900]!;
  Color get shade1000 => this[1000]!;

  /// ## Dust Red / 薄暮
  /// 斗志、奔放
  static const dustRed = AColor(0xfff5222d, <int, Color>{
    100: Color(0xfffff1f0),
    200: Color(0xffffccc7),
    300: Color(0xffffa39e),
    400: Color(0xffff7875),
    500: Color(0xffff4d4f),
    600: Color(0xfff5222d),
    700: Color(0xffcf1322),
    800: Color(0xffa8071a),
    900: Color(0xff820014),
    1000: Color(0xff5c0011),
  });

  /// ## Volcano / 火山
  /// 醒目、澎湃
  static const volcano = AColor(0xfffa541c, <int, Color>{
    100: Color(0xfffff2e8),
    200: Color(0xffffd8bf),
    300: Color(0xffffbb96),
    400: Color(0xffff9c6e),
    500: Color(0xffff7a45),
    600: Color(0xfffa541c),
    700: Color(0xffd4380d),
    800: Color(0xffad2102),
    900: Color(0xff871400),
    1000: Color(0xff610b00),
  });

  /// ## Sunset Orange / 日暮
  /// 温暖、欢快
  static const sunsetOrange = AColor(0xfffa8c16, <int, Color>{
    100: Color(0xfffff7e6),
    200: Color(0xffffe7ba),
    300: Color(0xffffd591),
    400: Color(0xffffc069),
    500: Color(0xffffa940),
    600: Color(0xfffa8c16),
    700: Color(0xffd46b08),
    800: Color(0xffad4e00),
    900: Color(0xff873800),
    1000: Color(0xff612500),
  });

  /// ## Calendula Gold / 金盏花
  /// 活力、积极
  static const calendulaGold = AColor(0xfffaad14, <int, Color>{
    100: Color(0xfffffbe6),
    200: Color(0xfffff1b8),
    300: Color(0xffffe58f),
    400: Color(0xffffd666),
    500: Color(0xffffc53d),
    600: Color(0xfffaad14),
    700: Color(0xffd48806),
    800: Color(0xffad6800),
    900: Color(0xff874d00),
    1000: Color(0xff613400),
  });

  /// ## Sunrise Yellow / 日出
  /// 出生、阳光
  static const sunriseYellow = AColor(0xfffadb14, <int, Color>{
    100: Color(0xfffeffe6),
    200: Color(0xffffffb8),
    300: Color(0xfffffb8f),
    400: Color(0xfffff566),
    500: Color(0xffffec3d),
    600: Color(0xfffadb14),
    700: Color(0xffd4b106),
    800: Color(0xffad8b00),
    900: Color(0xff876800),
    1000: Color(0xff614700),
  });

  /// ## Lime / 青柠
  /// 自然、生机
  static const lime = AColor(0xffa0d911, <int, Color>{
    100: Color(0xfffcffe6),
    200: Color(0xfff4ffb8),
    300: Color(0xffeaff8f),
    400: Color(0xffd3f261),
    500: Color(0xffbae637),
    600: Color(0xffa0d911),
    700: Color(0xff7cb305),
    800: Color(0xff5b8c00),
    900: Color(0xff3f6600),
    1000: Color(0xff254000),
  });

  /// ## Polar Green / 极光绿
  /// 健康、创新
  static const polarGreen = AColor(0xff52c41a, <int, Color>{
    100: Color(0xfff6ffed),
    200: Color(0xffd9f7be),
    300: Color(0xffb7eb8f),
    400: Color(0xff95de64),
    500: Color(0xff73d13d),
    600: Color(0xff52c41a),
    700: Color(0xff389e0d),
    800: Color(0xff237804),
    900: Color(0xff135200),
    1000: Color(0xff092b00),
  });

  /// ## Cyan / 明青
  /// 希望、坚强
  static const cyan = AColor(0xff13c2c2, <int, Color>{
    100: Color(0xffe6fffb),
    200: Color(0xffb5f5ec),
    300: Color(0xff87e8de),
    400: Color(0xff5cdbd3),
    500: Color(0xff36cfc9),
    600: Color(0xff13c2c2),
    700: Color(0xff08979c),
    800: Color(0xff006d75),
    900: Color(0xff00474f),
    1000: Color(0xff002329),
  });

  /// ## Daybreak Blue / 拂晓蓝
  /// 包容、科技、普惠
  static const daybreakBlue = AColor(0xff1890ff, <int, Color>{
    100: Color(0xffe6f7ff),
    200: Color(0xffbae7ff),
    300: Color(0xff91d5ff),
    400: Color(0xff69c0ff),
    500: Color(0xff40a9ff),
    600: Color(0xff1890ff),
    700: Color(0xff096dd9),
    800: Color(0xff0050b3),
    900: Color(0xff003a8c),
    1000: Color(0xff002766),
  });

  /// ## Geek Blue / 极客蓝
  /// 探索、钻研
  static const geekBlue = AColor(0xff2f54eb, <int, Color>{
    100: Color(0xfff0f5ff),
    200: Color(0xffd6e4ff),
    300: Color(0xffadc6ff),
    400: Color(0xff85a5ff),
    500: Color(0xff597ef7),
    600: Color(0xff2f54eb),
    700: Color(0xff1d39c4),
    800: Color(0xff10239e),
    900: Color(0xff061178),
    1000: Color(0xff030852),
  });

  /// ## Golden Purple / 酱紫
  /// 优雅、浪漫
  static const goldenPurple = AColor(0xff722ed1, <int, Color>{
    100: Color(0xfff9f0ff),
    200: Color(0xffefdbff),
    300: Color(0xffd3adf7),
    400: Color(0xffb37feb),
    500: Color(0xff9254de),
    600: Color(0xff722ed1),
    700: Color(0xff531dab),
    800: Color(0xff391085),
    900: Color(0xff22075e),
    1000: Color(0xff120338),
  });

  /// ## Magenta / 法式洋红
  /// 明快、感性
  static const magenta = AColor(0xffeb2f96, <int, Color>{
    100: Color(0xfffff0f6),
    200: Color(0xffffd6e7),
    300: Color(0xffffadd2),
    400: Color(0xffff85c0),
    500: Color(0xfff759ab),
    600: Color(0xffeb2f96),
    700: Color(0xffc41d7f),
    800: Color(0xff9e1068),
    900: Color(0xff780650),
    1000: Color(0xff520339),
  });
}
