import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:college_app/app/widgets/screens_appBar.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:get/get.dart';
import '../controllers/students_list_controller.dart';

// ignore: must_be_immutable
class StudentsListView extends GetView<StudentsListController> {
  const StudentsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: ScreensAppBar(
              title: 'studentsList',
              height: 80.0,
            ),
            body: Column(
              children: <Widget>[
                ElevatedButton(
                  child: CommonStyle.commonText(
                    label: 'changeBand',
                    size: 20.0,
                  ),
                  onPressed: () => CommonMethods.levelCustomDailog(
                    studentsList: true,
                    manager: false,
                  ),
                ),
                const SizedBox(height: 8.0),
                CommonStyle.commonText(
                  label: controller.getStorage.read('level') != null
                      ? controller.levelName.value
                      : controller.levelTypeController.defaultLevel.value,
                  size: 18.0,
                  color: Colors.black,
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FutureBuilder(
                          future: controller.fetchStudents(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            return snapshot.hasData
                                ? PlutoGrid(
                                    columns: controller.columns,
                                    rows: controller.rows,
                                  )
                                : const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3.0,
                                    ),
                                  );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
