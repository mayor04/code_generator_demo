import 'package:code_gen/src/first.dart';

part 'second.g.dart';

var i = 0;

class SecondPet extends Pet {
  SecondPet(super.name, super.age, super.owner);

  @override
  String toString() => 'SecondPet{name: $name, age: $age, owner: $owner}';
}
