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

  List<V> wrap<V>(V Function(T current) convert) {
    final it = iterator;
    if (!it.moveNext()) return <V>[];
    final nextList = <V>[convert(it.current)];
    while (it.moveNext()) {
      nextList.add(convert(it.current));
    }

    return nextList;
  }
}
