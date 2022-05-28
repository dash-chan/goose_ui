# ant_color

> NOTICE: THIS IS NOT A OFFICIAL REPO.
>
> If you have issue about this project, place make a [new issue](https://github.com/goose-kit/goose_ui/issues?q=is%3Aissue+is%3Aopen+ant_color) or make a [PR](https://github.com/goose-kit/goose_ui/compare).

Ant Design's base color palette totals 120 colors, including 12 primary colors and their derivative colors. These colors can basically include the need for color in background applications design.

## Add to Your Project

* pubspec.yaml
```yaml
dependencies:
    ant_color: any
```
* shell
```dart
flutter pub add ant_color
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:ant_color/ant_color.dart';
// default usage
final antColorBox = Container(color: AntColors.volcano);
final antColorBoxWithShade = Container(color: AntColors.volcano[700]!);

// generate color palette
final someColor = AntColor.generate(Colors.blue);
```


## references

* [ant-design-colors](https://github.com/ant-design/ant-design-colors)
* [Ant Design: 色彩](https://ant.design/docs/spec/colors-cn)