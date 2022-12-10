import 'package:college_app/app/modules/languages_type/controllers/languages_type_controller.dart';
import 'package:get/get.dart';

import '../controllers/parents_home_controller.dart';

class ParentsHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParentsHomeController>(
      () => ParentsHomeController(),
    );
    Get.lazyPut<LanguagesTypeController>(() => LanguagesTypeController(),
        fenix: true);
  }
}
