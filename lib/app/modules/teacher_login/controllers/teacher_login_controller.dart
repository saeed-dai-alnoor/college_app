// ignore_for_file: unnecessary_overrides
import 'dart:convert' as convert;

import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/data/providers/student_provider.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:college_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TeacherLoginController extends GetxController {
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

  loginApi() async {
    _isLoading.value = true;
    var data = {
      'phone': mobileConrtoller.text.trim(),
      'password': passwordConrtoller.text.trim(),
    };
    var response =
        await StudentProvider().postStudentData(data, '/teachers/login');
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    if (jsonResponse['success'] == 1) {
      _isLoading.value = false;
      getStorage.write('id', 7);
      // print(jsonResponse['message']);
      // print(jsonResponse['token']);
      Get.offAllNamed(Routes.TEACHER_HOME,
          arguments: jsonResponse['data']['name']);
    } else {
      _isLoading.value = false;
      Get.defaultDialog(
        title: 'Error',
        content: Text("${jsonResponse['data']}"),
        barrierDismissible: true,
        textCancel: 'Try Again',
        cancelTextColor: Colors.black,
        buttonColor: CustomColors.primColor,
      );
    }
  }

  void checkSignIn() {
    if (!loginFormKey.currentState!.validate()) {
      return;
    } else {
      loginApi();
    }
    loginFormKey.currentState!.save();
  }
}
