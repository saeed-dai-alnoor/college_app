import 'package:dio/dio.dart';

class DioConfig {
  static Dio get dioClient {
    Dio dio = Dio();
    dio.options.baseUrl = 'http://192.168.43.68:5000/api';
    dio.options.connectTimeout = 50000; //50s
    dio.options.receiveTimeout = 50000; //50s
    dio.options.contentType = 'application/json';

    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return dio;
  }
}
