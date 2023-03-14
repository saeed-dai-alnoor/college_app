import 'package:get/get.dart';

import '../controllers/level_updating_controller.dart';

class LevelUpdatingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LevelUpdatingController>(
      () => LevelUpdatingController(),
    );
  }
}
