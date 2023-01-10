import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/widgets/login_button.dart';
import 'package:college_app/app/widgets/screens_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/student_query_controller.dart';

class StudentQueryView extends GetView<StudentQueryController> {
  const StudentQueryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final getStorage = GetStorage();
    Get.put(StudentQueryController(), permanent: true);
    return Scaffold(
      appBar: ScreensAppBar(title: 'tuitionPayments'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20.0),
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
            const SizedBox(height: 20.0),
            Container(
              height: 250.0,
              width: 300,
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: CustomColors.primColor,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 150.0,
                    child: LoginButton(
                      onPressed: () {},
                      label: 'studyMoney',
                      buttonColor: CustomColors.primColor,
                      textColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  SizedBox(
                    width: 150,
                    child: CommonStyle.commonText(
                      label: '50.000 جنيه',
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 150.0,
                    child: LoginButton(
                      onPressed: () {},
                      label: 'tuitionPayments',
                      buttonColor: CustomColors.primColor,
                      textColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  SizedBox(
                    width: 150,
                    child: CommonStyle.commonText(
                      label: '200.000 جنيه',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            SizedBox(
              width: 150.0,
              child: LoginButton(
                onPressed: () => controller.launchURL(),
                label: 'pay',
                buttonColor: CustomColors.primColor,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
