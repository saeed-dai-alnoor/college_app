// To parse this JSON data, do
//
//     final studentsLists = studentsListsFromJson(jsonString);

import 'dart:convert';

StudentsLists studentsListsFromJson(String str) =>
    StudentsLists.fromJson(json.decode(str));

String studentsListsToJson(StudentsLists data) => json.encode(data.toJson());

class StudentsLists {
  StudentsLists({
    this.success,
    this.data,
  });

  int? success;
  List<Datum>? data;

  factory StudentsLists.fromJson(Map<String, dynamic> json) => StudentsLists(
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
    this.studentId,
    this.name,
  });

  int? studentId;
  String? name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        studentId: json["student_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "name": name,
      };
}
