import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/modules/languages_type/views/languages_type_view.dart';
import 'package:college_app/app/modules/level_creating/controllers/level_creating_controller.dart';
import 'package:college_app/app/modules/level_creating/views/level_creating_view.dart';
import 'package:college_app/app/modules/level_deleting/controllers/level_deleting_controller.dart';
import 'package:college_app/app/modules/level_deleting/views/level_deleting_view.dart';
import 'package:college_app/app/modules/level_type/views/level_type_view.dart';
import 'package:college_app/app/modules/level_updating/controllers/level_updating_controller.dart';
import 'package:college_app/app/modules/level_updating/views/level_updating_view.dart';
import 'package:college_app/app/modules/semester_type/views/semester_type_view.dart';
import 'package:college_app/app/modules/teacher_creating/controllers/teacher_creating_controller.dart';
import 'package:college_app/app/modules/teacher_creating/views/teacher_creating_view.dart';
import 'package:college_app/app/modules/teacher_deleting/controllers/teacher_deleting_controller.dart';
import 'package:college_app/app/modules/teacher_deleting/views/teacher_deleting_view.dart';
import 'package:college_app/app/modules/teacher_updating/controllers/teacher_updating_controller.dart';
import 'package:college_app/app/modules/teacher_updating/views/teacher_updating_view.dart';
import 'package:college_app/app/routes/app_pages.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CommonMethods {
// **  For show level dialog
  static void levelCustomDailog(
      {required bool studentsList, required bool manager}) {
    Get.defaultDialog(
        title: 'chooseLevel'.tr,
        titleStyle: const TextStyle(
          color: CustomColors.primColor,
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
        content: const LevelTypeView(),
        onConfirm: () {
          if (manager) {
            Get.offNamedUntil(
              Routes.STUDENTS_LIST,
              ModalRoute.withName(Routes.MANAGEMENT_HOME),
            );
          } else {
            studentsList
                ? Get.offNamedUntil(
                    Routes.STUDENTS_LIST,
                    ModalRoute.withName(Routes.TEACHER_HOME),
                  )
                : Get.offNamedUntil(
                    Routes.ADVERTISEMENT,
                    ModalRoute.withName(Routes.TEACHER_HOME),
                  );
          }
        },
        buttonColor: CustomColors.primColor,
        textConfirm: 'ok'.tr,
        confirmTextColor: Colors.white,
        textCancel: 'cancel'.tr,
        cancelTextColor: CustomColors.primColor);
  }

// ** For show semester dialog
  static void semesterCustomDailog(
      {required bool studentSubjects, required bool manager}) {
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

// ** For show level & semester dialog
  static void levelAndSemsCustomDailog(
      {required bool subjects, required bool manager}) {
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
          if (manager && subjects) {
            Get.offNamedUntil(
              Routes.SUBJECTS,
              ModalRoute.withName(Routes.MANAGEMENT_HOME),
            );
          } else if (manager && !subjects) {
            Get.offNamedUntil(
              Routes.LESSONS_TABLES,
              ModalRoute.withName(Routes.MANAGEMENT_HOME),
            );
          } else {
            subjects
                ? Get.offNamedUntil(
                    Routes.SUBJECTS,
                    ModalRoute.withName(Routes.TEACHER_HOME),
                  )
                : Get.offNamedUntil(
                    Routes.LESSONS_TABLES,
                    ModalRoute.withName(Routes.TEACHER_HOME),
                  );
          }
        },
        buttonColor: CustomColors.primColor,
        textConfirm: 'ok'.tr,
        confirmTextColor: Colors.white,
        textCancel: 'cancel'.tr,
        cancelTextColor: CustomColors.primColor);
  }

// ** For show language dialog
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

// ** For validate Number dialog
  static String? validatePhone(String value) {
    // ** For Start the Number
    if (value.length == 1 && value[0] != '0') {
      return 'startNumber'.tr;
    }

    // ** validate for Network spatialize Sudani Card
    else if (value.length == 2 &&
        value[1] != '9' &&
        value.length == 2 &&
        value[1] != '1') {
      return 'secondNumber'.tr;
    }
    // ** appear when field is empty
    else if (!GetUtils.isNumericOnly(value) || value[0] != '0') {
      return 'emptyNumber'.tr;
    }
    // ** validate for Zain and MTN Sudan number
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
    // ** For the isPhoneNumber Germanally until 8 and to 10 decimal
    else if (!GetUtils.isPhoneNumber(value) ||
        value.length == 9 ||
        value.length > 10) {
      return 'perfectNumber'.tr;
    } else {
      return null;
    }
  }

// ** For validate password
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

