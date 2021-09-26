class User {
  late String id, title, name;
  late String? address;
  late double age;

  User({required this.id, required this.title, required this.name, this.address, required this.age});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title': title,
      'name': name,
      'address': address,
      'age': age,
    };
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'] as String;
    title = map['title'] as String;
    name = map['name'] as String;
    address = map['address'] as String?;
    age = map['age'] as double;
  }
}
