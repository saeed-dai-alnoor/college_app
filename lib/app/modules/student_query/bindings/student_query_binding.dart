import 'package:college_app/app/modules/level_type/controllers/level_type_controller.dart';
import 'package:get/get.dart';

import '../controllers/student_query_controller.dart';

class StudentQueryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentQueryController>(
      () => StudentQueryController(),
    );
    Get.lazyPut<LevelTypeController>(() => LevelTypeController(), fenix: true);
  }
}
