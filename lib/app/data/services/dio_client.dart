// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';

class DioClient {
  static Dio get DIO_CLIENT {
    Dio dio = Dio();
    dio.options.baseUrl = 'https://3069-102-121-55-253.eu.ngrok.io/api';
    dio.options.connectTimeout = 50000; //50s
    dio.options.receiveTimeout = 50000; //50s
    dio.options.contentType = 'application/json';

    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return dio;
  }
}
