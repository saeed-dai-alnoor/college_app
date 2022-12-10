import 'package:get/get.dart';

import '../controllers/subjects_controller.dart';

class SubjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectsController>(
      () => SubjectsController(),
    );
  }
}
