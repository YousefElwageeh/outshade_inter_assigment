import 'dart:convert';

class UsersModel {
  List<User> users;
  UsersModel({
    required this.users,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'users': users.map((x) => x.toMap()).toList()});

    return result;
  }

  factory UsersModel.fromMap(Map<String, dynamic> map) {
    return UsersModel(
      users: List<User>.from(
          map['users']?.map((x) => User.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory UsersModel.fromJson(String source) =>
      UsersModel.fromMap(json.decode(source));
}

class User {
  String name;
  String id;
  String atype;
  User({
    required this.name,
    required this.id,
    required this.atype,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'id': id});
    result.addAll({'atype': atype});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      id: map['id'] ?? '',
      atype: map['atype'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
