import 'package:flutter/material.dart';

class Radio extends StatefulWidget {
  const Radio({Key? key}) : super(key: key);

  @override
  RadioState createState() => RadioState();
}

class RadioState extends State<Radio> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 100),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
          )
        ],
      ),
    );
  }
}
