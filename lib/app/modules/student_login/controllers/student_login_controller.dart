// ignore_for_file: unnecessary_overrides, prefer_typing_uninitialized_variables, invalid_use_of_protected_member
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
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  var id = '';
  var phone = '';
  var studentName = ''.obs;
  String? name;
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
          getStorage.write('id', 6);
          getStorage.write('level', l!.levelId);
          getStorage.write('studentId', l.studentId);
          getStorage.write('studentName', l.name);
          name = l.name;
          Get.offAllNamed(Routes.STUDENT_HOME);
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
