import 'package:college_app/app/widgets/custom_textfield.dart';
import 'package:college_app/app/widgets/login_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/student_deleting_controller.dart';

class StudentDeletingView extends GetView<StudentDeletingController> {
  const StudentDeletingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00BB9F),
        title: Text('deleteStudent'.tr),
        centerTitle: true,
        toolbarHeight: 90.0,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          const SizedBox(height: 50.0),
          Form(
            key: controller.loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 12.0),
                CustomTextField(
                  prefixIcon: const Icon(Icons.school),
                  label: 'studentId',
                  controller: controller.idConrtoller,
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => controller.id = value!,
                  validator: (value) => controller.validateId(value!),
                ),
                const SizedBox(height: 40.0),
                LoginButton(
                  label: 'delete',
                  onPressed: () {},
                  buttonColor: const Color(0xff00BB9F),
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
