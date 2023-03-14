import 'package:college_app/app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../controllers/level_deleting_controller.dart';

class LevelDeletingView extends GetView<LevelDeletingController> {
  const LevelDeletingView({Key? key}) : super(key: key);
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
                key: controller.deletingLevelFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: CustomTextField(
                  prefixIcon: const Icon(Icons.numbers_outlined),
                  label: 'semester',
                  controller: controller.levelIdConrtoller,
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => controller.levelId = value!,
                  validator: (value) => controller.validateLevelId(value!),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
