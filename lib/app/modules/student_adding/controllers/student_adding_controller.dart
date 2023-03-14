import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:college_app/app/data/providers/student_adding_provider.dart';
import 'package:college_app/app/routes/app_pages.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentAddingController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController idConrtoller;
  late TextEditingController nameController;
  late TextEditingController mobileConrtoller;
  var id = '';
  var name = '';
  var phone = '';
  var level = ''.obs;

  final List<String> levelItems = [
    'level1',
    'level2',
    'level3',
    'level4',
    'level5',
  ];

  String? selectedValue;

  @override
  void onInit() {
    super.onInit();
    idConrtoller = TextEditingController();
    nameController = TextEditingController();
    mobileConrtoller = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    idConrtoller.dispose();
    nameController.dispose();
    mobileConrtoller.dispose();
  }

  var validateId = CommonMethods.validateId;
  var validatePhone = CommonMethods.validatePhone;

  void checkAdding(BuildContext context) async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    } else {
      String? levelNumber;
      if (level.value == 'level1') {
        levelNumber = '1';
      } else if (level.value == 'level2') {
        levelNumber = '2';
      } else if (level.value == 'level3') {
        levelNumber = '3';
      } else if (level.value == 'level4') {
        levelNumber = '4';
      } else {
        levelNumber = '5';
      }
      await StudentAddingProvider.addStudent(
        studentId: idConrtoller.text,
        name: nameController.text,
        phone: mobileConrtoller.text,
        level: levelNumber,
      );
      AwesomeDialog(
        context: context,
        animType: AnimType.leftSlide,
        headerAnimationLoop: false,
        dialogType: DialogType.success,
        showCloseIcon: true,
        title: 'Succes',
        desc:
            'Dialog description here..................................................',
        btnOkOnPress: () {
          Get.offNamedUntil(
            Routes.STUDENT_ADDING,
            ModalRoute.withName(Routes.STUDENT_SETTING),
          );
        },
        btnOkIcon: Icons.check_circle,
        onDismissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        },
      ).show();
    }
    loginFormKey.currentState!.save();
  }
}
