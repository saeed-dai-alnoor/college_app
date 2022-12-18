import 'package:college_app/app/data/models/student.dart';
import 'package:college_app/app/data/services/remote_services.dart';

class StudentProvider {
  static Future<List<Datum>?> getStudents() async {
    var response = await RemoteServices.client
        .get(Uri.parse('${RemoteServices.baseUrl}/students'));

    if (response.statusCode == 200 &&
        studentFromJson(response.body).success == 1) {
      return studentFromJson(response.body).data;
    } else {
      return null;
    }
  }
}
