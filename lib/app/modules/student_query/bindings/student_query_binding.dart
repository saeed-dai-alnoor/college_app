import 'package:get/get.dart';

import '../controllers/student_query_controller.dart';

class StudentQueryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentQueryController>(
      () => StudentQueryController(),
    );
  }
}
