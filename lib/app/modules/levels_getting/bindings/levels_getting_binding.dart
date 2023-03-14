import 'package:college_app/app/modules/level_creating/controllers/level_creating_controller.dart';
import 'package:college_app/app/modules/level_deleting/controllers/level_deleting_controller.dart';
import 'package:college_app/app/modules/level_updating/controllers/level_updating_controller.dart';
import 'package:get/get.dart';
import '../controllers/levels_getting_controller.dart';

class LevelsGettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LevelsGettingController>(
      () => LevelsGettingController(),
    );
    Get.lazyPut<LevelCreatingController>(
      () => LevelCreatingController(),
      fenix: true,
    );
    Get.lazyPut<LevelUpdatingController>(
      () => LevelUpdatingController(),
      fenix: true,
    );
    Get.lazyPut<LevelDeletingController>(
      () => LevelDeletingController(),
      fenix: true,
    );
  }
}
