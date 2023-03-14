import 'package:college_app/app/data/services/dio_config.dart';
import 'package:dio/dio.dart';

class StudentAddingProvider {
  static addStudent({
    required String studentId,
    required String name,
    required String phone,
    required String level,
  }) async {
    try {
      DioConfig.dioClient.post(
        '/students',
        data: {
          'student_id': studentId,
          'name': name,
          'phone': phone,
          'level_id': level,
        },
      );
    } on DioError catch (e) {
      return e.message;
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
