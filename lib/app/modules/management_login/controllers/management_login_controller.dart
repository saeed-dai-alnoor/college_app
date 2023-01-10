// ignore_for_file: unnecessary_overrides

import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/data/providers/manager_provider.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:college_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ManagementLoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController mobileConrtoller;
  late TextEditingController passwordConrtoller;
  late FocusNode passwordFocusNode;
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  var phone = '';
  var password = '';
  var obscureText = true.obs;

  final getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    mobileConrtoller = TextEditingController();
    passwordConrtoller = TextEditingController();
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

  void checkSignIn() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    } else {
      _isLoading(true);
      final result = await ManagerProvider.loginManager(
        phone: mobileConrtoller.text,
        password: passwordConrtoller.text,
      );
      _isLoading(false);
      result.fold(
        (l) {
          getStorage.write('id', 8);
          Get.offAllNamed(Routes.MANAGEMENT_HOME, arguments: l!.name);
        },
        (r) => Get.defaultDialog(
            title: 'error'.tr,
            content: Text('$r'),
            textCancel: 'try'.tr,
            cancelTextColor: Colors.black,
            buttonColor: CustomColors.primColor),
      );
    }
    loginFormKey.currentState!.save();
  }
}
