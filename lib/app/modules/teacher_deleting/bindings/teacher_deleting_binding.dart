import 'package:get/get.dart';

import '../controllers/teacher_deleting_controller.dart';

class TeacherDeletingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherDeletingController>(
      () => TeacherDeletingController(),
    );
  }
}
