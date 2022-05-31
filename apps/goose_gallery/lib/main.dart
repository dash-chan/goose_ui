import 'package:flutter/material.dart';
import 'package:goose_gallery/widgets_page/button_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Goose Gallery',
      home: ButtonPage(),
    );
  }
}
