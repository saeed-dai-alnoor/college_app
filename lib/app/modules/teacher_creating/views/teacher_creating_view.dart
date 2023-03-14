import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/widgets/custom_textfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/teacher_creating_controller.dart';

class TeacherCreatingView extends GetView<TeacherCreatingController> {
  const TeacherCreatingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.0,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(
          builder: (context) => Obx(
            () => LoadingOverlay(
              isLoading: controller.isLoading.value,
              child: Form(
                key: controller.creatingTeacherFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ListView(
                  children: <Widget>[
                    CustomTextField(
                      prefixIcon: const Icon(Icons.numbers_outlined),
                      label: 'teacherId',
                      controller: controller.teacherIdConrtoller,
                      textInputAction: TextInputAction.next,
                      onSaved: (value) => controller.teacherId = value!,
                      validator: (value) => controller.validateLevelId(value!),
                    ),
                    const SizedBox(height: 7.0),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.school),
                      label: 'teacherName',
                      controller: controller.teacherNameController,
                      textInputAction: TextInputAction.next,
                      onSaved: (value) => controller.teacherName = value!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 7.0),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.phone),
                      label: 'phone',
                      controller: controller.phoneController,
                      textInputAction: TextInputAction.next,
                      onSaved: (value) => controller.phone = value!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the phone number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 7.0),
                    CustomTextField(
                      prefixIcon: const Icon(Icons.visibility_rounded),
                      label: 'password',
                      controller: controller.passwordController,
                      textInputAction: TextInputAction.next,
                      onSaved: (value) => controller.password = value!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the password';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 7.0),
                    Container(
                      height: 50.0,
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.fromSwatch().copyWith(
                            primary: const Color(0xFFDCDCDC),
                          ),
                        ),
                        child: Obx(
                          () => DropdownButtonFormField2(
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            isExpanded: true,
                            hint: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                const Icon(
                                  Icons.vertical_shades_closed_outlined,
                                  color: Colors.black45,
                                  size: 15,
                                ),
                                const SizedBox(width: 10.0),
                                CommonStyle.commonText(
                                  label: 'admin',
                                  color: Colors.black,
                                  size: 18.0,
                                ),
                              ],
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 60,
                            buttonPadding:
                                const EdgeInsets.only(left: 10, right: 0),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            items: controller.adminOptions
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: CommonStyle.commonText(
                                      label: item,
                                      color: Colors.black,
                                      size: 15.0,
                                    ),
                                  ),
                                )
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select the admin option';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              // Do something when changing the item if you want.

                              controller.isAdmin.value = value.toString();
                            },
                            onSaved: (value) {
                              controller.selectedValue = value.toString();
                            },
                          ),
                        ),
                      ),
                    ),
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
