import 'package:flutter/material.dart';
import 'package:goose_gallery/widgets_page/avatar_page.dart';
import 'package:flutter_portal/flutter_portal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Portal(
      child: MaterialApp(
        title: 'Goose Gallery',
        home: AvatarPage(),
      ),
    );
  }
}
