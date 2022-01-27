import 'package:flutter/material.dart';
import 'package:goose_ui/src/types/form_type.dart';
import 'package:goose_ui/src/widgets/button/g_raw_button.dart';
import 'package:goose_ui/src/widgets/overlay/g_overlay.dart';

typedef TitleBuilder<T> = String Function(T? value);

double _height = 32;

class GSelectButton<T> extends StatefulWidget {
  /// 选择模式
  ///
  /// * 单选
  /// * 多选 TODO
  final SelectMode mode;

  /// 选择类型
  ///
  /// * 按钮
  /// * 输入框 TODO
  final SelectType type;
  final ValueChanged<T>? onChanged;
  final T? value;
  // TODO
  final List<T>? values;
  final List<T> items;
  final TitleBuilder? titleBuilder;
  final String placeholder;
  final FocusNode? focusNode;
  const GSelectButton({
    Key? key,
    this.mode = SelectMode.single,
    this.type = SelectType.button,
    required this.onChanged,
    this.value,
    this.values,
    required this.items,
    this.titleBuilder,
    this.placeholder = '请选择',
    this.focusNode,
  }) : super(key: key);

  @override
  State<GSelectButton<T>> createState() => _GSelectButtonState<T>();
}

class _GSelectButtonState<T> extends State<GSelectButton<T>> {
  final _overlay = GOverlay();
  final _layerLink = LayerLink();
  late FocusNode _focusNode;
  TitleBuilder<T> get _titleBuilder {
    if (widget.titleBuilder == null) {
      return (value) {
        if (value == null) return widget.placeholder;
        if (value is String) return value;
        return value.toString();
      };
    } else {
      return widget.titleBuilder!;
    }
  }

  hideFocus() {
    if (!_focusNode.hasFocus) _overlay.hide();
  }

  @override
  void initState() {
    super.initState();
    if (widget.type == SelectType.input) {
      throw UnimplementedError('//TODO add slectType: input');
    }
    if (widget.mode == SelectMode.multiple) {
      throw UnimplementedError('//TODO add selectMode: multiple');
    }

    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(hideFocus);
  }

  @override
  void dispose() {
    _overlay.hide();
    _focusNode.removeListener(hideFocus);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GRawButton(
        focusNode: _focusNode,
        width: 120,
        onPressed: () {
          if (!_focusNode.hasFocus) {
            _focusNode.requestFocus();
            RenderBox button = context.findRenderObject()! as RenderBox;
            var rect = RelativeRect.fromRect(
              Rect.fromPoints(
                button.localToGlobal(button.size.bottomLeft(Offset.zero)),
                button.localToGlobal(button.size.bottomRight(Offset.zero)),
              ),
              Offset.zero & Size(button.size.width, 600),
            );
            _overlay.show(
              link: _layerLink,
              linked: true,
              showWhenUnlinked: false,
              context: context,
              child: Material(
                elevation: 4,
                child: SizedBox(
                  height: 400,
                  width: button.size.width,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final item = widget.items[index];
                      return SizedBox(
                        height: _height,
                        child: ListTile(
                          title: Text(_titleBuilder(item)),
                          onTap: () {
                            if (widget.onChanged != null) {
                              widget.onChanged!(item);
                              _focusNode.unfocus();
                            }
                          },
                        ),
                      );
                    },
                    itemCount: widget.items.length,
                  ),
                ),
              ),
              rect: rect,
            );
          } else {
            _focusNode.unfocus();
          }
        },
        child: Text(_titleBuilder(widget.value)),
        icon: const Icon(Icons.arrow_drop_down_rounded),
        iconPosition: IconPosition.right,
      ),
    );
  }
}
