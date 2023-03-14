// To parse this JSON data, do
//
//     final levelsGetting = levelsGettingFromJson(jsonString);

import 'dart:convert';

LevelsGetting levelsGettingFromJson(String str) => LevelsGetting.fromJson(json.decode(str));

String levelsGettingToJson(LevelsGetting data) => json.encode(data.toJson());

class LevelsGetting {
    LevelsGetting({
        required this.success,
        required this.message,
        required this.data,
    });

    int success;
    String message;
    List<Datum> data;

    factory LevelsGetting.fromJson(Map<String, dynamic> json) => LevelsGetting(
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
        required this.levelId,
        required this.levelName,
    });

    int levelId;
    String levelName;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        levelId: json["levelId"],
        levelName: json["levelName"],
    );

    Map<String, dynamic> toJson() => {
        "levelId": levelId,
        "levelName": levelName,
    };
}
