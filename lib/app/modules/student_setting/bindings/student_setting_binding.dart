import 'package:get/get.dart';

import '../controllers/student_setting_controller.dart';

class StudentSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentSettingController>(
      () => StudentSettingController(),
    );
  }
}
