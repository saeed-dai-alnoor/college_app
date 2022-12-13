import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/core/themes/layout.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:college_app/app/widgets/teacher_drawer.dart';
import 'package:college_app/app/widgets/gridCard.dart';
import 'package:college_app/app/widgets/home_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/teacher_home_controller.dart';

class TeacherHomeView extends GetView<TeacherHomeController> {
  const TeacherHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final saveNameLocaly = GetStorage();
    saveNameLocaly.read('name') ?? saveNameLocaly.write('name', Get.arguments);
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
            margin: const EdgeInsets.only(top: 220.0),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(Layout.getAppHeight(context), 210.0),
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 30.0,
              ),
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 14.0),
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 64, 157, 68),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CommonStyle.commonText(label: 'titleTeahAppBar'),
                      CommonStyle.commonText(
                          label: saveNameLocaly.read('name')),
                    ],
                  ),
                ),
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 23 / 21.5,
                  ),
                  children: [
                    GridCard(
                      image: 'studTable',
                      title: 'studentsList',
                      onpressed: () =>
                          CommonMethods.levelCustomDailog(studentsList: true),
                    ),
                    GridCard(
                      image: 'adver',
                      title: 'adver',
                      onpressed: () =>
                          CommonMethods.levelCustomDailog(studentsList: false),
                    ),
                    GridCard(
                      image: 'subjects',
                      title: 'subjects',
                      onpressed: () => CommonMethods.levelAndSemsCustomDailog(
                          subjects: true),
                    ),
                    GridCard(
                      image: 'lessonTable',
                      title: 'tables',
                      onpressed: () => CommonMethods.levelAndSemsCustomDailog(
                          subjects: false),
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
