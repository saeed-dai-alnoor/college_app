import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/widgets/screens_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import '../controllers/lessons_tables_controller.dart';

class LessonsTablesView extends GetView<LessonsTablesController> {
  const LessonsTablesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: ScreensAppBar(title: 'tables'),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 8.0),
            CommonStyle.commonText(
              label: controller.getStorage.read('level') != null
                  ? controller.levelName.value
                  : controller.levelTypeController.defaultLevel.value,
              size: 18.0,
              color: Colors.black,
            ),
            const SizedBox(height: 5.0),
            CommonStyle.commonText(
              label: controller.semesterTypeController.defaultSemester.value,
              size: 18.0,
              color: Colors.black,
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder(
                      future: controller.fetchSubjects(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
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
      ),
    );
  }
}
