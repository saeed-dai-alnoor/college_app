import 'package:college_app/app/modules/languages_type/controllers/languages_type_controller.dart';
import 'package:get/get.dart';

import '../controllers/student_login_controller.dart';

class StudentLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentLoginController>(
      () => StudentLoginController(),
    );
    Get.lazyPut<LanguagesTypeController>(() => LanguagesTypeController(),
        fenix: true);
  }
}
