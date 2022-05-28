import 'dart:ui';

import 'package:ant_color/ant_color.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test Inner Colors', () {
    for (var element in AntColors.items) {
      final currentAntColor = AntColor.generate(element.primary);
      // test('test color: ${element.primary}', () {});

      group('test: [${element.primary}]', () {
        for (var i = 1; i <= 10; i++) {
          final match = element[i * 100];
          final actual = currentAntColor[i * 100];
          test('test detail: [$match]', () {
            expect(actual, match, reason: '$actual != $match');
          });
        }
      });
    }
  });

  group('test #1', () {
    test('test #2475c3', () {
      for (var i = 1; i <= 10; i++) {
        final gen = AntColor.generate(const Color(0xFF2475c3));
        const matchColor = AntColor(0xff2475c3, <int, Color>{
          100: Color(0xfff0faff),
          200: Color(0xffc9e5f5),
          300: Color(0xff99cae8),
          400: Color(0xff6eaedb),
          500: Color(0xff4691cf),
          600: Color(0xff2475c3),
          700: Color(0xff14569c),
          800: Color(0xff093a75),
          900: Color(0xff02224f),
          1000: Color(0xff011029),
        });
        final match = matchColor[i * 100];
        final actual = gen[i * 100];
        test('test detail: [$match]', () {
          expect(actual, match);
        });
      }
    });
  });
}
