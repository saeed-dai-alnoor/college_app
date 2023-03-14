import 'package:college_app/app/core/themes/common_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:college_app/app/widgets/custom_textfield.dart';
import 'package:college_app/app/widgets/login_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/student_adding_controller.dart';

class StudentAddingView extends GetView<StudentAddingController> {
  const StudentAddingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00BB9F),
        title: Text('addStudent'.tr),
        centerTitle: true,
        toolbarHeight: 90.0,
      ),
      resizeToAvoidBottomInset: false,
      body: 
      ListView(
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
                const SizedBox(height: 22.0),
                CustomTextField(
                  prefixIcon: const Icon(Icons.person),
                  label: 'name',
                  controller: controller.nameController,
                  textInputAction: TextInputAction.go,
                  onSaved: (value) => controller.name = value!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 22.0),
                CustomTextField(
                  prefixIcon: const Icon(Icons.phone),
                  label: 'studentPhone',
                  controller: controller.mobileConrtoller,
                  textInputAction: TextInputAction.go,
                  onSaved: (value) => controller.phone = value!,
                  validator: (value) => controller.validatePhone(value!),
                ),
                const SizedBox(height: 22.0),
                Container(
                  height: 50.0,
                  margin: const EdgeInsets.symmetric(horizontal: 40.0),
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
                            ),
                            const SizedBox(width: 10.0),
                            CommonStyle.commonText(
                              label: 'level',
                              color: Colors.black,
                              size: 21.0,
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
                        items: controller.levelItems
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
                            return 'Please select the level';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          // Do something when changing the item if you want.

                          controller.level.value = value.toString();
                        },
                        onSaved: (value) {
                          controller.selectedValue = value.toString();
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                LoginButton(
                  label: 'add',
                  onPressed: () => controller.checkAdding(context),
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
