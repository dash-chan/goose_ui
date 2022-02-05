import 'package:flutter/material.dart';

class GRawInput extends TextField {
  GRawInput({
    Key? key,
    ValueChanged<String>? onChanged,
    TextEditingController? controller,
    VoidCallback? onEditingComplete,
    VoidCallback? onTap,
    ValueChanged<String>? onSubmitted,
    bool readOnly = false,
    String? placeholder,
    bool rounded = false,
  }) : super(
          key: key,
          onChanged: onChanged,
          controller: controller,
          onEditingComplete: onEditingComplete,
          onTap: onTap,
          onSubmitted: onSubmitted,
          readOnly: readOnly,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
                horizontal: rounded ? 16 : 8, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: rounded
                  ? BorderRadius.circular(32)
                  : const BorderRadius.all(Radius.circular(4.0)),
            ),
            hintText: placeholder,
          ),
        );
}
