import 'package:get/get.dart';

import '../controllers/advertisement_controller.dart';

class AdvertisementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdvertisementController>(
      () => AdvertisementController(),
    );
  }
}
