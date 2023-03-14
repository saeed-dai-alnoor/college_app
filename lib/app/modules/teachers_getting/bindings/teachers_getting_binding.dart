import 'package:college_app/app/modules/teacher_creating/controllers/teacher_creating_controller.dart';
import 'package:college_app/app/modules/teacher_deleting/controllers/teacher_deleting_controller.dart';
import 'package:college_app/app/modules/teacher_updating/controllers/teacher_updating_controller.dart';
import 'package:get/get.dart';

import '../controllers/teachers_getting_controller.dart';

class TeachersGettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeachersGettingController>(
      () => TeachersGettingController(),
    );
    Get.lazyPut<TeacherCreatingController>(
      () => TeacherCreatingController(),
      fenix: true,
    );
    Get.lazyPut<TeacherUpdatingController>(
      () => TeacherUpdatingController(),
      fenix: true,
    );
    Get.lazyPut<TeacherDeletingController>(
      () => TeacherDeletingController(),
      fenix: true,
    );
  }
}
