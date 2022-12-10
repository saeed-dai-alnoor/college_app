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
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  // ignore: unnecessary_overrides
  void onClose() {
    super.onClose();
  }
}
