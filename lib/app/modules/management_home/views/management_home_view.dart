import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/core/themes/layout.dart';
import 'package:college_app/app/routes/app_pages.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:college_app/app/widgets/gridMangementCard.dart';
import 'package:college_app/app/widgets/home_appBar.dart';
import 'package:college_app/app/widgets/teacher_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/management_home_controller.dart';

class ManagementHomeView extends GetView<ManagementHomeController> {
  const ManagementHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TeacherDrawer(),
      key: controller.scaffoldKey,
      body: Stack(
        children: <Widget>[
          HomeAppBar(
            drawerFunction: () {
              controller.scaffoldKey.currentState!.openDrawer();
            },
            languageFunction: () => CommonMethods.languageCustomDailog(),
            appBarTitle: 'collegeName',
            size: 17.0,
          ),
          Container(
            margin: const EdgeInsets.only(top: 200.0),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(Layout.getAppHeight(context), 210.0),
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 6.0,
                vertical: 30.0,
              ),
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 18.0),
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 64, 157, 68),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: CommonStyle.commonText(
                    label: 'management',
                    size: 29.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  children: [
                    GridManagementCard(
                      image: 'teachersTable',
                      title: 'teachersList',
                      onpressed: () {
                        Get.toNamed(Routes.TEACHERS_LIST);
                      },
                    ),
                    GridManagementCard(
                      image: 'studTable',
                      title: 'studentsList',
                      onpressed: () => CommonMethods.levelCustomDailog(
                        studentsList: false,
                        manager: true,
                      ),
                    ),
                    GridManagementCard(
                      image: 'subjects',
                      title: 'subjects',
                      onpressed: () => CommonMethods.levelAndSemsCustomDailog(
                          subjects: true, manager: true),
                    ),
                    GridManagementCard(
                      image: 'lessonTable',
                      title: 'tables',
                      onpressed: () => CommonMethods.levelAndSemsCustomDailog(
                        subjects: false,
                        manager: true,
                      ),
                    ),
                    GridManagementCard(
                      image: 'editStudents',
                      title: 'editStudents',
                      onpressed: () {
                        Get.toNamed(Routes.STUDENT_SETTING);
                      },
                    ),
                    GridManagementCard(
                      image: 'editTeachers',
                      title: 'editTeachers',
                      onpressed: () {},
                    ),
                    GridManagementCard(
                      image: 'editSubjects',
                      title: 'editSubjects',
                      onpressed: () {},
                    ),
                    GridManagementCard(
                      image: 'editLevels',
                      title: 'editLevels',
                      onpressed: () {},
                    ),
                    GridManagementCard(
                      image: 'editManagers',
                      title: 'editManagers',
                      onpressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
