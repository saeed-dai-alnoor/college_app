import 'package:college_app/app/modules/student_query/views/animated_pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_query_controller.dart';

class StudentQueryView extends GetView<StudentQueryController> {
  const StudentQueryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
