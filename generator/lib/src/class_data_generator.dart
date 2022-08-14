import 'dart:async';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class ClassDataGenerator extends Generator {
  @override
  FutureOr<String?> generate(LibraryReader library, BuildStep buildStep) {
    final buffer = StringBuffer();

    for (var _class in library.classes) {
      final name = _class.displayName;
      // extension $Pet on Pet{
      //    String details() => 'Pet{name: $name, age: $age, owner: $owner}';
      // }

      buffer.writeln('extension \$$name on $name{');

      if (_class.fields.isNotEmpty) {
        buffer.write('String details() => ');

        final fieldWithValues = _class.fields.map((e) => '${e.name}: \$${e.name}');
        buffer.write("'$name{${fieldWithValues.join(', ')}}';");
      }

      buffer.writeln('}');
    }

    return buffer.toString();
  }
}
