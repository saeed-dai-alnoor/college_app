import 'package:college_app/app/data/models/student.dart';
import 'package:college_app/app/data/services/remote_services.dart';
import 'dart:convert';

import 'package:college_app/app/modules/level_type/controllers/level_type_controller.dart';
import 'package:get/get.dart';

class StudentProvider {
  static Future<List<Datum>?> getStudentsByLevel() async {
    LevelTypeController levelTypeController = Get.find<LevelTypeController>();
    String level = '1';
    if (levelTypeController.defaultLevel.value == 'level2') {
      level = '2';
    } else if (levelTypeController.defaultLevel.value == 'level3') {
      level = '3';
    } else if (levelTypeController.defaultLevel.value == 'level4') {
      level = '4';
    } else if (levelTypeController.defaultLevel.value == 'level5') {
      level = '5';
    } else {
      level = '1';
    }
    var response = await RemoteServices.client.post(
      Uri.parse('${RemoteServices.baseUrl}/levels/students'),
      body: jsonEncode({'level_id': level}),
      headers: RemoteServices.setHeader(),
    );
    if (response.statusCode == 200 &&
        studentFromJson(response.body).success == 1) {
      return studentFromJson(response.body).data;
    } else {
      return null;
    }
  }
}
