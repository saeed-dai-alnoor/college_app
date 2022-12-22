import 'package:college_app/app/data/models/subject.dart';
import 'package:college_app/app/data/services/remote_services.dart';
import 'dart:convert';
import 'package:college_app/app/modules/level_type/controllers/level_type_controller.dart';
import 'package:college_app/app/modules/semester_type/controllers/semester_type_controller.dart';
import 'package:get/get.dart';

class SubjectProvider {
  static Future<List<Datum>?> getSubjectsBySemester() async {
    LevelTypeController levelTypeController = Get.find<LevelTypeController>();
    SemesterTypeController semesterTypeController =
        Get.find<SemesterTypeController>();
    String semester = '1';
    if (levelTypeController.defaultLevel.value == 'level1' &&
        semesterTypeController.defaultSemester.value == 'semester2') {
      semester = '2';
    } else if (levelTypeController.defaultLevel.value == 'level2' &&
        semesterTypeController.defaultSemester.value == 'semester1') {
      semester = '3';
    } else if (levelTypeController.defaultLevel.value == 'level2' &&
        semesterTypeController.defaultSemester.value == 'semester2') {
      semester = '4';
    } else if (levelTypeController.defaultLevel.value == 'level3' &&
        semesterTypeController.defaultSemester.value == 'semester1') {
      semester = '5';
    } else if (levelTypeController.defaultLevel.value == 'level3' &&
        semesterTypeController.defaultSemester.value == 'semester2') {
      semester = '6';
    } else if (levelTypeController.defaultLevel.value == 'level4' &&
        semesterTypeController.defaultSemester.value == 'semester1') {
      semester = '7';
    } else if (levelTypeController.defaultLevel.value == 'level4' &&
        semesterTypeController.defaultSemester.value == 'semester2') {
      semester = '8';
    } else if (levelTypeController.defaultLevel.value == 'level5' &&
        semesterTypeController.defaultSemester.value == 'semester1') {
      semester = '9';
    } else if (levelTypeController.defaultLevel.value == 'level5' &&
        semesterTypeController.defaultSemester.value == 'semester2') {
      semester = '10';
    } else {
      semester = '1';
    }
    var response = await RemoteServices.client.post(
      Uri.parse('${RemoteServices.baseUrl}/semesters/subjects'),
      body: jsonEncode({'semester_id': semester}),
      headers: RemoteServices.setHeader(),
    );
    if (response.statusCode == 200 &&
        subjectFromJson(response.body).success == 1) {
      return subjectFromJson(response.body).data;
    } else {
      return null;
    }
  }
}
