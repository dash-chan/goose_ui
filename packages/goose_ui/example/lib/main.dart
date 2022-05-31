import 'package:flutter/material.dart';
import 'package:goose_ui/goose_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ATheme(
      data: AThemeData(
        buttonTheme: const AButtonThemeData(
          autoInsertSpaceInButton: true,
        ),
      ),
      child: MaterialApp(
        title: 'Goose UI',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Goose UI'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            for (var rounded in [true, false])
              for (var size in ASize.values)
                for (var type in AButtonType.values)
                  AButton(
                    onPressed: () {},
                    buttonType: type,
                    size: size,
                    rounded: rounded,
                    child: Text(type.name),
                  ),
            AButton(
              onPressed: () {},
              buttonType: AButtonType.primary,
              size: ASize.medium,
              child: const Text('空格'),
            ),
            AIconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            for (var type in AButtonType.values)
              AIconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                rounded: true,
                buttonType: type,
              ),
          ],
        ),
      ),
    );
  }
}
