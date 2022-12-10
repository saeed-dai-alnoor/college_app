import 'package:get/get.dart';

import '../controllers/lessons_tables_controller.dart';

class LessonsTablesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LessonsTablesController>(
      () => LessonsTablesController(),
    );
  }
}
