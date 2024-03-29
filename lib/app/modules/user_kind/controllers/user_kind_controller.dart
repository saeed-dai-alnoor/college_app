// ignore_for_file: unnecessary_overrides

import 'package:college_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserKindController extends GetxController {
  final getStorage = GetStorage();
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

  void student() {
    getStorage.write('id', 2);
    Get.toNamed(Routes.STUDENT_LOGIN);
  }

  void teacher() {
    getStorage.write('id', 3);
    Get.toNamed(Routes.TEACHER_LOGIN);
  }

  void management() {
    getStorage.write('id', 4);
    Get.toNamed(Routes.MANAGEMENT_LOGIN);
  }

  // void parents() {
  //   getStorage.write('id', 5);
  //   Get.toNamed(Routes.PARENTS_LOGIN);
  // }
}
