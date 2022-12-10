import 'dart:convert';
import 'package:college_app/app/data/services/http_api.dart';
import 'package:http/http.dart' as http;

class StudentProvider {
  postStudentData(data, apiUrl) async {
    var fullUrl = HttpApi.baseUrl + apiUrl;
    var client = http.Client();
    try {
      var response = await client.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: HttpApi.setHeader(),
      );
      return response;
    } finally {
      client.close();
    }
  }
}
