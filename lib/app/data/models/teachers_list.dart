// To parse this JSON data, do
//
//     final teachersList = teachersListFromJson(jsonString);

import 'dart:convert';

TeachersList? teachersListFromJson(String str) =>
    TeachersList.fromJson(json.decode(str));

String teachersListToJson(TeachersList? data) => json.encode(data!.toJson());

class TeachersList {
  TeachersList({
    this.success,
    this.data,
  });

  int? success;
  List<Datum>? data;

  factory TeachersList.fromJson(Map<String, dynamic> json) => TeachersList(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.teacherId,
    this.name,
    this.phone,
  });

  int? teacherId;
  String? name;
  String? phone;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
