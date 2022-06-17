import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'package:goose_ui/src/extensions/list_extension.dart';

void main() {
  group('offset test', () {
    test('offset#1', () {
      expect(
        listEquals([1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 4, 5, 6, 7].offset(0)),
        true,
      );
      expect(
        listEquals([1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 4, 5, 6, 7].offset(7)),
        true,
      );
      expect(
        listEquals([1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 4, 5, 6, 7].offset(-7)),
        true,
      );
      expect(
        listEquals([2, 3, 4, 5, 6, 7, 1], [1, 2, 3, 4, 5, 6, 7].offset(1)),
        true,
      );
      expect(
        listEquals([7, 1, 2, 3, 4, 5, 6], [1, 2, 3, 4, 5, 6, 7].offset(-1)),
        true,
      );
    });
    test('offset#2', () {
      expect(
        listEquals([1, 2, 3, 4, 5, 6, '7'], [1, 2, 3, 4, 5, 6, '7'].offset(0)),
        true,
      );
    });
    test('offset#3', () {
      expect(
        listEquals([1], [1].offset(1)),
        true,
      );
      expect(
        listEquals([1], [1].offset(0)),
        true,
      );
      expect(
        listEquals([1], [1].offset(-1)),
        true,
      );
    });
    test('offset#4', () {
      expect(
        listEquals([], [].offset(-1)),
        true,
      );
      expect(
        listEquals([], [].offset(1)),
        true,
      );
      expect(
        listEquals([], [].offset(0)),
        true,
      );
    });
  });

  group('joined test', () {
    test('joined#1', () {
      expect(
        listEquals<int>(<int>[], <int>[].joined(1)),
        true,
      );
    });
    test('joined#2', () {
      expect(
        listEquals<int>(<int>[1], <int>[1].joined(1)),
        true,
      );
    });
    test('joined#3', () {
      expect(
        listEquals<int>(<int>[1, 1, 2], <int>[1, 2].joined(1)),
        true,
      );
    });
    test('joined#4', () {
      expect(
        listEquals<String>(
            <String>['1', '1', '2'], <String>['1', '2'].joined('1')),
        true,
      );
    });
  });
}
