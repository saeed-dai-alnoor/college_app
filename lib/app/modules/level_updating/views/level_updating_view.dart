import 'package:college_app/app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/level_updating_controller.dart';

class LevelUpdatingView extends GetView<LevelUpdatingController> {
  const LevelUpdatingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(
          builder: (context) => Obx(
            () => LoadingOverlay(
              isLoading: controller.isLoading.value,
              child: Form(
                key: controller.updatingLevelFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ListView(
                  children: <Widget>[
                    CustomTextField(
                      prefixIcon: const Icon(Icons.numbers_outlined),
                      label: 'semester',
                      controller: controller.levelIdConrtoller,
                      textInputAction: TextInputAction.next,
                      onSaved: (value) => controller.levelId = value!,
                      validator: (value) => controller.validateLevelId(value!),
                    ),
                    const SizedBox(height: 12.0),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.school),
                      label: 'levelName',
                      controller: controller.levelNameController,
                      textInputAction: TextInputAction.go,
                      onSaved: (value) => controller.levelName = value!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                    ),
                    // const SizedBox(height: 35.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
