class Dog {
  final int id;
  final String name;
  final int age;

  const Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  factory Dog.build() => const Dog(id: 1, age: 5, name: "kittu");

  factory Dog.create() => const Dog(id: 1, age: 5, name: "kittu");

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'age': age};

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}
