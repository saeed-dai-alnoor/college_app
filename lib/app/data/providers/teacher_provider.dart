import 'package:college_app/app/data/models/teacher.dart';
import 'package:college_app/app/data/services/dio_config.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class TeacherProvider {
  static Future<Either<Data?, String?>> loginTeacher({
    required String phone,
    required String password,
  }) async {
    try {
      var response = await DioConfig.dioClient.post(
        '/teachers/login',
        data: {
          'phone': phone,
          'password': password,
        },
      );
      if (response.statusCode == 200 && response.data['success'] == 1) {
        final result = Teacher.fromJson(response.data);
        return left(result.data);
      } else {
        return right(
            '${'validatePhoneMessage'.tr}\n ${'or'.tr} ${'vaildPassword'.tr}');
      }
    } on DioError catch (e) {
      return right(e.message);
    } on Exception catch (e) {
      return right(e.toString());
    }
  }
}
