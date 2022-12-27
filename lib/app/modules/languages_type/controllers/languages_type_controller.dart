// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguagesTypeController extends GetxController {
  final getStorage = GetStorage();
  final _defaultLang = ''.obs;
  String get defaultLang => _defaultLang.value;
  void setDefaultLang(String defaultLang) {
    _defaultLang.value = defaultLang;
  }

  @override
  void onInit() {
    super.onInit();
    if (getStorage.read('lang') == 'ar' || getStorage.read('lang') == null) {
      _defaultLang.value = 'ar';
    } else {
      _defaultLang.value = 'en';
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
