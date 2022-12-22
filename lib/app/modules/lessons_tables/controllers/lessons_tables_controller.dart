// ignore_for_file: unnecessary_overrides, invalid_use_of_protected_member

import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/data/models/subject.dart';
import 'package:college_app/app/data/providers/subject_provider.dart';
import 'package:college_app/app/modules/level_type/controllers/level_type_controller.dart';
import 'package:college_app/app/modules/semester_type/controllers/semester_type_controller.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

class LessonsTablesController extends GetxController {
  LevelTypeController levelController = Get.find<LevelTypeController>();
  SemesterTypeController semesterTypeController =
      Get.find<SemesterTypeController>();
  var subjectList = <Datum>[].obs;
  List<PlutoRow> rows = [];

  @override
  void onInit() {
    super.onInit();
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
    subjectList.value = (await SubjectProvider.getSubjectsBySemester())!;
    return subjectList.value;
  }

  List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      readOnly: true,
      backgroundColor: CustomColors.primColor,
      enableContextMenu: false,
      enableColumnDrag: false,
      enableDropToResize: false,
      enableHideColumnMenuItem: false,
      width: 80.0,
      title: 'days'.tr,
      field: 'days',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      readOnly: true,
      backgroundColor: CustomColors.primColor,
      enableContextMenu: false,
      enableColumnDrag: false,
      enableDropToResize: false,
      enableHideColumnMenuItem: false,
      width: 120.0,
      title: 'lesson1'.tr,
      field: 'lesson1',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      readOnly: true,
      backgroundColor: CustomColors.primColor,
      enableContextMenu: false,
      enableColumnDrag: false,
      enableDropToResize: false,
      enableHideColumnMenuItem: false,
      width: 120.0,
      title: 'lesson2'.tr,
      field: 'lesson2',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      readOnly: true,
      backgroundColor: CustomColors.primColor,
      enableContextMenu: false,
      enableColumnDrag: false,
      enableDropToResize: false,
      enableHideColumnMenuItem: false,
      width: 120.0,
      title: 'lesson3'.tr,
      field: 'lesson3',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      readOnly: true,
      backgroundColor: CustomColors.primColor,
      enableContextMenu: false,
      enableColumnDrag: false,
      enableDropToResize: false,
      enableHideColumnMenuItem: false,
      width: 120.0,
      title: 'lesson4'.tr,
      field: 'lesson4',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      readOnly: true,
      backgroundColor: CustomColors.primColor,
      enableContextMenu: false,
      enableColumnDrag: false,
      enableDropToResize: false,
      enableHideColumnMenuItem: false,
      width: 120.0,
      title: 'lesson5'.tr,
      field: 'lesson5',
      type: PlutoColumnType.text(),
    ),
  ];

  void getRows() async {
    if (levelController.defaultLevel.value == 'level1' &&
        semesterTypeController.defaultSemester.value == 'semester1') {
      await fetchSubjects();
      rows = [
        PlutoRow(
          cells: {
            'days': PlutoCell(value: 'sat'.tr),
            'lesson1': PlutoCell(value: subjectList.value[0].subjectName),
            'lesson2': PlutoCell(value: subjectList.value[1].subjectName),
            'lesson3': PlutoCell(value: subjectList.value[2].subjectName),
            'lesson4': PlutoCell(value: ''),
            'lesson5': PlutoCell(value: ''),
          },
        ),
        PlutoRow(
          cells: {
            'days': PlutoCell(value: 'sun'.tr),
            'lesson1': PlutoCell(value: subjectList.value[3].subjectName),
            'lesson2': PlutoCell(value: subjectList.value[4].subjectName),
            'lesson3': PlutoCell(value: ''),
            'lesson4': PlutoCell(value: ''),
            'lesson5': PlutoCell(value: ''),
          },
        ),
        PlutoRow(
          cells: {
            'days': PlutoCell(value: 'mon'.tr),
            'lesson1': PlutoCell(value: ''),
            'lesson2': PlutoCell(value: subjectList.value[7].subjectName),
            'lesson3': PlutoCell(value: subjectList.value[6].subjectName),
            'lesson4': PlutoCell(value: subjectList.value[5].subjectName),
            'lesson5': PlutoCell(value: ''),
          },
        ),
        PlutoRow(
          cells: {
            'days': PlutoCell(value: 'tues'.tr),
            'lesson1': PlutoCell(value: subjectList.value[8].subjectName),
            'lesson2': PlutoCell(value: 'تطبيقات حاسوب'),
            'lesson3': PlutoCell(value: 'تمارين متقطعة'),
            'lesson4': PlutoCell(value: 'تمارين حسبان'),
            'lesson5': PlutoCell(value: ''),
          },
        ),
        PlutoRow(
          cells: {
            'days': PlutoCell(value: 'wen'.tr),
            'lesson1': PlutoCell(value: ''),
            'lesson2': PlutoCell(value: ''),
            'lesson3': PlutoCell(value: ''),
            'lesson4': PlutoCell(value: ''),
            'lesson5': PlutoCell(value: ''),
          },
        ),
        PlutoRow(
          cells: {
            'days': PlutoCell(value: 'thr'.tr),
            'lesson1': PlutoCell(value: ''),
            'lesson2': PlutoCell(value: ''),
            'lesson3': PlutoCell(value: ''),
            'lesson4': PlutoCell(value: ''),
            'lesson5': PlutoCell(value: ''),
          },
        ),
      ];
    }
  }
}
