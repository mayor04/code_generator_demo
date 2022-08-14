import 'package:build/build.dart';
import 'package:generator/src/class_data_generator.dart';
import 'package:generator/src/info_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder infoGeneratorBuilder(BuilderOptions options) =>
    SharedPartBuilder([InfoGenerator()], 'info');

Builder classDataGeneratorBuilder(BuilderOptions options) =>
    SharedPartBuilder([ClassDataGenerator()], 'class');
