import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

/// Ant Design Color
///
/// ref: [Ant Design Color](https://ant.design/docs/spec/colors-cn)
/// 
/// color list:
/// 
/// * Dust Red / 薄暮
/// * Volcano / 火山
/// * Sunset Orange / 日暮
/// * Calendula Gold / 金盏花
/// * Sunrise Yellow / 日出
/// * Lime / 青柠
/// * Polar Green / 极光绿
/// * Cyan / 明青
/// * Daybreak Blue / 拂晓蓝
/// * Geek Blue / 极客蓝
/// * Golden Purple / 酱紫
/// * Magenta / 法式洋红
/// 
class AntColors {
  const AntColors._();

  /// ## Dust Red / 薄暮
  /// 斗志、奔放
  static const dustRed = AntColor(0xfff5222d, <int, Color>{
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
  static const volcano = AntColor(0xfffa541c, <int, Color>{
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
  static const sunsetOrange = AntColor(0xfffa8c16, <int, Color>{
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
  static const calendulaGold = AntColor(0xfffaad14, <int, Color>{
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
  static const sunriseYellow = AntColor(0xfffadb14, <int, Color>{
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
  static const lime = AntColor(0xffa0d911, <int, Color>{
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
  static const polarGreen = AntColor(0xff52c41a, <int, Color>{
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
  static const cyan = AntColor(0xff13c2c2, <int, Color>{
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
  static const daybreakBlue = AntColor(0xff1890ff, <int, Color>{
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
  static const geekBlue = AntColor(0xff2f54eb, <int, Color>{
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
  static const goldenPurple = AntColor(0xff722ed1, <int, Color>{
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
  static const magenta = AntColor(0xffeb2f96, <int, Color>{
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

  /// ## 中性色板 neutral color palette
  /// 中性色包含了黑、白、灰。在蚂蚁中后台的网页设计中被大量使用到，
  /// 合理地选择中性色能够令页面信息具备良好的主次关系，助力阅读体验。
  /// Ant Design 的中性色板一共包含了从白到黑的 13 个颜色。
  static const neutral = AntNeutralColor(0xffbfbfbf, <int, Color>{
    100: Color(0xffffffff),
    200: Color(0xfffafafa),
    300: Color(0xfff5f5f5),
    400: Color(0xfff0f0f0),
    500: Color(0xffd9d9d9),
    600: Color(0xffbfbfbf),
    700: Color(0xff8c8c8c),
    800: Color(0xff595959),
    900: Color(0xff434343),
    1000: Color(0xff262626),
    1100: Color(0xff1f1f1f),
    1200: Color(0xff141414),
    1300: Color(0xff000000),
  });

  /// all ant colors
  static const List<AntColor> items = [
    dustRed,
    volcano,
    sunsetOrange,
    calendulaGold,
    sunriseYellow,
    lime,
    polarGreen,
    cyan,
    daybreakBlue,
    geekBlue,
    goldenPurple,
    magenta,
  ];
}

/// Defines a single color as well a color swatch with ten shades of the color.
class AntColor extends ColorSwatch<int> {
  /// Creates a color swatch and a set of 10 shades of the color.
  const AntColor(super.primary, super.swatch);

  /// Color-1
  Color get shade100 => this[100]!;

  /// Color-2
  Color get shade200 => this[200]!;

  /// Color-3
  Color get shade300 => this[300]!;

  /// Color-4
  Color get shade400 => this[400]!;

  /// Color-5
  Color get shade500 => this[500]!;

  /// Color-6, normally this is the primary color
  Color get shade600 => this[600]!;

  /// Color-7
  Color get shade700 => this[700]!;

  /// Color-8
  Color get shade800 => this[800]!;

  /// Color-9
  Color get shade900 => this[900]!;

  /// Color-10
  Color get shade1000 => this[1000]!;

  Color get primary => shade600;

  /// generate AntColor from primary Color.
  static AntColor generate(Color primaryColor) {
    final hsv = HSVColor.fromColor(primaryColor);
    Map<int, Color> swatch = {};
    for (var i = 1; i <= 10; i++) {
      final isLight = i <= 6;
      final distance = (6 - i).abs();
      final hue = _computeHue(hsv.hue, isLight, distance);
      final saturation = _computeSaturation(hsv, isLight, distance);
      final value = _computeValue(hsv.value, isLight, distance);
      swatch.putIfAbsent(
        i * 100,
        () => HSVColor.fromAHSV(1, hue, saturation, value).toColor(),
      );
    }
    return AntColor(primaryColor.value, swatch);
  }

  /// get computed hue
  static double _computeHue(double hue, bool light, int distance) {
    const hueStep = 2;

    hue = hue.roundToDouble();

    late double result;
    if (hue >= 60 && hue <= 240) {
      result = light ? hue - hueStep * distance : hue + hueStep * distance;
    } else {
      result = light ? hue + hueStep * distance : hue - hueStep * distance;
    }

    if (result < 0) {
      result += 360;
    } else if (result >= 360) {
      result -= 360;
    }

    return result;
  }

  /// get computed saturation
  static double _computeSaturation(HSVColor color, bool isLight, int distance) {
    final saturation = color.saturation;
    if (color.saturation == 0 && color.hue == 0) return saturation;
    const saturationStep = 0.16;
    const saturationStep2 = 0.05;
    late double result;
    if (isLight) {
      result = saturation - saturationStep * distance;
    } else if (distance == 4) {
      result = saturation + saturationStep;
    } else {
      result = saturation + saturationStep2 * distance;
    }
    if (result > 1) {
      result = 1;
    }
    if (isLight && distance == 5 && saturation > 0.1) {
      result = 0.1;
    }
    if (result < 0.06) {
      result = 0.06;
    }

    return double.parse(result.toStringAsFixed(2));
  }

  /// get computed hsv value
  static double _computeValue(double value, bool isLight, int distance) {
    const brightnessStep1 = 0.05;
    const brightnessStep2 = 0.15;
    late double result;
    if (isLight) {
      result = value + brightnessStep1 * distance;
    } else {
      result = value - brightnessStep2 * distance;
    }
    if (result > 1) {
      result = 1;
    }
    return double.parse(result.toStringAsFixed(2));
  }
}

/// Defines a single color as well a color swatch with ten shades of the color.
/// same as AntColor but has 3 more shades of the color.

class AntNeutralColor extends AntColor {
  /// Creates a color swatch and a set of 13 shades of the color.
  const AntNeutralColor(super.primary, super.swatch);

  /// Color-11
  Color get shade1100 => this[1100]!;

  /// Color-12
  Color get shade1200 => this[1200]!;

  /// Color-13
  Color get shade1300 => this[1300]!;
}
