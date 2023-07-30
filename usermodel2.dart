// To parse this JSON data, do
//
//     final userModel2 = userModel2FromJson(jsonString);

import 'dart:convert';

List<UserModel2> userModel2FromJson(String str) => List<UserModel2>.from(json.decode(str).map((x) => UserModel2.fromJson(x)));

String userModel2ToJson(List<UserModel2> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel2 {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  UserModel2({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory UserModel2.fromJson(Map<String, dynamic> json) => UserModel2(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
