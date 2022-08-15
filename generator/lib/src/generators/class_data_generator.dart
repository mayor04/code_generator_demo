import 'dart:async';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class ClassDataGenerator extends Generator {
  @override
  FutureOr<String?> generate(LibraryReader library, BuildStep buildStep) {
    final buffer = StringBuffer();

    for (var classData in library.classes) {
      final name = classData.displayName;

      buffer.writeln('extension \$$name on $name{');

      if (classData.fields.isNotEmpty) {
        buffer.write('String details() => ');

        final fieldWithValues = classData.fields.map((e) => '${e.name}: \$${e.name}');
        buffer.write("'$name{${fieldWithValues.join(', ')}}';");
      }

      buffer.writeln('}');
    }

    return buffer.toString();
  }
}
