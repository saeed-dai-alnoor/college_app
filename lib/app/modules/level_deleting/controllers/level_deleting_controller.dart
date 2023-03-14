import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:college_app/app/data/providers/level_provider/level_provider.dart';
import 'package:college_app/app/routes/app_pages.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LevelDeletingController extends GetxController {
  final GlobalKey<FormState> deletingLevelFormKey = GlobalKey<FormState>();
  late TextEditingController levelIdConrtoller;
  var levelId = '';
  var validateLevelId = CommonMethods.validateId;
  // For loading...
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    CommonMethods.getConnectionType();
    levelIdConrtoller = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    levelIdConrtoller.dispose();
  }

// For check deleting
  void checkLevelDeleting(BuildContext context) async {
    CommonMethods.getConnectionType();
    if (!deletingLevelFormKey.currentState!.validate()) {
      return;
    } else if (CommonMethods.connectionType == 0) {
      CommonMethods.showNoInternetDailog();
    } else {
      isLoading.value = true;
      final result = await LevelProvider().deleteLevel(
        levelId: levelIdConrtoller.text.trim(),
      );
      isLoading.value = false;
      result.fold((l) {
        if (l == 1) {
          Get.close(0);
          levelIdConrtoller.clear();
          AwesomeDialog(
            context: context,
            animType: AnimType.topSlide,
            headerAnimationLoop: false,
            dialogType: DialogType.success,
            showCloseIcon: true,
            title: 'Succes',
            desc: 'messageForDeleting'.tr,
            btnOkOnPress: () {
              Get.offNamed(Routes.LEVELS_GETTING, preventDuplicates: false);
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
      deletingLevelFormKey.currentState!.save();
    }
  }
}
