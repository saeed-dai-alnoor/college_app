import 'package:college_app/app/widgets/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentDeletingController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController idConrtoller;
  var id = '';

  @override
  void onInit() {
    super.onInit();
    idConrtoller = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    idConrtoller.dispose();
  }
   var validateId = CommonMethods.validateId;
}
