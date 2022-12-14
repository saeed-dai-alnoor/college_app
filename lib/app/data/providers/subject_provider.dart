// ignore_for_file: unused_import

import 'package:college_app/app/data/models/subject.dart';
import 'package:college_app/app/data/services/dio_config.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SubjectProvider {
  static Future<Either<List<Datum>?, String?>> fetchSubjects(
      {required String semesterId}) async {
    try {
      var response = await DioConfig.dioClient.post(
        '/semesters/subjects',
        data: {
          'semester_id': semesterId,
        },
      );
      if (response.statusCode == 200 && response.data['success'] == 1) {
        final result = Subject.fromJson(response.data);
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
