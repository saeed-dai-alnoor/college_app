import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/semester_type_controller.dart';

class SemesterTypeView extends GetView<SemesterTypeController> {
  const SemesterTypeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        color: CustomColors.primColor,
        border: Border.all(
          width: 1.5,
          color: Colors.teal,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: <Widget>[
          buildSemester(
              label: 'semester1', value: 'semester1', context: context),
          buildSemester(
              label: 'semester2', value: 'semester2', context: context)
        ],
      ),
    );
  }

  Widget buildSemester(
      {required String label,
      required String value,
      required BuildContext context}) {
    return SizedBox(
      height: 35.0,
      child: Obx(
        () => RadioListTile(
          contentPadding: const EdgeInsets.all(0),
          activeColor: Colors.white,
          title: CommonStyle.commonText(
            label: label,
            textAlign: TextAlign.start,
            size: 16.0,
          ),
          value: value,
          groupValue: controller.defaultSemester.value,
          onChanged: (String? val) {
            controller.defaultSemester.value = val!;
          },
        ),
      ),
    );
  }
}
