import 'package:college_app/app/modules/languages_type/controllers/languages_type_controller.dart';
import 'package:get/get.dart';

import '../controllers/student_setting_controller.dart';

class StudentSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentSettingController>(
      () => StudentSettingController(),
    );
    Get.lazyPut<LanguagesTypeController>(
      () => LanguagesTypeController(),
      fenix: true,
    );
  }
}
