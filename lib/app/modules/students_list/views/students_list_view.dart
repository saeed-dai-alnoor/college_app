import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/core/themes/layout.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:college_app/app/widgets/screens_appBar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'package:get/get.dart';

import '../controllers/students_list_controller.dart';

// ignore: must_be_immutable
class StudentsListView extends GetView<StudentsListController> {
  const StudentsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensAppBar(
        title: 'studentsList',
        height: 80.0,
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: ElevatedButton(
                  child: CommonStyle.commonText(
                    label: 'changeBand',
                    size: 20.0,
                  ),
                  onPressed: () =>
                      CommonMethods.levelCustomDailog(studentsList: true),
                ),
              ),
            ),
          ),
          Positioned(
            top: Layout.getAppHeight(context) / 12.5,
            left: 1.0,
            right: 1.0,
            child: CommonStyle.commonText(
              label: controller.levelController.defaultLevel.value,
              size: 18.0,
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: Layout.getAppHeight(context) / 7.5,
              left: 14.0,
              right: 14.0,
            ),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 2.0,
                  color: Color.fromRGBO(0, 0, 0, 0.26),
                ),
                top: BorderSide(
                  width: 2.0,
                  color: Color.fromRGBO(0, 0, 0, 0.26),
                ),
                bottom: BorderSide(
                  width: 2.0,
                  color: Color.fromRGBO(0, 0, 0, 0.26),
                ),
                left: BorderSide(
                  width: 2.0,
                  color: Color.fromRGBO(0, 0, 0, 0.26),
                ),
              ),
            ),
            child: SfDataGridTheme(
              data: SfDataGridThemeData(
                headerColor: CustomColors.primColor,
                gridLineColor: const Color.fromRGBO(0, 0, 0, 0.26),
                gridLineStrokeWidth: 2.0,
              ),
              child: SfDataGrid(
                source: controller.employeeDataSource,
                shrinkWrapRows: true,
                allowColumnsResizing: true,
                allowPullToRefresh: true,
                columnWidthMode: ColumnWidthMode.fill,
                gridLinesVisibility: GridLinesVisibility.both,
                headerGridLinesVisibility: GridLinesVisibility.both,
                columns: <GridColumn>[
                  GridColumn(
                    columnName: 'id',
                    width: 102.0,
                    label: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: CommonStyle.commonText(
                        label: 'studentId',
                        size: 14.0,
                      ),
                    ),
                  ),
                  GridColumn(
                    columnName: 'name',
                    label: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: CommonStyle.commonText(
                        label: 'name',
                        size: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
