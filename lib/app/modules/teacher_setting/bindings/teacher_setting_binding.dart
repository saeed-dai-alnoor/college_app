import 'package:college_app/app/modules/languages_type/controllers/languages_type_controller.dart';
import 'package:get/get.dart';

import '../controllers/teacher_setting_controller.dart';

class TeacherSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherSettingController>(
      () => TeacherSettingController(),
    );
     Get.lazyPut<LanguagesTypeController>(
      () => LanguagesTypeController(),
      fenix: true,
    );
  }
}
