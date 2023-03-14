import 'package:college_app/app/data/models/teacher/teacher_login.dart';
import 'package:college_app/app/data/services/dio_config.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TeacherProvider {
  final getStorge = GetStorage();
  Future<Either<String?, String?>> loginTeacher({
    required String phone,
    required String password,
  }) async {
    try {
      var response = await DioConfig.dioClient.post(
        '/login-teacher',
        data: {
          'phone': phone,
          'password': password,
        },
      );
      if (response.data['success'] == 1) {
        final result = TeacherLogin.fromJson(response.data);
        getStorge.write('teacherName', result.name);
        getStorge.write('teacherToken', result.token);
        return left(result.message);
      } else {
        return right(
            '${'validatePhoneMessage'.tr}\n ${'or'.tr} ${'vaildPassword'.tr}');
      }
    } on DioError catch (e) {
      return right(e.type.toString());
    } on Exception catch (e) {
      return right(e.toString());
    }
  }
}
