import 'package:get/get.dart';

import '../controllers/level_type_controller.dart';

class LevelTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LevelTypeController>(
      () => LevelTypeController(),
    );
  }
}
