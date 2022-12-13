import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:college_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StudentDrawer extends StatelessWidget {
  StudentDrawer({Key? key}) : super(key: key);
  final getStorge = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  )),
            ),
            accountName: Container(
              margin: const EdgeInsets.only(top: 25.0),
              child: CommonStyle.commonText(
                label: 'Saeed Dai Alnoor',
                size: 17.0,
              ),
            ),
            accountEmail: CommonStyle.commonText(
              label: 'saeed@gmail.com',
              size: 18.0,
            ),
            decoration: const BoxDecoration(color: CustomColors.primColor),
          ),
          buildDrawerElement(
            icon: Icons.table_rows_outlined,
            label: 'tables',
            onpressed: () {
              Get.close(0);
              CommonMethods.semesterCustomDailog(results: false);
            },
          ),
          buildDrawerElement(
            icon: Icons.recent_actors_outlined,
            label: 'results',
            onpressed: () {
              Get.close(0);
              CommonMethods.semesterCustomDailog(results: true);
            },
          ),
          buildDrawerElement(
            icon: Icons.notifications_active,
            label: 'notfy',
            onpressed: () => Get.offAndToNamed(Routes.NOTIFICATIONS),
          ),
          buildDrawerElement(
            icon: Icons.calendar_month_outlined,
            label: 'calendar',
            onpressed: () => Get.offAndToNamed(Routes.CALENDAR),
          ),
          const Divider(),
          buildDrawerElement(
              icon: Icons.logout,
              label: 'logout',
              onpressed: () {
                getStorge.erase();
                getStorge.write('id', 1);
                Get.offNamed(
                  Routes.USER_KIND,
                );
              }),
        ],
      ),
    );
  }

  Widget buildDrawerElement({
    required IconData icon,
    required String label,
    required Function() onpressed,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: CommonStyle.commonText(
        label: label,
        color: Colors.black87,
        textAlign: TextAlign.start,
        size: 20.0,
      ),
      onTap: onpressed,
    );
  }
}
