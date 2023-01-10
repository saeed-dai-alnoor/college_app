// To parse this JSON data, do
//
//     final manager = managerFromJson(jsonString);

import 'dart:convert';

Manager managerFromJson(String str) => Manager.fromJson(json.decode(str));

String managerToJson(Manager data) => json.encode(data.toJson());

class Manager {
    Manager({
        this.success,
        this.message,
        this.data,
    });

    int? success;
    String? message;
    Data? data;

    factory Manager.fromJson(Map<String, dynamic> json) => Manager(
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
        this.managerId,
        this.name,
        this.phone,
    });

    String? managerId;
    String? name;
    String? phone;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        managerId: json["manager_id"],
        name: json["name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "manager_id": managerId,
        "name": name,
        "phone": phone,
    };
}
