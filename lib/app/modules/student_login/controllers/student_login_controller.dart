// ignore_for_file: unnecessary_overrides, prefer_typing_uninitialized_variables
import 'dart:convert' as convert;

import 'package:college_app/app/controllers/auth_controller.dart';
import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/data/providers/student_provider.dart';
import 'package:college_app/app/routes/app_pages.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StudentLoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController idConrtoller;
  late TextEditingController mobileConrtoller;
  late FocusNode phoneFocusNode;
  final AuthController authController = Get.find<AuthController>();
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  var id = '';
  var phone = '';
  final getStorage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    idConrtoller = TextEditingController();
    mobileConrtoller = TextEditingController();
    idConrtoller.text = '4';
    mobileConrtoller.text = '0927824940';
    phoneFocusNode = FocusNode();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    idConrtoller.dispose();
    mobileConrtoller.dispose();
    phoneFocusNode.dispose();
  }

  var validateId = CommonMethods.validateId;

  var validatePhone = CommonMethods.validatePhone;

  void onFieldSubmitted(String value, BuildContext context) {
    FocusScope.of(context).requestFocus(phoneFocusNode);
  }

  loginApi() async {
    _isLoading.value = true;
    var data = {
      'student_id': idConrtoller.text.trim(),
      'phone': mobileConrtoller.text.trim(),
    };
    var response =
        await StudentProvider().postStudentData(data, '/student-login');
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    // if (_networkController.connectionStatus.value == 0) {
    //   Get.snackbar('Network Problem', 'No Internet Connection');
    // }
    if (jsonResponse['status'] == 'true') {
      _isLoading.value = false;
      getStorage.write('id', 6);
      Get.offAllNamed(Routes.STUDENT_HOME,
          arguments: jsonResponse['result'][0]['name']);
    } else {
      _isLoading.value = false;
      Get.defaultDialog(
        title: 'Error',
        content: Text("${jsonResponse['result']}"),
        barrierDismissible: true,
        textCancel: 'Try Again',
        cancelTextColor: Colors.black,
        buttonColor: CustomColors.primColor,
      );
    }
  }

  void checkSignIn() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    } else {
      loginApi();
    }
    loginFormKey.currentState!.save();
  }
}
