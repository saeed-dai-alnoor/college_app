import 'package:get/get.dart';

import '../controllers/students_list_controller.dart';

class StudentsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentsListController>(
      () => StudentsListController(),
    );
  }
}
