extension ListExt<T> on List<T> {
  void offset(int offset) {
    final _offset = offset % length;
    if (_offset == 0) return;
    for (var i = 0; i < _offset; i++) {
      add(removeAt(0));
    }
    return;
  }
}
