// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class CodeStyle extends InheritedWidget {
  const CodeStyle({
    super.key,
    this.baseStyle,
    this.numberStyle,
    this.commentStyle,
    this.keywordStyle,
    this.stringStyle,
    this.punctuationStyle,
    this.classStyle,
    this.constantStyle,
    required super.child,
  });

  final TextStyle? baseStyle;
  final TextStyle? numberStyle;
  final TextStyle? commentStyle;
  final TextStyle? keywordStyle;
  final TextStyle? stringStyle;
  final TextStyle? punctuationStyle;
  final TextStyle? classStyle;
  final TextStyle? constantStyle;

  static CodeStyle of(BuildContext context) {
    // return context.dependOnInheritedWidgetOfExactType<CodeStyle>()!;
    return const CodeStyle(
      baseStyle: TextStyle(color: Colors.black87),
      numberStyle: TextStyle(color: Colors.green),
      commentStyle: TextStyle(color: Colors.black38),
      keywordStyle: TextStyle(color: Colors.greenAccent),
      stringStyle: TextStyle(color: Colors.orange),
      punctuationStyle: TextStyle(color: Colors.pink),
      classStyle: TextStyle(color: Colors.blue),
      constantStyle: TextStyle(color: Colors.purple),
      child: SizedBox(),
    );
  }

  @override
  bool updateShouldNotify(CodeStyle oldWidget) =>
      oldWidget.baseStyle != baseStyle ||
      oldWidget.numberStyle != numberStyle ||
      oldWidget.commentStyle != commentStyle ||
      oldWidget.keywordStyle != keywordStyle ||
      oldWidget.stringStyle != stringStyle ||
      oldWidget.punctuationStyle != punctuationStyle ||
      oldWidget.classStyle != classStyle ||
      oldWidget.constantStyle != constantStyle;
}
