import 'package:get/get.dart';

import '../controllers/teacher_updating_controller.dart';

class TeacherUpdatingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherUpdatingController>(
      () => TeacherUpdatingController(),
    );
  }
}
