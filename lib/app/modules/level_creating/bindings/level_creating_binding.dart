import 'package:get/get.dart';

import '../controllers/level_creating_controller.dart';

class LevelCreatingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LevelCreatingController>(
      () => LevelCreatingController(),
    );
  }
}
