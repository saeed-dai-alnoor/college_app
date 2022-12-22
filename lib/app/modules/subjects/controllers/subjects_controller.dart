// ignore_for_file: unnecessary_overrides, invalid_use_of_protected_member

import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/data/models/subject.dart';
import 'package:college_app/app/data/providers/subject_provider.dart';
import 'package:college_app/app/modules/level_type/controllers/level_type_controller.dart';
import 'package:college_app/app/modules/semester_type/controllers/semester_type_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SubjectsController extends GetxController {
  LevelTypeController levelController = Get.find<LevelTypeController>();
  SemesterTypeController semesterTypeController =
      Get.find<SemesterTypeController>();
  RxBool isLoad = false.obs;
  bool get isLoading => isLoad.value;
  var subjectList = <Datum>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSubjects();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchSubjects() async {
    isLoad.value = true;
    List<Datum>? subjects = await SubjectProvider.getSubjectsBySemester();
    if (subjects != null) {
      isLoad.value = false;
      subjectList.value = subjects;
    }
  }

  Future<SubjectDataGridSource> getSubjectSource() async {
    return SubjectDataGridSource(subjectList.value);
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
        columnName: 'subjectName',
        width: 180.0,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: CommonStyle.commonText(
            label: 'subjectName',
            size: 19.0,
          ),
        ),
      ),
      GridColumn(
        columnName: 'teacherName',
        width: 190.0,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerRight,
          child: CommonStyle.commonText(
            label: 'teacherName',
            size: 19.0,
          ),
        ),
      ),
    ];
  }
}

class SubjectDataGridSource extends DataGridSource {
  SubjectDataGridSource(this.data) {
    buildDataGridRow();
  }
  late List<Datum>? data;
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
              columnName: 'subjectName', value: dataGridRows.subjectName),
          DataGridCell(
              columnName: 'teacherName', value: dataGridRows.teacherName),
        ],
      );
    }).toList(growable: false);
  }
}
