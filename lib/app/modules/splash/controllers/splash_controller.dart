// ignore_for_file: unnecessary_overrides

import 'package:college_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final getStorge = GetStorage();
  @override
  void onInit() {
    super.onInit();
    // getStorge.erase();
  }

  @override
  void onReady() {
    super.onReady();
    initApp();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> initApp() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final storage = getStorge.read('id');

    switch (storage) {
      case 1:
        Get.offNamed(Routes.USER_KIND);
        break;
      case 2:
        Get.offNamed(Routes.STUDENT_LOGIN);
        break;
      case 3:
        Get.offNamed(Routes.TEACHER_LOGIN);
        break;
      case 4:
        Get.offNamed(Routes.MANAGEMENT_LOGIN);
        break;
      case 5:
        Get.offNamed(Routes.PARENTS_LOGIN);
        break;
      case 6:
        Get.offNamed(Routes.STUDENT_HOME);
        break;
      case 7:
        Get.offNamed(Routes.TEACHER_HOME);
        break;
      case 8:
        Get.offNamed(Routes.MANAGEMENT_HOME);
        break;
      case 9:
        // Get.offNamed(Routes.PARENTS_HOME);
        Get.offNamed(Routes.USER_KIND);
        break;

      default:
        Future.delayed(
          const Duration(milliseconds: 900),
          () => Get.offNamed(Routes.START),
        );
    }
  }
}
