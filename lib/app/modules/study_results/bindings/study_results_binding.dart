import 'package:get/get.dart';

import '../controllers/study_results_controller.dart';

class StudyResultsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudyResultsController>(
      () => StudyResultsController(),
    );
  }
}
