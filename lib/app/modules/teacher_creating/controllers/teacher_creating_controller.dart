import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:college_app/app/data/providers/teacher_provider.dart';
import 'package:college_app/app/routes/app_pages.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherCreatingController extends GetxController {
  final GlobalKey<FormState> creatingTeacherFormKey = GlobalKey<FormState>();
  late TextEditingController teacherIdConrtoller;
  late TextEditingController teacherNameController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  var teacherId = '';
  var teacherName = '';
  var phone = '';
  var password = '';
  var validateLevelId = CommonMethods.validateId;
  var validatePhone = CommonMethods.validatePhone;
  var validatePassword = CommonMethods.validatePassword;
  RxBool isLoading = false.obs;
  final List<String> adminOptions = ['true', 'false'];
  var isAdmin = ''.obs;
  String? selectedValue;
  @override
  void onInit() {
    super.onInit();
    teacherIdConrtoller = TextEditingController();
    teacherNameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    teacherIdConrtoller.dispose();
    teacherNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  void checkTeacherCreating(BuildContext context) async {
    CommonMethods.getConnectionType();
    if (!creatingTeacherFormKey.currentState!.validate()) {
      return;
    } else if (CommonMethods.connectionType == 0) {
      CommonMethods.showNoInternetDailog();
    } else {
      isLoading.value = true;
      final result = await TeacherProvider().createTeacher(
        teacherId: teacherIdConrtoller.text.trim(),
        teacherName: teacherNameController.text.trim(),
        phone: phoneController.text.trim(),
        password: passwordController.text.trim(),
        isAdmin: isAdmin.value,
      );
      isLoading.value = false;
      result.fold((l) {
        if (l == 1) {
          Get.close(0);
          teacherIdConrtoller.clear();
          teacherNameController.clear();
          phoneController.clear();
          passwordController.clear();

          AwesomeDialog(
            context: context,
            animType: AnimType.topSlide,
            headerAnimationLoop: false,
            dialogType: DialogType.success,
            showCloseIcon: true,
            title: 'Succes',
            desc: 'messageForAdding'.tr,
            btnOkOnPress: () {
              Get.offNamed(Routes.TEACHERS_GETTING, preventDuplicates: false);
            },
            btnOkIcon: Icons.check_circle,
            onDismissCallback: (type) {
              debugPrint('Dialog Dissmiss from callback $type');
            },
          ).show();
        }
      },
          (r) => Get.snackbar(
                'error'.tr,
                r.toString(),
                backgroundColor: const Color(0xff00BB9F),
              ));
      creatingTeacherFormKey.currentState!.save();
    }
  }
}
