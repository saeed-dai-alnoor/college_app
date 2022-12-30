import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/core/themes/layout.dart';
import 'package:college_app/app/modules/student_query/views/student_query_view.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:college_app/app/widgets/gridCard.dart';
import 'package:college_app/app/widgets/home_appBar.dart';
import 'package:college_app/app/widgets/student_drawer.dart';
import 'package:college_app/app/modules/notifications/views/notifications_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/student_home_controller.dart';

class StudentHomeView extends GetView<StudentHomeController> {
  const StudentHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final getStorage = GetStorage();

    return Scaffold(
      drawer: StudentDrawer(),
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
                      CommonStyle.commonText(label: 'titleStudAppBar'),
                      CommonStyle.commonText(
                        label: getStorage.read('studentName') == null
                            ? '${Get.arguments}'
                            : '${getStorage.read('studentName')}',
                      ),
                    ],
                  ),
                ),
                GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 23 / 21.5,
                  ),
                  children: <Widget>[
                    GridCard(
                      image: 'studentSubjects',
                      title: 'studentSubjects',
                      onpressed: () => CommonMethods.semesterCustomDailog(
                        studentSubjects: true,
                      ),
                    ),
                    GridCard(
                      image: 'query',
                      title: 'query',
                      onpressed: () => Get.to(
                        () => const StudentQueryView(),
                        duration: const Duration(milliseconds: 700),
                        transition: Transition.size,
                      ),
                    ),
                    GridCard(
                      image: 'lessonTable',
                      title: 'tables',
                      onpressed: () => CommonMethods.semesterCustomDailog(
                        studentSubjects: false,
                      ),
                    ),
                    GridCard(
                      image: 'notfy',
                      title: 'notfy',
                      onpressed: () => Get.to(
                        const NotificationsView(),
                        duration: const Duration(milliseconds: 700),
                        transition: Transition.size,
                      ),
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
