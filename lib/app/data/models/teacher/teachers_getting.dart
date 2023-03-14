// To parse this JSON data, do
//
//     final teachersGetting = teachersGettingFromJson(jsonString);

import 'dart:convert';

TeachersGetting teachersGettingFromJson(String str) =>
    TeachersGetting.fromJson(json.decode(str));

String teachersGettingToJson(TeachersGetting data) =>
    json.encode(data.toJson());

class TeachersGetting {
  TeachersGetting({
    required this.success,
    required this.message,
    required this.data,
  });

  int success;
  String message;
  List<Datum> data;

  factory TeachersGetting.fromJson(Map<String, dynamic> json) =>
      TeachersGetting(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.teacherId,
    required this.teacherName,
    required this.teacherLog,
    required this.phone,
    required this.password,
    required this.isAdmin,
  });

  int teacherId;
  String teacherName;
  String teacherLog;
  String phone;
  String password;
  bool isAdmin;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        teacherId: json["teacherId"],
        teacherName: json["teacherName"],
        teacherLog: json["teacherLog"],
        phone: json["phone"],
        password: json["password"],
        isAdmin: json["isAdmin"],
      );

  Map<String, dynamic> toJson() => {
        "teacherId": teacherId,
        "teacherName": teacherName,
        "teacherLog": teacherLog,
        "phone": phone,
        "password": password,
        "isAdmin": isAdmin,
      };
}
