import 'package:college_app/app/modules/languages_type/controllers/languages_type_controller.dart';
import 'package:get/get.dart';
import '../controllers/user_kind_controller.dart';

class UserKindBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserKindController>(
      () => UserKindController(),
    );
    Get.lazyPut<LanguagesTypeController>(
      () => LanguagesTypeController(),
      fenix: true,
    );
  }
}
