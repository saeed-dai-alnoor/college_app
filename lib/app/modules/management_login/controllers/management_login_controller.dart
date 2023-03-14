import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/data/providers/teacher_provider/teacher_provider.dart';
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
  RxBool isLoading = false.obs;
  var phone = '';
  var password = '';
  var obscureText = true.obs;
  final getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    CommonMethods.getConnectionType();
    mobileConrtoller = TextEditingController();
    passwordConrtoller = TextEditingController();
    mobileConrtoller.text = '0900000000';
    passwordConrtoller.text = '000000';
    passwordFocusNode = FocusNode();
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

  void login() async {
    CommonMethods.getConnectionType();
    if (!loginFormKey.currentState!.validate()) {
      return;
    } else if (CommonMethods.connectionType == 0) {
      CommonMethods.showNoInternetDailog();
    } else {
      isLoading.value = true;
      final result = await TeacherProvider().loginTeacher(
        phone: mobileConrtoller.text.trim(),
        password: passwordConrtoller.text.trim(),
      );
      isLoading.value = false;
      result.fold(
        (l) {
          getStorage.write('id', 8);
          // print(getStorage.read('teacherToken'));
          // print(l);
          Get.offAllNamed(Routes.MANAGEMENT_HOME);
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
