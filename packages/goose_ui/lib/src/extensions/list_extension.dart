extension ListX<T> on List<T> {
  Iterable<T> _joinedIterable(T sepItem) sync* {
    final it = iterator;
    if (!it.moveNext()) return;
    yield it.current;
    while (it.moveNext()) {
      yield sepItem;
      yield it.current;
    }
  }

  /// sepated items and join with [sep]
  ///
  /// Example:
  /// ```dart
  /// final before = <int>[1,2,3,4];
  /// final after = before.sep(0); // [1,0,2,0,3,0,4]
  /// ```
  List<T> joined(T sepItem) => _joinedIterable(sepItem).toList();

  /// move items to the beginning of the list
  ///
  /// Example:
  /// ```dart
  /// final before = <int>[1,2,3,4];
  ///
  /// final after = before.offset(2); // [3,4,1,2]
  /// ```
  List<T> offset(int offsets) {
    if (isEmpty) return <T>[];
    offsets = offsets % length - 1;
    return [...getRange(offsets + 1, length), ...getRange(0, offsets + 1)];
  }
}
