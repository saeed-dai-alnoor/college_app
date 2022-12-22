// To parse this JSON data, do
//
//     final subject = subjectFromJson(jsonString);

import 'dart:convert';

Subject subjectFromJson(String str) => Subject.fromJson(json.decode(str));

String subjectToJson(Subject data) => json.encode(data.toJson());

class Subject {
  Subject({
    this.success,
    this.data,
  });

  int? success;
  List<Datum>? data;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
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
    this.subjectName,
    this.teacherName,
  });

  String? subjectName;
  String? teacherName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        subjectName: json["subject_name"],
        teacherName: json["teacher_name"],
      );

  Map<String, dynamic> toJson() => {
        "subject_name": subjectName,
        "teacher_name": teacherName,
      };
}
