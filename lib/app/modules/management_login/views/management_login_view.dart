import 'package:college_app/app/core/themes/common_style.dart';
import 'package:flutter/material.dart';
import 'package:college_app/app/widgets/custom_textfield.dart';
import 'package:college_app/app/widgets/login_button.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../controllers/management_login_controller.dart';

class ManagementLoginView extends GetView<ManagementLoginController> {
  const ManagementLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: LoadingOverlay(
          isLoading: controller.isLoading.value,
          child: ListView(
            children: <Widget>[
              CommonStyle.commonText(
                label: 'management',
                color: Colors.black,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12.0),
                width: 230.0,
                height: 230.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/png/management.png')),
                ),
              ),
              const SizedBox(height: 16),
              Form(
                key: controller.loginFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                        validator: (value) =>
                            controller.validatePassword(value!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: TextButton(
                        onPressed: () {},
                        child: CommonStyle.commonText(
                          label: 'forget',
                          color: const Color(0xff707070),
                          size: 14.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Center(
                      child: LoginButton(
                        label: 'signIn',
                        buttonColor: const Color(0xff00BB9F),
                        textColor: Colors.white,
                        onPressed: () => controller.login(),
                      ),
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
