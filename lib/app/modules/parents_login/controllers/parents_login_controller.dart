// ignore_for_file: unnecessary_overrides

import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/data/providers/student_provider.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:college_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ParentsLoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController idConrtoller;
  late TextEditingController mobileConrtoller;
  late FocusNode phoneFocusNode;
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
      _isLoading(true);
      final result = await StudentProvider.loginStudent(
        studentId: idConrtoller.text,
        phone: mobileConrtoller.text,
      );
      _isLoading(false);
      result.fold(
        (l) {
          getStorage.write('id', 9);
          getStorage.write('level', l!.levelId);
          getStorage.write('studentId', l.studentId);
          Get.offAndToNamed(Routes.STUDENT_QUERY, arguments: l.name);
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
