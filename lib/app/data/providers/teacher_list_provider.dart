import 'package:college_app/app/data/services/dio_config.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/teachers_list.dart';

class TeacherListProvider {
  static Future<Either<List<Datum>?, String?>> fetchTeachers() async {
    try {
      var response = await DioConfig.dioClient.get(
        '/teachers',
      );
      if (response.statusCode == 200 && response.data['success'] == 1) {
        final result = TeachersList.fromJson(response.data);
        return left(result.data);
      } else {
        return right(null);
      }
    } on DioError catch (e) {
      return right(e.message);
    } on Exception catch (e) {
      return right(e.toString());
    }
  }
}
