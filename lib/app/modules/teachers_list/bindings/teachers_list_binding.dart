import 'package:get/get.dart';

import '../controllers/teachers_list_controller.dart';

class TeachersListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeachersListController>(
      () => TeachersListController(),
    );
  }
}
