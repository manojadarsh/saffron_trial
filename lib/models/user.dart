// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.created,
    this.updated,
    this.isVerified,
    this.jwtToken,
  });

  int id;
  String title;
  String firstName;
  String lastName;
  String email;
  String role;
  DateTime created;
  dynamic updated;
  bool isVerified;
  String jwtToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    title: json["title"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    role: json["role"],
    created: DateTime.parse(json["created"]),
    updated: json["updated"],
    isVerified: json["isVerified"],
    jwtToken: json["jwtToken"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "role": role,
    "created": created.toIso8601String(),
    "updated": updated.toIso8601String(),
    "isVerified": isVerified,
    "jwtToken": jwtToken,
  };
}
