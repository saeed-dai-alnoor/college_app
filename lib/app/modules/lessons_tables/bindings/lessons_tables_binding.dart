import 'package:college_app/app/modules/level_type/controllers/level_type_controller.dart';
import 'package:get/get.dart';

import '../controllers/lessons_tables_controller.dart';

class LessonsTablesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LessonsTablesController>(
      () => LessonsTablesController(),
    );
    Get.lazyPut<LevelTypeController>(
      () => LevelTypeController(),
      fenix: true,
    );
  }
}
