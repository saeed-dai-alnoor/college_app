import 'package:college_app/app/controllers/auth_controller.dart';
import 'package:college_app/app/modules/languages_type/controllers/languages_type_controller.dart';
import 'package:college_app/app/modules/semester_type/controllers/semester_type_controller.dart';
import 'package:college_app/app/modules/student_login/controllers/student_login_controller.dart';
import 'package:get/get.dart';

import '../controllers/student_home_controller.dart';

class StudentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentHomeController>(
      () => StudentHomeController(),
    );
    Get.lazyPut<LanguagesTypeController>(() => LanguagesTypeController(),
        fenix: true);
    Get.lazyPut<SemesterTypeController>(() => SemesterTypeController(),
        fenix: true);
    Get.lazyPut<StudentLoginController>(() => StudentLoginController(),
        fenix: true);
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
  }
}