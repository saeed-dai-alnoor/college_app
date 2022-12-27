import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/modules/languages_type/views/languages_type_view.dart';
import 'package:college_app/app/modules/level_type/views/level_type_view.dart';
import 'package:college_app/app/modules/semester_type/views/semester_type_view.dart';
import 'package:college_app/app/routes/app_pages.dart';
import 'package:college_app/app/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonMethods {
  static void levelCustomDailog({required bool studentsList}) {
    Get.defaultDialog(
        title: 'chooseLevel'.tr,
        titleStyle: const TextStyle(
          color: CustomColors.primColor,
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
        content: const LevelTypeView(),
        onConfirm: () {
          studentsList
              ? Get.offNamedUntil(
                  Routes.STUDENTS_LIST,
                  ModalRoute.withName(Routes.TEACHER_HOME),
                )
              : Get.offNamedUntil(
                  Routes.ADVERTISEMENT,
                  ModalRoute.withName(Routes.TEACHER_HOME),
                );
        },
        buttonColor: CustomColors.primColor,
        textConfirm: 'ok'.tr,
        confirmTextColor: Colors.white,
        textCancel: 'cancel'.tr,
        cancelTextColor: CustomColors.primColor);
  }

  static void semesterCustomDailog({required bool studentSubjects}) {
    Get.defaultDialog(
        title: 'chooseSemester'.tr,
        titleStyle: const TextStyle(
          color: CustomColors.primColor,
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
        content: const SemesterTypeView(),
        onConfirm: () {
          studentSubjects
              ? Get.offNamedUntil(
                  Routes.SUBJECTS,
                  ModalRoute.withName(Routes.STUDENT_HOME),
                )
              : Get.offNamedUntil(
                  Routes.LESSONS_TABLES,
                  ModalRoute.withName(Routes.STUDENT_HOME),
                );
        },
        buttonColor: CustomColors.primColor,
        textConfirm: 'ok'.tr,
        confirmTextColor: Colors.white,
        textCancel: 'cancel'.tr,
        cancelTextColor: CustomColors.primColor);
  }

  static void levelAndSemsCustomDailog({required bool subjects}) {
    Get.defaultDialog(
        title: 'chooselevAndSems'.tr,
        titleStyle: const TextStyle(
          color: CustomColors.primColor,
          fontWeight: FontWeight.bold,
          fontSize: 17.0,
        ),
        content: Column(
          children: const <Widget>[
            LevelTypeView(),
            SizedBox(height: 8.0),
            SemesterTypeView(),
          ],
        ),
        onConfirm: () {
          subjects
              ? Get.offNamedUntil(
                  Routes.SUBJECTS,
                  ModalRoute.withName(Routes.TEACHER_HOME),
                )
              : Get.offNamedUntil(
                  Routes.LESSONS_TABLES,
                  ModalRoute.withName(Routes.TEACHER_HOME),
                );
        },
        buttonColor: CustomColors.primColor,
        textConfirm: 'ok'.tr,
        confirmTextColor: Colors.white,
        textCancel: 'cancel'.tr,
        cancelTextColor: CustomColors.primColor);
  }

  static void languageCustomDailog() {
    Get.defaultDialog(
      title: '',
      content: LanguagesTypeView(),
      onConfirm: () => Get.back(),
      buttonColor: const Color(0xff00A951),
      textConfirm: 'ok'.tr,
      confirmTextColor: Colors.white,
      barrierDismissible: false,
    );
  }

  static String? validatePhone(String value) {
    // For Start the Number
    if (value.length == 1 && value[0] != '0') {
      return 'startNumber'.tr;
    }
    // validate for Network spatialize Sudani Card
    else if (value.length == 2 &&
        value[1] != '9' &&
        value.length == 2 &&
        value[1] != '1') {
      return 'secondNumber'.tr;
    }
    // appear when field is empty
    else if (!GetUtils.isNumericOnly(value) || value[0] != '0') {
      return 'emptyNumber'.tr;
    }
    // validate for Zain and MTN Sudan number
    else if (value.length == 3 &&
        value[1] == '9' &&
        value[2] != '1' &&
        value.length == 3 &&
        value[1] == '9' &&
        value[2] != '0' &&
        value.length == 3 &&
        value[1] == '9' &&
        value[2] != '6' &&
        value.length == 3 &&
        value[1] == '9' &&
        value[2] != '2' &&
        value.length == 3 &&
        value[1] == '9' &&
        value[2] != '9') {
      return 'validatePhoneMessage'.tr;
    }
    // For the isPhoneNumber Germanally until 8 and to 10 decimal
    else if (!GetUtils.isPhoneNumber(value) ||
        value.length == 9 ||
        value.length > 10) {
      return 'perfectNumber'.tr;
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (value.length < 6) {
      return 'validatePasswordMessage'.tr;
    }
    return null;
  }

  static String? validateId(String value) {
    if (!GetUtils.isNumericOnly(value)) {
      return 'validateIdMessage'.tr;
    }
    return null;
  }

  static void moneyCustomDailog() {
    Get.defaultDialog(
      title: 'tuitionPayments'.tr,
      titleStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
      ),
      content: Container(
        height: 200.0,
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: Colors.teal,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40.0),
            SizedBox(
              width: 150,
              child: LoginButton(
                onPressed: () {},
                label: 'private',
                buttonColor: const Color(0xff00BB9F),
                textColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 150.0,
              child: LoginButton(
                onPressed: () {},
                label: 'public',
                buttonColor: const Color(0xff00BB9F),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
      onConfirm: () {},
      buttonColor: const Color(0xff00BB9F),
      textConfirm: 'ok'.tr,
      confirmTextColor: Colors.white,
      textCancel: 'cancel'.tr,
      cancelTextColor: const Color(0xff00BB9F),
    );
  }
}
