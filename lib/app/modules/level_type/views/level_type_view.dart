import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/level_type_controller.dart';

class LevelTypeView extends GetView<LevelTypeController> {
  const LevelTypeView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      alignment: Alignment.center,
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
          buildLevel(label: 'level1', value: 'level1', context: context),
          buildLevel(label: 'level2', value: 'level2', context: context),
          buildLevel(label: 'level3', value: 'level3', context: context),
          buildLevel(label: 'level4', value: 'level4', context: context),
          buildLevel(label: 'level5', value: 'level5', context: context),
        ],
      ),
    );
  }

  Widget buildLevel(
      {required String label,
      required String value,
      required BuildContext context}) {
    return SizedBox(
      height: 35.0,
      child: Obx(
        () => RadioListTile(
          activeColor: Colors.white,
          title: CommonStyle.commonText(
            label: label,
            textAlign: TextAlign.start,
            size: 17.0,
          ),
          value: value,
          groupValue: controller.defaultLevel.value,
          onChanged: (String? val) {
            controller.defaultLevel.value = val!;
          },
        ),
      ),
    );
  }
}
