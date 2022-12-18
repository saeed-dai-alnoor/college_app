import 'package:http/http.dart' as http;

class RemoteServices {
  static String baseUrl = 'http://192.168.43.68:5000/api';

  static  final client = http.Client();

  static setHeader() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
