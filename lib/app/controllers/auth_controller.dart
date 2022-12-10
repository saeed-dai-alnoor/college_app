// ignore_for_file: unnecessary_overrides

import 'package:college_app/app/data/models/student.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<Student> _currentStudent = Rxn();
  Student? get currentStudent => _currentStudent.value;
  set currentStudent(Student? student) => _currentStudent.value = student;

  @override
  void onInit() {
    super.onInit();
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
