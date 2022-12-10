import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/core/themes/layout.dart';
import 'package:college_app/app/widgets/login_button.dart';
import 'package:college_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_kind_controller.dart';

class UserKindView extends GetView<UserKindController> {
  const UserKindView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SafeArea(
            child: SizedBox(
              width: Layout.getAppWidth(context),
              height: 300.0,
              child: Image.asset('assets/images/png/school.png'),
            ),
          ),
          CommonStyle.commonText(
            label: 'chooseType',
            color: Colors.indigo,
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
                        onPressed: () => controller.student(),
                        label: 'student',
                        buttonColor: const Color(0xff00BB9F),
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      child: LoginButton(
                        onPressed: () => controller.teacher(),
                        label: 'teacher',
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
                  onPressed: () => Get.toNamed(Routes.MANAGEMENT_LOGIN),
                  label: 'management',
                  buttonColor: const Color(0xff00BB9F),
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () => controller.parents(),
            child: Container(
              width: 130,
              height: 130,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff00BB9F),
              ),
              child: Center(
                child: CommonStyle.commonText(label: 'parents'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
