// ignore_for_file: invalid_use_of_protected_member

import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/data/models/teacher/teachers_getting.dart';
import 'package:college_app/app/data/providers/teacher_provider.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

class TeachersGettingController extends GetxController {
  var teachers = <Datum>[].obs;
  List<PlutoColumn> columns = [];
  List<PlutoRow> rows = [];
  RxBool empty = false.obs;
  // For loading...
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getColumns();
    getRows();
  }

  // For get all teachers
  Future<List<Datum?>> getTeachers() async {
    final result = await TeacherProvider().getTeachers();
    result.fold((l) {
      if (l!.isEmpty) {
        empty.value = true;
      }
      teachers.value = l;
    }, (r) => null);
    return teachers.value;
  }

  // Column teachers table
  void getColumns() {
    columns = <PlutoColumn>[
      PlutoColumn(
        readOnly: true,
        backgroundColor: CustomColors.primColor,
        enableContextMenu: false,
        enableColumnDrag: false,
        enableDropToResize: false,
        enableHideColumnMenuItem: false,
        width: 80.0,
        title: 'ID',
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
        width: 200.0,
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
        width: 140.0,
        title: 'phone'.tr,
        field: 'phone',
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
        title: 'password'.tr,
        field: 'password',
        type: PlutoColumnType.text(),
      ),
    ];
  }

  // Row level table
  void getRows() async {
    await getTeachers();
    isLoading.value = false;
    rows = List.generate(
      teachers.value.length,
      (index) => PlutoRow(
        cells: {
          'teacherId': PlutoCell(value: teachers.value[index].teacherId),
          'name': PlutoCell(value: teachers.value[index].teacherName),
          'phone': PlutoCell(value: teachers.value[index].phone),
          'password': PlutoCell(value: teachers.value[index].teacherLog),
        },
      ),
    );
  }
}
