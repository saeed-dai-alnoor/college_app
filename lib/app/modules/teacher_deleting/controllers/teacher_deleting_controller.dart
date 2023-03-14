import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:college_app/app/data/providers/teacher_provider.dart';
import 'package:college_app/app/routes/app_pages.dart';
// import 'package:college_app/app/data/providers/teacher_provider/teacher_provider.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherDeletingController extends GetxController {
  final GlobalKey<FormState> deletingTeacherFormKey = GlobalKey<FormState>();
  late TextEditingController teacherIdConrtoller;
  var teacherId = '';
  var validateTeacherId = CommonMethods.validateId;
  // For loading...
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    CommonMethods.getConnectionType();
    teacherIdConrtoller = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    teacherIdConrtoller.dispose();
  }

// For check deleting
  void checkTeacherDeleting(BuildContext context) async {
    CommonMethods.getConnectionType();
    if (!deletingTeacherFormKey.currentState!.validate()) {
      return;
    } else if (CommonMethods.connectionType == 0) {
      CommonMethods.showNoInternetDailog();
    } else {
      isLoading.value = true;
      final result = await TeacherProvider().deleteLevel(
        teacherId: teacherIdConrtoller.text.trim(),
      );
      isLoading.value = false;
      result.fold((l) {
        if (l == 1) {
          Get.close(0);
          teacherIdConrtoller.clear();
          AwesomeDialog(
            context: context,
            animType: AnimType.topSlide,
            headerAnimationLoop: false,
            dialogType: DialogType.success,
            showCloseIcon: true,
            title: 'Succes',
            desc: 'messageForDeleting'.tr,
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
      deletingTeacherFormKey.currentState!.save();
    }
  }
}
