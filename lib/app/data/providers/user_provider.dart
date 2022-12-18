import 'dart:convert';
import 'package:college_app/app/data/services/remote_services.dart';

class UserProvider {
  static postUserData(data, apiUrl) async {
    var fullUrl = RemoteServices.baseUrl + apiUrl;
      var response = await RemoteServices.client.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: RemoteServices.setHeader(),
      );
      return response;
  }
}
