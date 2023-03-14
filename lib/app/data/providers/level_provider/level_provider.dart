import 'package:college_app/app/data/models/level/levels_getting.dart';
import 'package:college_app/app/data/models/public/crud_operations.dart';
import 'package:college_app/app/data/services/dio_config.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LevelProvider {
  //** CRUD Opertion **//
  //** (C) Create new level in table levels **//
  Future<Either<int?, String?>> createLevel({
    required String levelId,
    required String levelName,
  }) async {
    try {
      var response = await DioConfig.dioClient.post('/create-level', data: {
        'levelId': levelId,
        'levelName': levelName,
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

  //** (R) read all levels in table levels **//
  Future<Either<List<Datum>?, String?>> getLevels() async {
    try {
      var response = await DioConfig.dioClient.get('/levels');
      if (response.data['success'] == 1) {
        final result = LevelsGetting.fromJson(response.data);
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

//** (U) update level in table **//
  Future<Either<int?, String?>> updateLevel({
    required String levelId,
    required String levelName,
  }) async {
    try {
      var response = await DioConfig.dioClient.put('/update-level', data: {
        'levelId': levelId,
        'levelName': levelName,
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

//** (D) delete level in table *//
  Future<Either<int?, String?>> deleteLevel({
    required String levelId,
  }) async {
    try {
      var response = await DioConfig.dioClient.delete('/delete-level', data: {
        'levelId': levelId,
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
