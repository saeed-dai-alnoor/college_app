import 'package:get/get.dart';

import '../controllers/management_home_controller.dart';

class ManagementHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagementHomeController>(
      () => ManagementHomeController(),
    );
  }
}
