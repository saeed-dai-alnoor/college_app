// To parse this JSON data, do
//
//     final teacher = teacherFromJson(jsonString);

import 'dart:convert';

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));

String teacherToJson(Teacher data) => json.encode(data.toJson());

class Teacher {
  Teacher({
    this.success,
    this.message,
    this.data,
  });

  int? success;
  String? message;
  Data? data;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.teacherId,
    this.name,
    this.phone,
  });

  int? teacherId;
  String? name;
  String? phone;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        teacherId: json["teacher_id"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "teacher_id": teacherId,
        "name": name,
        "phone": phone,
      };
}
