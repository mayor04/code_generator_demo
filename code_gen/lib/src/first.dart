part 'first.g.dart';

var i = 10;
int r = 70;

String name = 'Samuel';

class Pet {
  final String name;
  final int age;
  final String owner;

  Pet(this.name, this.age, this.owner);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'owner': owner,
    };
  }

  @override
  String toString() => 'Pet{name: $name, age: $age, owner: $owner}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pet &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age &&
          owner == other.owner;

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ owner.hashCode;
}
