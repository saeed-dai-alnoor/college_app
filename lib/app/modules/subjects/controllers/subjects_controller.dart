// ignore_for_file: unnecessary_overrides, invalid_use_of_protected_member

import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/data/models/subject.dart';
import 'package:college_app/app/data/providers/subject_provider.dart';
import 'package:college_app/app/modules/level_type/controllers/level_type_controller.dart';
import 'package:college_app/app/modules/semester_type/controllers/semester_type_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pluto_grid/pluto_grid.dart';

class SubjectsController extends GetxController {
  LevelTypeController levelTypeController = Get.find<LevelTypeController>();
  SemesterTypeController semesterTypeController =
      Get.find<SemesterTypeController>();
  final getStorage = GetStorage();
  var levelName = ''.obs;
  var semesterId = ''.obs;
  var subjectsLists = <Datum>[].obs;
  List<PlutoColumn> columns = [];
  List<PlutoRow> rows = [];

  @override
  void onInit() {
    super.onInit();
    String? levelNameStorage = getStorage.read('level');
    if (levelNameStorage == '2') {
      levelName.value = 'الفرقة الثانية';
    } else if (levelNameStorage == '3') {
      levelName.value = 'الفرقة الثالثة';
    } else if (levelNameStorage == '4') {
      levelName.value = 'الفرقة الرابعة';
    } else if (levelNameStorage == '5') {
      levelName.value = 'الفرقة الخامسة';
    } else {
      levelName.value = 'الفرقة اﻷولى';
    }
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
    if (getStorage.read('level') == '1' && semesterName == 'semester2' ||
        levelName == 'level1' &&
            semesterName == 'semester2' &&
            getStorage.read('level') == null) {
      semesterId.value = '2';
    } else if (getStorage.read('level') == '2' && semesterName == 'semester1' ||
        levelName == 'level2' &&
            semesterName == 'semester1' &&
            getStorage.read('level') == null) {
      semesterId.value = '3';
    } else if (getStorage.read('level') == '2' && semesterName == 'semester2' ||
        levelName == 'level2' &&
            semesterName == 'semester2' &&
            getStorage.read('level') == null) {
      semesterId.value = '4';
    } else if (getStorage.read('level') == '3' && semesterName == 'semester1' ||
        levelName == 'level3' &&
            semesterName == 'semester1' &&
            getStorage.read('level') == null) {
      semesterId.value = '5';
    } else if (getStorage.read('level') == '3' && semesterName == 'semester2' ||
        levelName == 'level3' &&
            semesterName == 'semester2' &&
            getStorage.read('level') == null) {
      semesterId.value = '6';
    } else if (getStorage.read('level') == '4' && semesterName == 'semester1' ||
        levelName == 'level4' &&
            semesterName == 'semester1' &&
            getStorage.read('level') == null) {
      semesterId.value = '7';
    } else if (getStorage.read('level') == '4' && semesterName == 'semester2' ||
        levelName == 'level4' &&
            semesterName == 'semester2' &&
            getStorage.read('level') == null) {
      semesterId.value = '8';
    } else if (getStorage.read('level') == '5' && semesterName == 'semester1' ||
        levelName == 'level5' &&
            semesterName == 'semester1' &&
            getStorage.read('level') == null) {
      semesterId.value = '9';
    } else if (getStorage.read('level') == '5' && semesterName == 'semester2' ||
        levelName == 'level5' &&
            semesterName == 'semester2' &&
            getStorage.read('level') == null) {
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
