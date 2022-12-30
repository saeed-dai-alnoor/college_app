import 'package:college_app/app/modules/languages_type/controllers/languages_type_controller.dart';
import 'package:get/get.dart';

import '../controllers/parents_login_controller.dart';

class ParentsLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParentsLoginController>(
      () => ParentsLoginController(),
    );
    Get.lazyPut<LanguagesTypeController>(() => LanguagesTypeController(),
        fenix: true);
  }
}
