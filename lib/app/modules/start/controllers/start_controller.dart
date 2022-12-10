// ignore_for_file: unnecessary_overrides

import 'package:college_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class StartController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void start() {
    Get.close(0);
    Get.toNamed(Routes.ONBOARDING);
  }
}
