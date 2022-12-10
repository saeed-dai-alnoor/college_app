import 'package:college_app/app/widgets/custom_textfield.dart';
import 'package:college_app/app/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../controllers/student_login_controller.dart';

class StudentLoginView extends GetView<StudentLoginController> {
  const StudentLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: LoadingOverlay(
          isLoading: controller.isLoading,
          child: ListView(
            children: <Widget>[
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  width: 220.0,
                  height: 220.0,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/png/stLog.png'),
                  )),
                ),
              ),
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
                      onFieldSubmitted: (value) {
                        controller.onFieldSubmitted(value, context);
                      },
                    ),
                    const SizedBox(height: 22.0),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.phone),
                      label: 'studentPhone',
                      controller: controller.mobileConrtoller,
                      focusNode: controller.phoneFocusNode,
                      textInputAction: TextInputAction.go,
                      onSaved: (value) => controller.phone = value!,
                      validator: (value) => controller.validatePhone(value!),
                    ),
                    const SizedBox(height: 20.0),
                    LoginButton(
                      label: 'signIn',
                      onPressed: () => controller.checkSignIn(),
                      buttonColor: const Color(0xff00BB9F),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
