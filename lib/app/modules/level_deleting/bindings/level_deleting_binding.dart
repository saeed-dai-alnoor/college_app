import 'package:get/get.dart';

import '../controllers/level_deleting_controller.dart';

class LevelDeletingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LevelDeletingController>(
      () => LevelDeletingController(),
    );
  }
}
