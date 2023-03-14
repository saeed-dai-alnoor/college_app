import 'package:college_app/app/core/themes/common_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/languages_type_controller.dart';

// ignore: must_be_immutable
class LanguagesTypeView extends GetView<LanguagesTypeController> {
  LanguagesTypeView({
    Key? key,
    this.margin,
  }) : super(key: key);
  double? margin;
  final getStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 27.0),
            child: CommonStyle.commonText(
              label: 'chooseLanguage',
              color: const Color(0xff3160C5),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: margin ?? 0.0),
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 34.0,
            ),
            height: 180.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color(0xff00A951),
              border: Border.all(
                width: 1.5,
                color: Colors.white,
              ),
            ),
            child: Column(
              children: <Widget>[
                buildLangButton(lang: 'ar'),
                const Padding(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Divider(
                    thickness: 2,
                    color: Colors.white,
                  ),
                ),
                buildLangButton(lang: 'en'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLangButton({required String lang}) {
    return InkWell(
      onTap: (() {
        getStorage.write('lang', lang);
        controller.setDefaultLang(lang);
        Get.updateLocale(Locale(lang, 'SA'));
      }),
      child: Row(
        children: [
          Radio(
            value: lang,
            groupValue: controller.defaultLang,
            onChanged: (String? value) {},
            activeColor: Colors.white,
          ),
          CommonStyle.commonText(label: lang, size: 21.0),
        ],
      ),
    );
  }
}
