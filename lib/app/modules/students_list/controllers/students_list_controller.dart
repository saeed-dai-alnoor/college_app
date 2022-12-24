// ignore_for_file: unnecessary_overrides, invalid_use_of_protected_member, prefer_typing_uninitialized_variables
import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/modules/level_type/controllers/level_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StudentsListController extends GetxController {
  final levelController = Get.find<LevelTypeController>();
  RxBool isLoad = false.obs;
  bool get isLoading => isLoad.value;
  var studentList = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchStudents() async {
    // isLoad.value = true;
    // var students = await StudentProvider.getStudentsByLevel();
    // if (students != null) {
    //   isLoad.value = false;
    //   studentList.value = students;
    // }
  }

  Future<StudentDataGridSource> getStudentSource() async {
    return StudentDataGridSource(studentList.value);
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
        columnName: 'id',
        width: 90.0,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: CommonStyle.commonText(
            label: 'id',
            size: 16.0,
          ),
        ),
      ),
      GridColumn(
        columnName: 'name',
        width: 280.0,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: CommonStyle.commonText(
            label: 'name',
            size: 19.0,
          ),
        ),
      ),
    ];
  }
}

class StudentDataGridSource extends DataGridSource {
  StudentDataGridSource(this.data) {
    buildDataGridRow();
  }
  late var data;
  List<DataGridRow> dataGridRows = <DataGridRow>[].obs;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          child: CommonStyle.commonText(
            label: row.getCells()[0].value,
            size: 18.0,
            color: Colors.black,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          child: CommonStyle.commonText(
            label: row.getCells()[1].value,
            size: 18.0,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    dataGridRows = data!.map<DataGridRow>((dataGridRows) {
      return DataGridRow(
        cells: <DataGridCell>[
          DataGridCell(
              columnName: 'id', value: dataGridRows.studentId.toString()),
          DataGridCell(columnName: 'name', value: dataGridRows.name),
        ],
      );
    }).toList(growable: false);
  }
}
