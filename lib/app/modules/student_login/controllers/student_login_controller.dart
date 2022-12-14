// ignore_for_file: unnecessary_overrides, prefer_typing_uninitialized_variables
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
  
  RxBool isLoad = false.obs;
  bool get isLoading => isLoad.value;
  
  var id = '';
  var phone = '';
  final getStorage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    idConrtoller = TextEditingController();
    mobileConrtoller = TextEditingController();
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

  void checkSignIn() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    } else {
      // loginApi();
      CommonMethods.loginApi(
        firstApiField: 'student_id',
        secondApiField: 'phone',
        firstFlutterField: idConrtoller.text.trim(),
        secondFlutterField: mobileConrtoller.text.trim(),
        idStorage: 6,
        urlPath: '/students/login',
        isLoad: isLoad,
        newRouteName: Routes.STUDENT_HOME,
      );
    }
    loginFormKey.currentState!.save();
  }
}
