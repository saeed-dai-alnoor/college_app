import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/widgets/screens_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../controllers/subjects_controller.dart';
class SubjectsView extends GetView<SubjectsController> {
  const SubjectsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => Scaffold(
            appBar: ScreensAppBar(title: 'subjects'),
            body: LoadingOverlay(
              isLoading: controller.isLoading,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 8.0),
                  CommonStyle.commonText(
                    label: controller.levelController.defaultLevel.value,
                    size: 18.0,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 5.0),
                  CommonStyle.commonText(
                    label:
                        controller.semesterTypeController.defaultSemester.value,
                    size: 18.0,
                    color: Colors.black,
                  ),
                  FutureBuilder(
                    future: controller.getSubjectSource(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      return snapshot.hasData
                          ? SfDataGridTheme(
                              data: SfDataGridThemeData(
                                headerColor: CustomColors.primColor,
                                gridLineColor:
                                    const Color.fromRGBO(0, 0, 0, 0.26),
                                gridLineStrokeWidth: 2.0,
                              ),
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: <Widget>[
                                      SfDataGrid(
                                        shrinkWrapRows: true,
                                        allowPullToRefresh: true,
                                        columnWidthMode: ColumnWidthMode.fill,
                                        gridLinesVisibility:
                                            GridLinesVisibility.both,
                                        headerGridLinesVisibility:
                                            GridLinesVisibility.both,
                                        source: snapshot.data,
                                        columns: controller.getColumns(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
