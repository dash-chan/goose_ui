import 'dart:io';

import 'package:grinder/grinder.dart';
import 'package:path/path.dart' as path;

main(args) => grind(args);

@Task()
test() => TestRunner().testAsync();

@DefaultTask()
@Depends(test)
build() {
  Pub.build();
}

@Task()
clean() => defaultClean();

@Task('Update code segments')
Future<void> gen() async {
  final codeviewerPath =
      path.join(Directory.current.path, 'tool', 'codeviewer', 'main.dart');
  Dart.run(
    codeviewerPath,
    arguments: ['--target', 'lib/gen/code_segments.dart'],
  );
}
