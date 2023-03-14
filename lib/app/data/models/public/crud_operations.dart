// To parse this JSON data, do
//
//     final crudOperations = crudOperationsFromJson(jsonString);

import 'dart:convert';

CrudOperations crudOperationsFromJson(String str) =>
    CrudOperations.fromJson(json.decode(str));

String crudOperationsToJson(CrudOperations data) => json.encode(data.toJson());

class CrudOperations {
  CrudOperations({
    required this.success,
    required this.message,
  });

  int success;
  String message;

  factory CrudOperations.fromJson(Map<String, dynamic> json) => CrudOperations(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
