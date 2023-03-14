import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:college_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TeacherDrawer extends StatelessWidget {
  TeacherDrawer({Key? key}) : super(key: key);
  final getStorge = GetStorage();

  @override
  Widget build(BuildContext context) {
    final getStorage = GetStorage();

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
                ),
              ),
            ),
            accountName: Container(
              margin: const EdgeInsets.only(top: 25.0),
              child: CommonStyle.commonText(
                label: '',
                size: 17.0,
              ),
            ),
            accountEmail: CommonStyle.commonText(
              label: '${getStorage.read('teacherName')}',
              size: 18.0,
            ),
            decoration: const BoxDecoration(color: CustomColors.primColor),
          ),
          buildDrawerElement(
            icon: Icons.view_list,
            label: 'studentsList',
            onpressed: () {
              Get.close(0);
              CommonMethods.levelCustomDailog(
                studentsList: true,
                manager: false,
              );
            },
          ),
          buildDrawerElement(
            icon: Icons.ad_units,
            label: 'adver',
            onpressed: () {
              Get.close(0);
              CommonMethods.levelCustomDailog(
                studentsList: false,
                manager: false,
              );
            },
          ),
          buildDrawerElement(
            icon: Icons.subject,
            label: 'subjects',
            onpressed: () {
              Get.close(0);
              CommonMethods.levelAndSemsCustomDailog(
                subjects: true,
                manager: false,
              );
            },
          ),
          buildDrawerElement(
            icon: Icons.table_rows_outlined,
            label: 'tables',
            onpressed: () {
              Get.close(0);
              CommonMethods.levelAndSemsCustomDailog(
                subjects: false,
                manager: false,
              );
            },
          ),
          const Divider(),
          buildDrawerElement(
            icon: Icons.logout,
            label: 'logout',
            onpressed: () {
              getStorge.erase();
              getStorge.write('id', 1);
              Get.offNamed(Routes.USER_KIND);
            },
          ),
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
