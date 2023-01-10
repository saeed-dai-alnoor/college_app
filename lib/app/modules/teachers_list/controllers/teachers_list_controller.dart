// ignore_for_file: unnecessary_overrides, invalid_use_of_protected_member

import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/data/models/teachers_list.dart';
import 'package:college_app/app/data/providers/teacher_list_provider.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

class TeachersListController extends GetxController {
  var teachersList = <Datum>[].obs;
  List<PlutoColumn> columns = [];
  List<PlutoRow> rows = [];

  @override
  void onInit() {
    super.onInit();
    getColumns();
    getRows();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<Datum?>> fetchTeachers() async {
    final result = await TeacherListProvider.fetchTeachers();
    result.fold((l) => teachersList.value = l!, (r) => null);

    return teachersList.value;
  }

  void getColumns() {
    columns = <PlutoColumn>[
      PlutoColumn(
        readOnly: true,
        backgroundColor: CustomColors.primColor,
        enableContextMenu: false,
        enableColumnDrag: false,
        enableDropToResize: false,
        enableHideColumnMenuItem: false,
        width: 100.0,
        title: 'teacherId'.tr,
        field: 'teacherId',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        readOnly: true,
        backgroundColor: CustomColors.primColor,
        enableContextMenu: false,
        enableColumnDrag: false,
        enableDropToResize: false,
        enableHideColumnMenuItem: false,
        width: 140.0,
        title: 'name'.tr,
        field: 'name',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        readOnly: true,
        backgroundColor: CustomColors.primColor,
        enableContextMenu: false,
        enableColumnDrag: false,
        enableDropToResize: false,
        enableHideColumnMenuItem: false,
        width: 100.0,
        title: 'phone'.tr,
        field: 'phone',
        type: PlutoColumnType.text(),
      ),
    ];
  }

  void getRows() async {
    await fetchTeachers();
    rows = List.generate(
      teachersList.value.length,
      (index) => PlutoRow(
        cells: {
          'teacherId': PlutoCell(value: teachersList.value[index].teacherId),
          'name': PlutoCell(value: teachersList.value[index].name),
          'phone': PlutoCell(value: teachersList.value[index].phone),
        },
      ),
    );
  }
}