// ** methods for check kind & update  & show error of connection for level **//
  static int connectionType = 0; // for check connection
  // check kind connection
  static Future<void> getConnectionType() async {
    final Connectivity connectivity = Connectivity();
    ConnectivityResult? connectivityResult;
    try {
      connectivityResult = await (connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      Get.snackbar('Network', '${e.message}');
    }
    return updateState(connectivityResult!);
  }

// update connection
  static updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType = 1;
        break;
      case ConnectivityResult.mobile:
        connectionType = 2;
        break;
      case ConnectivityResult.none:
        connectionType = 0;
        break;
      default:
        Get.snackbar('Network', 'Faild to get Network Status');
    }
  }

  // show dialog when no internet
  static void showNoInternetDailog() {
    Get.defaultDialog(
        title: 'error'.tr,
        content: CommonStyle.commonText(
          label: 'messageForInternet',
          color: Colors.black,
          size: 16.0,
        ),
        textCancel: 'try'.tr,
        cancelTextColor: Colors.black,
        buttonColor: CustomColors.primColor);
  }

// ** method for create new level
  static void createLevel(BuildContext context) {
    final levelcreatingController = Get.find<LevelCreatingController>();
    Get.defaultDialog(
        title: 'addLevel'.tr,
        titleStyle: const TextStyle(
          color: CustomColors.primColor,
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
        content: const LevelCreatingView(),
        onConfirm: () => levelcreatingController.checkLevelCreating(context),
        buttonColor: CustomColors.primColor,
        textConfirm: 'ok'.tr,
        confirmTextColor: Colors.white,
        textCancel: 'cancel'.tr,
        cancelTextColor: CustomColors.primColor);
  }

  // ** method for delete level
  static void deleteLevel(BuildContext context) {
    final levelAddingController = Get.find<LevelDeletingController>();
    Get.defaultDialog(
        title: 'deleteLevel'.tr,
        titleStyle: const TextStyle(
          color: CustomColors.primColor,
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
        content: const LevelDeletingView(),
        onConfirm: () => levelAddingController.checkLevelDeleting(context),
        buttonColor: CustomColors.primColor,
        textConfirm: 'ok'.tr,
        confirmTextColor: Colors.white,
        textCancel: 'cancel'.tr,
        cancelTextColor: CustomColors.primColor);
  }

  // ** method for update level
  static void updateLevel(BuildContext context) {
    final levelUpdatingController = Get.find<LevelUpdatingController>();
    Get.defaultDialog(
        title: 'updateLevel'.tr,
        titleStyle: const TextStyle(
          color: CustomColors.primColor,
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
        content: const LevelUpdatingView(),
        onConfirm: () => levelUpdatingController.checkLevelUpdating(context),
        buttonColor: CustomColors.primColor,
        textConfirm: 'ok'.tr,
        confirmTextColor: Colors.white,
        textCancel: 'cancel'.tr,
        cancelTextColor: CustomColors.primColor);
  }

  // ** methods for creating &  update & deleting for teacher **//
  // create new teacher
  static void createTeacher(BuildContext context) {
    final teacherUpdatingController = Get.find<TeacherCreatingController>();
    Get.defaultDialog(
        title: 'addTeacher'.tr,
        titleStyle: const TextStyle(
          color: CustomColors.primColor,
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
        content: const TeacherCreatingView(),
        onConfirm: () =>
            teacherUpdatingController.checkTeacherCreating(context),
        buttonColor: CustomColors.primColor,
        textConfirm: 'ok'.tr,
        confirmTextColor: Colors.white,
        textCancel: 'cancel'.tr,
        cancelTextColor: CustomColors.primColor);
  }

  // create new teacher
  static void updateTeacher(BuildContext context) {
    final teacherUpdatingController = Get.find<TeacherUpdatingController>();
    Get.defaultDialog(
        title: 'updateTeacher'.tr,
        titleStyle: const TextStyle(
          color: CustomColors.primColor,
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
        content: const TeacherUpdatingView(),
        onConfirm: () =>
            teacherUpdatingController.checkTeacherUpdating(context),
        buttonColor: CustomColors.primColor,
        textConfirm: 'ok'.tr,
        confirmTextColor: Colors.white,
        textCancel: 'cancel'.tr,
        cancelTextColor: CustomColors.primColor);
  }

  // delete teacher
  static void deleteTeacher(BuildContext context) {
    final teacherDeletingController = Get.find<TeacherDeletingController>();
    Get.defaultDialog(
        title: 'deleteTeacher'.tr,
        titleStyle: const TextStyle(
          color: CustomColors.primColor,
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
        content: const TeacherDeletingView(),
        onConfirm: () =>
            teacherDeletingController.checkTeacherDeleting(context),
        buttonColor: CustomColors.primColor,
        textConfirm: 'ok'.tr,
        confirmTextColor: Colors.white,
        textCancel: 'cancel'.tr,
        cancelTextColor: CustomColors.primColor);
  }
}
