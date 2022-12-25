import 'package:college_app/app/data/models/students_lists.dart';
import 'package:college_app/app/data/services/dio_config.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class StudentsListsProvider {
  static Future<Either<List<Datum>?, String?>> fetchStudentsLists(
      {required String levelId}) async {
    try {
      var response = await DioConfig.dioClient.post(
        '/levels/students',
        data: {
          'level_id': levelId,
        },
      );
      if (response.statusCode == 200 && response.data['success'] == 1) {
        final result = StudentsLists.fromJson(response.data);
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