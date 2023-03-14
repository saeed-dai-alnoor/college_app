// ignore_for_file: unnecessary_overrides

import 'package:college_app/app/widgets/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagementHomeController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  var gridManagementCardDetiles = {
    'images': [
      'teachersTable',
      'studTable',
      'subjects',
      'editLevels',
      'lessonTable',
      'query',
    ],
    'titles': [
      'teachers',
      'students',
      'studentSubjects',
      'levels',
      'tables',
      'notfy',
    ],
  };

  @override
  void onInit() {
    super.onInit();
    CommonMethods.getConnectionType();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
