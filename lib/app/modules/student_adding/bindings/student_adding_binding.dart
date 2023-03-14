import 'package:college_app/app/modules/languages_type/controllers/languages_type_controller.dart';
import 'package:get/get.dart';

import '../controllers/student_adding_controller.dart';

class StudentAddingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentAddingController>(
      () => StudentAddingController(),
    );
    Get.lazyPut<LanguagesTypeController>(() => LanguagesTypeController(),
        fenix: true);
  }
}
