import 'package:get/get.dart';

import '../controllers/student_deleting_controller.dart';

class StudentDeletingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentDeletingController>(
      () => StudentDeletingController(),
    );
  }
}
