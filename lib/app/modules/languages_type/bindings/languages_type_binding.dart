import 'package:get/get.dart';

import '../controllers/languages_type_controller.dart';

class LanguagesTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguagesTypeController>(
      () => LanguagesTypeController(),
    );
  }
}
