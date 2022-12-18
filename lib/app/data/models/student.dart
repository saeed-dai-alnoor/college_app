// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
    Student({
        this.success,
        this.data,
    });

    int? success;
    List<Datum>? data;

    factory Student.fromJson(Map<String, dynamic> json) => Student(
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
        this.levelId,
    });

    String? studentId;
    String? name;
    String? levelId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
