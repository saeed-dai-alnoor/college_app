// ignore_for_file: unnecessary_overrides

import 'package:college_app/app/widgets/common_methods.dart';
import 'package:college_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ManagementLoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController mobileConrtoller;
  late TextEditingController passwordConrtoller;
  late FocusNode phoneFocusNode;
  late FocusNode passwordFocusNode;

  var phone = '';
  var password = '';
  var obscureText = true.obs;

  final getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    mobileConrtoller = TextEditingController();
    passwordConrtoller = TextEditingController();
    phoneFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    mobileConrtoller.dispose();
    passwordConrtoller.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  var validatePhone = CommonMethods.validatePhone;

  var validatePassword = CommonMethods.validatePassword;

  void showPassword() {
    obscureText.value = !obscureText.value;
  }

  void onFieldSubmitted(String value, BuildContext context) {
    FocusScope.of(context).requestFocus(passwordFocusNode);
  }

  void checkSignIn() {
    if (!loginFormKey.currentState!.validate()) {
      return;
    } else {
      getStorage.write('id', 8);
      Get.offAllNamed(Routes.MANAGEMENT_HOME);
    }
    loginFormKey.currentState!.save();
  }
}
