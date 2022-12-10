import 'package:get/get.dart';

import '../controllers/semester_type_controller.dart';

class SemesterTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SemesterTypeController>(
      () => SemesterTypeController(),
    );
  }
}
