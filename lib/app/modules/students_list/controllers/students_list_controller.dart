// ignore_for_file: unnecessary_overrides, invalid_use_of_protected_member
import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/data/models/student.dart';
import 'package:college_app/app/data/models/student_provider.dart';
import 'package:college_app/app/modules/level_type/controllers/level_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StudentsListController extends GetxController {
  final levelController = Get.find<LevelTypeController>();
  TextEditingController searchController = TextEditingController();
  RxBool isLoad = false.obs;
  bool get isLoading => isLoad.value;
  var studentList = <Datum>[].obs;
  fetchStudents() async {
    isLoad.value = true;
    List<Datum>? students = await StudentProvider.getStudents();
    if (students != null) {
      isLoad.value = false;
      studentList.value = students;
    }
  }

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

  Future<StudentDataGridSource> getStudentSource() async {
    return StudentDataGridSource(studentList.value);
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
        columnName: 'ID',
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
            size: 17.0,
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
  late List<Datum>? data;
  List<DataGridRow> dataGridRows = <DataGridRow>[].obs;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: [
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          child: CommonStyle.commonText(
            label: row.getCells()[0].value,
            size: 15,
            color: Colors.black,
          ),
          // child: Text(
          //   row.getCells()[0].value,
          //   overflow: TextOverflow.ellipsis,
          // ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          child: CommonStyle.commonText(
            label: row.getCells()[1].value,
            size: 15,
            color: Colors.black,
          ),
          // child: Text(
          //   row.getCells()[1].value,
          //   overflow: TextOverflow.ellipsis,
          // ),
        ),
      ],
    );
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    dataGridRows = data!.map<DataGridRow>((dataGridRows) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'id', value: dataGridRows.studentId),
        DataGridCell(columnName: 'name', value: dataGridRows.name),
      ]);
    }).toList(growable: false);
  }
}
