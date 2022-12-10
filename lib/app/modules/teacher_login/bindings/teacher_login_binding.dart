import 'package:college_app/app/modules/languages_type/controllers/languages_type_controller.dart';
import 'package:college_app/app/modules/level_type/controllers/level_type_controller.dart';
import 'package:college_app/app/modules/semester_type/controllers/semester_type_controller.dart';
import 'package:get/get.dart';

import '../controllers/teacher_login_controller.dart';

class TeacherLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherLoginController>(
      () => TeacherLoginController(),
    );
    Get.lazyPut<LanguagesTypeController>(() => LanguagesTypeController(),
        fenix: true);
    Get.lazyPut<LevelTypeController>(() => LevelTypeController(), fenix: true);
    Get.lazyPut<SemesterTypeController>(() => SemesterTypeController(),
        fenix: true);
  }
}
