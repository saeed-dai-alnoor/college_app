import 'package:college_app/app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/teacher_deleting_controller.dart';

class TeacherDeletingView extends GetView<TeacherDeletingController> {
  const TeacherDeletingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(
          builder: (context) => Obx(
            () => LoadingOverlay(
              isLoading: controller.isLoading.value,
              child: Form(
                key: controller.deletingTeacherFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: CustomTextField(
                  prefixIcon: const Icon(Icons.numbers_outlined),
                  label: 'teacherId',
                  controller: controller.teacherIdConrtoller,
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => controller.teacherId = value!,
                  validator: (value) => controller.validateTeacherId(value!),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
