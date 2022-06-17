import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'package:goose_ui/goose_ui.dart';

void main() {
  group('week offset test', () {
    test('offset#1', () {
      expect(
        listEquals([1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 4, 5, 6, 7].weekOffset(0)),
        true,
      );
      expect(
        listEquals([1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 4, 5, 6, 7].weekOffset(7)),
        true,
      );
      expect(
        listEquals([1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 4, 5, 6, 7].weekOffset(-7)),
        true,
      );
      expect(
        listEquals([2, 3, 4, 5, 6, 7, 1], [1, 2, 3, 4, 5, 6, 7].weekOffset(1)),
        true,
      );
      expect(
        listEquals([7, 1, 2, 3, 4, 5, 6], [1, 2, 3, 4, 5, 6, 7].weekOffset(-1)),
        true,
      );
    });
  });
}
