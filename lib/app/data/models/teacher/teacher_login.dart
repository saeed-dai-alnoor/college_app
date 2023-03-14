// To parse this JSON data, do
//
//     final teacherLogin = teacherLoginFromJson(jsonString);

import 'dart:convert';

TeacherLogin teacherLoginFromJson(String str) =>
    TeacherLogin.fromJson(json.decode(str));

String teacherLoginToJson(TeacherLogin data) => json.encode(data.toJson());

class TeacherLogin {
  TeacherLogin({
    required this.success,
    required this.message,
    required this.name,
    required this.token,
  });

  int success;
  String message;
  String name;
  String token;

  factory TeacherLogin.fromJson(Map<String, dynamic> json) => TeacherLogin(
        success: json["success"],
        message: json["message"],
        name: json["name"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "name": name,
        "token": token,
      };
}
