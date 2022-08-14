import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class InfoGenerator extends Generator {
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) async {
    final buffer = StringBuffer();

    final allElement = library.allElements.whereType<TopLevelVariableElement>();
    for (var element in allElement) {
      buffer.writeln(
          '// ${element.displayName} - ${element.source?.fullName} - ${element.declaration}');
    }

    return buffer.toString();
  }
}
