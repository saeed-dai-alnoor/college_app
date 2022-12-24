import 'package:college_app/app/data/models/student.dart';
import 'package:college_app/app/data/services/dio_config.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class StudentProvider {
  static Future<Either<Data?, String?>> loginStudent({
    required String studentId,
    required String phone,
  }) async {
    try {
      var response = await DioConfig.dioClient.post(
        '/students/login',
        data: {
          'student_id': studentId,
          'phone': phone,
        },
      );
      if (response.statusCode == 200 && response.data['success'] == 1) {
        final result = Student.fromJson(response.data);
        return left(result.data);
      } else {
        return right(
            '${'validateIdMessage'.tr}\n ${'or'.tr} ${'validatePhoneMessage'.tr}');
      }
    } on DioError catch (e) {
      return right(e.message);
    } on Exception catch (e) {
      return right(e.toString());
    }
  }
}
















// import 'package:college_app/app/core/themes/custom_colors.dart';
// import 'package:college_app/app/data/models/student.dart';
// import 'package:college_app/app/data/providers/user_provider.dart';
// import 'package:college_app/app/data/services/remote_services.dart';
// import 'dart:convert';

// import 'package:college_app/app/modules/level_type/controllers/level_type_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class StudentProvider {
//   static getStudentsByLevel() async {
//     LevelTypeController levelTypeController = Get.find<LevelTypeController>();
//     String level = '1';
//     if (levelTypeController.defaultLevel.value == 'level2') {
//       level = '2';
//     } else if (levelTypeController.defaultLevel.value == 'level3') {
//       level = '3';
//     } else if (levelTypeController.defaultLevel.value == 'level4') {
//       level = '4';
//     } else if (levelTypeController.defaultLevel.value == 'level5') {
//       level = '5';
//     } else {
//       level = '1';
//     }
//     var response = await RemoteServices.client.post(
//       Uri.parse('${RemoteServices.baseUrl}/levels/students'),
//       body: jsonEncode({'level_id': level}),
//       headers: RemoteServices.setHeader(),
//     );
//     if (response.statusCode == 200 &&
//         studentFromJson(response.body).success == 1) {
//       return studentFromJson(response.body).data;
//     } else {
//       return null;
//     }
//   }

//   static loginStudent({
//     required String firstApiField,
//     required String secondApiField,
//     required String firstFlutterField,
//     required String secondFlutterField,
//     required int idStorage,
//     required String urlPath,
//     required RxBool isLoad,
//     required String newRouteName,
//   }) async {
//     isLoad.value = true;
//     var data = {
//       firstApiField: firstFlutterField,
//       secondApiField: secondFlutterField,
//     };

//     var response = await UserProvider.postUserData(data, urlPath);

//     if (response.statusCode == 200 &&
//         studentFromJson(response.body).success == 1) {
//       final getStorage = GetStorage();
//       isLoad.value = false;
//       getStorage.write('id', idStorage);
//       Get.offAllNamed(newRouteName,
//           arguments: studentFromJson(response.body).data!.name);
//       return studentFromJson(response.body).data;
//     } else {
//       isLoad.value = false;
//       Get.defaultDialog(
//         title: 'Error',
//         content: Text("${studentFromJson(response.body).data}"),
//         barrierDismissible: true,
//         textCancel: 'Try Again',
//         cancelTextColor: Colors.black,
//         buttonColor: CustomColors.primColor,
//       );
//       return studentFromJson(response.body).data;
//     }
//   }
// }
