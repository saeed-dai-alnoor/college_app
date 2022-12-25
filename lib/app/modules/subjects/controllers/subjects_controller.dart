// ignore_for_file: unnecessary_overrides, invalid_use_of_protected_member

import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/data/models/subject.dart';
import 'package:college_app/app/data/providers/subject_provider.dart';
import 'package:college_app/app/modules/level_type/controllers/level_type_controller.dart';
import 'package:college_app/app/modules/semester_type/controllers/semester_type_controller.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

class SubjectsController extends GetxController {
  LevelTypeController levelTypeController = Get.find<LevelTypeController>();
  SemesterTypeController semesterTypeController =
      Get.find<SemesterTypeController>();
  var semesterId = ''.obs;
  var subjectsLists = <Datum>[].obs;
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

  Future<List<Datum>?> fetchSubjects() async {
    String semesterName = semesterTypeController.defaultSemester.value;
    String levelName = levelTypeController.defaultLevel.value;

    if (levelName == 'level1' && semesterName == 'semester2') {
      semesterId.value = '2';
    } else if (levelName == 'level2' && semesterName == 'semester') {
      semesterId.value = '3';
    } else if (levelName == 'level2' && semesterName == 'semester2') {
      semesterId.value = '4';
    } else if (levelName == 'level3' && semesterName == 'semester1') {
      semesterId.value = '5';
    } else if (levelName == 'level3' && semesterName == 'semester2') {
      semesterId.value = '6';
    } else if (levelName == 'level4' && semesterName == 'semester1') {
      semesterId.value = '7';
    } else if (levelName == 'level4' && semesterName == 'semester2') {
      semesterId.value = '8';
    } else if (levelName == 'level5' && semesterName == 'semester1') {
      semesterId.value = '9';
    } else if (levelName == 'level5' && semesterName == 'semester2') {
      semesterId.value = '10';
    } else {
      semesterId.value = '1';
    }
    final result =
        await SubjectProvider.fetchSubjects(semesterId: semesterId.value);
    result.fold((l) => subjectsLists.value = l!, (r) => null);

    return subjectsLists.value;
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
        width: 150.0,
        title: 'subjectName'.tr,
        field: 'subjectName',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        readOnly: true,
        backgroundColor: CustomColors.primColor,
        enableContextMenu: false,
        enableColumnDrag: false,
        enableDropToResize: false,
        enableHideColumnMenuItem: false,
        width: 190.0,
        title: 'teacherName'.tr,
        field: 'teacherName',
        type: PlutoColumnType.text(),
      ),
    ];
  }

  void getRows() async {
    await fetchSubjects();
    rows = List.generate(
      subjectsLists.value.length,
      (index) => PlutoRow(
        cells: {
          'subjectName':
              PlutoCell(value: subjectsLists.value[index].subjectName),
          'teacherName':
              PlutoCell(value: subjectsLists.value[index].teacherName),
        },
      ),
    );
  }
}
