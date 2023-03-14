import 'package:get/get.dart';

import '../controllers/teacher_creating_controller.dart';

class TeacherCreatingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherCreatingController>(
      () => TeacherCreatingController(),
    );
  }
}
