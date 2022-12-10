import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/modules/languages_type/controllers/languages_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonStyle {
  static Text commonText(
      {required String label,
      double? size,
      TextAlign? textAlign,
      Color? color}) {
    final controller = Get.find<LanguagesTypeController>();
    return Text(
      label.tr,
      textAlign: textAlign ?? TextAlign.center,
      softWrap: true,
      style: TextStyle(
        fontSize: size ?? 24.0,
        color: color ?? CustomColors.commonTextColor,
        fontWeight: FontWeight.bold,
          fontFamily: controller.defaultLang == 'ar'
              ? 'Amiri'
              : 'Philosopher',
      ),
    );
  }
}
