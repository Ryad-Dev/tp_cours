import 'dart:convert';

class User {
  final int? id;
  final String name;
  final String prenom;
  final String numero;

  User( {
    this.id,
    required this.name,
    required this.prenom,
    required this.numero,

  });

  // Convert a User into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'prenom': prenom,
      'numero': numero,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      prenom: map['prenom'] ?? '',
      numero: map['numero'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  // Implement toString to make it easier to see information about
  // each User when using the print statement.
  @override
  String toString() => 'User(id: $id, name: $name, prenom: $prenom, numero: $numero)';
}