import 'package:college_app/app/routes/app_pages.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:college_app/app/widgets/gridMangementCard.dart';
import 'package:college_app/app/widgets/home_appBar.dart';
import 'package:college_app/app/widgets/teacher_drawer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/management_home_controller.dart';

class ManagementHomeView extends GetView<ManagementHomeController> {
  const ManagementHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: TeacherDrawer(),
      key: controller.scaffoldKey,
      body: Column(
        children: <Widget>[
          HomeAppBar(
            drawerFunction: () {
              controller.scaffoldKey.currentState!.openDrawer();
            },
            languageFunction: () => CommonMethods.languageCustomDailog(),
            appBarTitle: 'collegeName',
            size: 17.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.custom(
                gridDelegate: SliverWovenGridDelegate.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                  pattern: [
                    const WovenGridTile(1),
                    const WovenGridTile(1),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  childCount:
                      controller.gridManagementCardDetiles['images']!.length,
                  (context, index) => GridManagementCard(
                    image: controller
                        .gridManagementCardDetiles['images']![index]
                        .toString(),
                    title: controller
                        .gridManagementCardDetiles['titles']![index]
                        .toString(),
                    onPressed: () {
                      switch (index) {
                        case 0:
                          CommonMethods.getConnectionType();
                          if (CommonMethods.connectionType == 0) {
                            CommonMethods.showNoInternetDailog();
                          } else {
                            Get.toNamed(Routes.TEACHERS_GETTING);
                          }
                          break;
                        case 1:
                          () {};
                          break;
                        case 2:
                          () {};
                          break;
                        case 3:
                          CommonMethods.getConnectionType();
                          if (CommonMethods.connectionType == 0) {
                            CommonMethods.showNoInternetDailog();
                          } else {
                            Get.toNamed(Routes.LEVELS_GETTING);
                          }
                          break;
                        case 4:
                          () {};

                          break;
                        case 5:
                          () {};
                          break;
                        default:
                          Get.back();
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
