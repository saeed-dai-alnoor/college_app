import 'package:college_app/app/data/models/public/crud_operations.dart';
import 'package:college_app/app/data/models/teacher.dart';
import 'package:college_app/app/data/models/teacher/teachers_getting.dart';
import 'package:college_app/app/data/services/dio_config.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class TeacherProvider {
  //** login teacher to take token **//
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
      if (response.data['success'] == 1) {
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

  //** CRUD Opertion **//
  //** (C) Create new teacher in table teachers **//
  Future<Either<int?, String?>> createTeacher({
    required String teacherId,
    required String teacherName,
    required String phone,
    required String password,
    required String isAdmin,
  }) async {
    try {
      var response = await DioConfig.dioClient.post('/create-teacher', data: {
        "teacherId": teacherId,
        "teacherName": teacherName,
        "phone": phone,
        "password": password,
        "isAdmin": isAdmin,
      });
      final result = CrudOperations.fromJson(response.data);
      if (response.data['success'] == 1) {
        // print(result.message);
        return left(result.success);
      } else {
        return right(result.message);
      }
    } on DioError catch (e) {
      return right(e.type.toString());
    } on Exception catch (e) {
      return right(e.toString());
    }
  }

  //** (R) read all teachers in table teachers **//
  Future<Either<List<Datum>?, String?>> getTeachers() async {
    try {
      var response = await DioConfig.dioClient.get('/teachers');
      if (response.data['success'] == 1) {
        final result = TeachersGetting.fromJson(response.data);
        // print(result.message);
        return left(result.data);
      } else {
        return right(null);
      }
    } on DioError catch (e) {
      return right(e.type.toString());
    } on Exception catch (e) {
      return right(e.toString());
    }
  }

  //** (U) update teacher in table **//
  Future<Either<int?, String?>> updateTeacher({
    required String teacherId,
    required String teacherName,
    required String phone,
    required String password,
    required String isAdmin,
  }) async {
    try {
      var response = await DioConfig.dioClient.put('/update-teacher', data: {
        "teacherId": teacherId,
        "teacherName": teacherName,
        "phone": phone,
        "password": password,
        "isAdmin": isAdmin
      });
      final result = CrudOperations.fromJson(response.data);
      if (response.data['success'] == 1) {
        // print(result.message);
        return left(result.success);
      } else {
        return right(result.message);
      }
    } on DioError catch (e) {
      return right(e.type.toString());
    } on Exception catch (e) {
      return right(e.toString());
    }
  }

//** (D) delete teacher in table *//
  Future<Either<int?, String?>> deleteLevel({
    required String teacherId,
  }) async {
    try {
      var response = await DioConfig.dioClient.delete('/delete-teacher', data: {
        'teacherId': teacherId,
      });
      final result = CrudOperations.fromJson(response.data);
      if (response.data['success'] == 1) {
        // print(result.message);
        return left(result.success);
      } else {
        return right(result.message);
      }
    } on DioError catch (e) {
      return right(e.type.toString());
    } on Exception catch (e) {
      return right(e.toString());
    }
  }
}
