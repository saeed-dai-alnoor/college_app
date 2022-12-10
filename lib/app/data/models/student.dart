// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

List<Student> studentFromJson(String str) => List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String studentToJson(List<Student> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
    Student({
        this.studentId,
        this.name,
        this.phone,
        this.createdAt,
        this.updatedAt,
    });

    String? studentId;
    String? name;
    String? phone;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        studentId: json["student_id"],
        name: json["name"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "name": name,
        "phone": phone,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}

