import 'package:get/get.dart';

import '../controllers/parents_login_controller.dart';

class ParentsLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParentsLoginController>(
      () => ParentsLoginController(),
    );
  }
}
