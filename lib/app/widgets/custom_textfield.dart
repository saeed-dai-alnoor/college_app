// import 'package:college_app/app/modules/languages_type/controllers/languages_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  FocusNode? focusNode;
  TextInputAction? textInputAction;
  Function(String?)? onSaved;
  String? Function(String?)? validator;
  Function(String)? onFieldSubmitted;
  String? label;
  Icon? prefixIcon;
  IconButton? suffixIcon;
  TextInputType? keyboardType;
  bool? obscureText;

  CustomTextField({
    Key? key,
    this.obscureText,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.label,
  }) : super(key: key);
  final getStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    // final languageController = Get.find<LanguagesTypeController>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFFDCDCDC),
          ),
        ),
        child: TextFormField(
          keyboardType: keyboardType ?? TextInputType.phone,
          obscureText: obscureText ?? false,
          controller: controller,
          focusNode: focusNode,
          textInputAction: textInputAction,
          onSaved: onSaved,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffFCCC71),
                width: 2.3,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            label: Text(
              label!.tr,
              style: TextStyle(
                fontFamily:
                    getStorage.read('lang') == 'en' ? 'Philosopher' : 'Amiri',
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
