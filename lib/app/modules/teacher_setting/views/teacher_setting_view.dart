import 'package:college_app/app/core/themes/layout.dart';
import 'package:college_app/app/widgets/login_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/teacher_setting_controller.dart';

class TeacherSettingView extends GetView<TeacherSettingController> {
  const TeacherSettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00BB9F),
        title: Text('editTeachers'.tr),
        centerTitle: true,
        toolbarHeight: 90.0,
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 50.0),
          SafeArea(
            child: SizedBox(
              width: Layout.getAppWidth(context),
              height: 300.0,
              child: Image.asset('assets/images/png/school.png'),
            ),
          ),
          const SizedBox(height: 20.0),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 150,
                      child: LoginButton(
                        onPressed: () {},
                        label: 'addTeacher',
                        buttonColor: const Color(0xff00BB9F),
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      child: LoginButton(
                        onPressed: () {},
                        label: 'updateTeacher',
                        buttonColor: const Color(0xff00BB9F),
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 150,
                margin: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: LoginButton(
                  onPressed: () => {},
                  label: 'deleteTeacher',
                  buttonColor: const Color(0xff00BB9F),
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
