import 'package:flutter/material.dart';

extension AutoSizeTextEXT on Text {
  Widget get auto => LayoutBuilder(builder: (context, size) {
        final defaultTextStyle = DefaultTextStyle.of(context);
        var newStyle = style;
        newStyle = defaultTextStyle.style.merge(style);

        const newMaxLines = 1;

        final fontSize =
            _calculateFontSize(size, newStyle, newMaxLines, context);

        Widget text;
        text = Text(
          data!,
          key: key,
          style: style!.copyWith(fontSize: fontSize),
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: 1,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
        );

        return text;
      });

  double _calculateFontSize(
      BoxConstraints size, TextStyle style, int maxLines, BuildContext context,
      {double stepGranularity = 1}) {
    final span = TextSpan(
      style: style,
      text: data,
    );

    final userScale = MediaQuery.textScaleFactorOf(context);

    int left;
    int right;
    final defaultScale = style.fontSize! * userScale / style.fontSize!;
    if (_checkTextFits(span, defaultScale, maxLines, size)) {
      return style.fontSize! * userScale;
    }

    left = 0;
    right = (style.fontSize! / stepGranularity).ceil();

    var lastValueFits = false;
    while (left <= right) {
      final mid = (left + (right - left) / 2).floor();
      double scale;
      scale = mid * userScale * stepGranularity / style.fontSize!;

      if (_checkTextFits(span, scale, maxLines, size)) {
        left = mid + 1;
        lastValueFits = true;
      } else {
        right = mid - 1;
      }
    }

    if (!lastValueFits) {
      right += 1;
    }

    double fontSize;
    fontSize = right * userScale * stepGranularity;

    return fontSize;
  }

  bool _checkTextFits(
      TextSpan text, double scale, int? maxLines, BoxConstraints constraints) {
    final textPainter = TextPainter(
      text: text,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      textScaleFactor: scale,
      maxLines: maxLines,
    );

    textPainter.layout(maxWidth: constraints.maxWidth);

    return !(textPainter.didExceedMaxLines ||
        textPainter.height > constraints.maxHeight ||
        textPainter.width > constraints.maxWidth);
  }
}
