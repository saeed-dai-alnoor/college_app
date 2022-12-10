// ignore_for_file: unnecessary_overrides

import 'package:college_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  PageController pageController = PageController();
  var pageIndex = 0.obs;

  void onpageChanged(int value) {
    pageIndex.value = value;
  }

  final List<String> tabs = [
    'easy',
    'forTeacher',
    'forApp',
    'aboutUs',
  ];
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

  void onSkip() {
    getStorage.write('id', 1);
    Get.close(0);
    Get.toNamed(Routes.USER_KIND);
  }

  void onFinished() {
    Get.close(0);
    Get.toNamed(Routes.USER_KIND);
    getStorage.write('id', 1);
  }
}
