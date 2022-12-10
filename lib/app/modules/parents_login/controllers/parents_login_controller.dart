// ignore_for_file: unnecessary_overrides

import 'package:college_app/app/widgets/common_methods.dart';
import 'package:college_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ParentsLoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController idConrtoller;
  final getStorage = GetStorage();
  var id = '';
  @override
  void onInit() {
    super.onInit();
    idConrtoller = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    idConrtoller.dispose();
  }

  var validateId = CommonMethods.validateId;

  void checkEnquiry() {
    if (!loginFormKey.currentState!.validate()) {
      return;
    } else {
      getStorage.write('id', 9);
      Get.offAllNamed(Routes.PARENTS_HOME);
    }
    loginFormKey.currentState!.save();
  }
}
