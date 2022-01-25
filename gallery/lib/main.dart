import 'package:flutter/material.dart';
import 'package:gallery/home_page.dart';
import 'package:gallery/utils/desktop_util.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (DesktopUtil.isDesktopExceptWeb) {
    await windowManager.ensureInitialized();
  }

  windowManager.waitUntilReadyToShow().then((_) async {
    if (!await windowManager.isFullScreen()) {
      await windowManager.setFullScreen(true);
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'goose demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
