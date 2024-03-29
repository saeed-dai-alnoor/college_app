import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/widgets/custom_textfield.dart';
import 'package:college_app/app/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../controllers/teacher_login_controller.dart';

class TeacherLoginView extends GetView<TeacherLoginController> {
  const TeacherLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LoadingOverlay(
        isLoading: controller.isLoading,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 10.0),
            CommonStyle.commonText(
              label: 'teacher',
              color: Colors.black,
            ),
            SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                width: 220.0,
                height: 200.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/png/teachLog.png'),
                  ),
                ),
              ),
            ),
            Form(
              key: controller.loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 12.0),
                  CustomTextField(
                    prefixIcon: const Icon(
                      Icons.phone,
                    ),
                    label: 'teacherPhone',
                    controller: controller.mobileConrtoller,
                    textInputAction: TextInputAction.next,
                    onSaved: (value) => controller.phone = value!,
                    validator: (value) => controller.validatePhone(value!),
                    onFieldSubmitted: (value) {
                      controller.onFieldSubmitted(value, context);
                    },
                  ),
                  const SizedBox(height: 22.0),
                  Obx(
                    () => CustomTextField(
                      obscureText: controller.obscureText.value,
                      focusNode: controller.passwordFocusNode,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () => controller.showPassword(),
                        icon: controller.obscureText.value
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_rounded),
                        color: Colors.blueGrey,
                      ),
                      label: 'password',
                      controller: controller.passwordConrtoller,
                      onSaved: (value) => controller.password = value!,
                      validator: (value) => controller.validatePassword(value!),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  LoginButton(
                    label: 'signIn',
                    buttonColor: const Color(0xff00BB9F),
                    textColor: Colors.white,
                    onPressed: () => controller.checkSignIn(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
