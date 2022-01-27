import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

class GPagination extends StatelessWidget {
  /// current page
  final int value;
  final ValueChanged<int>? onChanged;

  /// size of single page
  final int size;

  /// length of items
  final int total;

  const GPagination({
    Key? key,
    required this.value,
    this.onChanged,
    this.size = 10,
    required this.total,
  })  : assert(value >= 1),
        super(key: key);

  int get maxPage => total % size == 0 ? total ~/ size : total ~/ size + 1;

  int get computePage => maxPage >= 10 ? 7 : maxPage;

  bool get showPre => maxPage >= 10 && value >= 5;
  bool get showFirst => maxPage >= 10 && value >= 4;
  bool get showNext => maxPage >= 10 && value <= maxPage - 4;
  bool get showEnd => maxPage >= 10 && value <= maxPage - 3;

  // render items if length less than 9
  List<Widget> _renderSimple() {
    return List.generate(maxPage, (index) {
      return GRawButton(
        onPressed: () {},
        child: Text((index + 1).toString()),
        color: index + 1 + maxPage == value ? Colors.blue : null,
      );
    });
  }

  List<Widget> _renderDynamic() {
    return List.generate(5, (index) {
      int _current = index + value - 2;
      if (value <= 2) {
        _current = index + 1;
      } else if (value >= maxPage - 2) {
        _current = maxPage + index - 4;
      }
      return GRawButton(
        onPressed: () {
          if (onChanged != null) onChanged!(_current);
        },
        child: Text(_current.toString()),
        color: _current == value ? Colors.blue : null,
      );
    });
  }

  List<Widget> _renderMid() {
    if (maxPage <= 9) {
      return _renderSimple();
    } else {
      return _renderDynamic();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GRawButton(
          onPressed: value <= 1
              ? null
              : () {
                  if (onChanged != null) onChanged!(value - 1);
                },
          child: const Icon(Icons.arrow_back_ios_rounded),
        ),
        if (showFirst)
          GRawButton(
            onPressed: () {
              if (onChanged != null) onChanged!(1);
            },
            child: const Text('1'),
          ),
        if (showPre)
          GRawButton(
            onPressed: () {
              var next = value - 5;
              if (next <= 5) {
                if (onChanged != null) onChanged!(2);
              } else {
                if (onChanged != null) onChanged!(next);
              }
            },
            child: const Icon(Icons.more_horiz),
          ),
        ..._renderMid(),
        if (showNext)
          GRawButton(
            onPressed: () {
              var next = value + 5;
              if (next <= 5) {
                if (onChanged != null) onChanged!(2);
              } else {
                if (onChanged != null) onChanged!(next);
              }
            },
            child: const Icon(Icons.more_horiz),
          ),
        if (showEnd)
          GRawButton(
            onPressed: () {
              if (onChanged != null) onChanged!(maxPage);
            },
            child: Text(maxPage.toString()),
          ),
        GRawButton(
          onPressed: value >= maxPage
              ? null
              : () {
                  if (onChanged != null) onChanged!(value + 1);
                },
          child: const Icon(Icons.arrow_forward_rounded),
        ),
      ],
    );
  }
}
