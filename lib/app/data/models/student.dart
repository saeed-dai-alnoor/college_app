// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
  Student({
    this.success,
    this.message,
    this.data,
  });

  int? success;
  String? message;
  Data? data;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
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
    this.studentId,
    this.name,
    this.levelId,
  });

  int? studentId;
  String? name;
  String? levelId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        studentId: json["student_id"],
        name: json["name"],
        levelId: json["level_id"],
      );

  Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "name": name,
        "level_id": levelId,
      };
}
