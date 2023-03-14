import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class DioConfig {
  static Dio get dioClient {
    final getStorge = GetStorage();
    Dio dio = Dio();
    dio.options.baseUrl = 'https://api-college-app.adaptable.app/api';
    dio.options.connectTimeout = 50000; //50s
    dio.options.receiveTimeout = 50000; //50s
    dio.options.contentType = 'application/json';

    dio.options.headers = {
      'Authorization': 'Bearer ${getStorge.read('teacherToken')}',
    };
    return dio;
  }
}
