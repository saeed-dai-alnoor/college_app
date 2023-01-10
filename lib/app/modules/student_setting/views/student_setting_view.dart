import 'package:college_app/app/widgets/screens_appBar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/student_setting_controller.dart';

class StudentSettingView extends GetView<StudentSettingController> {
  const StudentSettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensAppBar(title: 'editTeachers'),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 8.0),
          Expanded(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
