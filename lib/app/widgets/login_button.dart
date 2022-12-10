import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/modules/languages_type/controllers/languages_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// ignore: must_be_immutable
class LoginButton extends StatelessWidget {
  LoginButton({
    Key? key,
    required this.onPressed,
    this.label,
    this.buttonColor,
    this.textColor,
  }) : super(key: key);
  String? label;
  VoidCallback? onPressed;
  Color? buttonColor;
  Color? textColor;
  final getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    final languageController = Get.find<LanguagesTypeController>();
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(buttonColor ?? const Color(0xff6B6C84)),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: languageController.defaultLang == 'ar' ? 7 : 12.0,
          ),
        ),
      ),
      onPressed: onPressed,
      child: CommonStyle.commonText(
          label: label ?? 'Button Name',
          size: 18.0,
          color: textColor ?? const Color(0xffFCCC71)),
    );
  }
}
