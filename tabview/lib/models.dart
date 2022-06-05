import 'dart:convert';

class User {
  final String name;
  final String username;
  User({
    required this.name,
    required this.username,
  });


  User copyWith({
    String? name,
    String? username,
  }) {
    return User(
      name: name ?? this.name,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'username': username,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      username: map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, username: $username)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.name == name &&
      other.username == username;
  }

  @override
  int get hashCode => name.hashCode ^ username.hashCode;
}
