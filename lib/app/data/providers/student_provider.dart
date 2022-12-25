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
