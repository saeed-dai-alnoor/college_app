// ignore_for_file: unnecessary_overrides, invalid_use_of_protected_member

import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/data/models/subject.dart';
import 'package:college_app/app/data/providers/subject_provider.dart';
import 'package:college_app/app/modules/level_type/controllers/level_type_controller.dart';
import 'package:college_app/app/modules/semester_type/controllers/semester_type_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pluto_grid/pluto_grid.dart';

class LessonsTablesController extends GetxController {
  LevelTypeController levelTypeController = Get.find<LevelTypeController>();
  SemesterTypeController semesterTypeController =
      Get.find<SemesterTypeController>();
  var subjectList = <Datum>[].obs;
  List<PlutoRow> rows = [];
  var levelName = ''.obs;
  final getStorage = GetStorage();
  var semesterId = ''.obs;

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
    SemesterTypeController semesterTypeController =
        Get.find<SemesterTypeController>();
    LevelTypeController levelTypeController = Get.find<LevelTypeController>();

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
    result.fold((l) => subjectList.value = l!, (r) => null);

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
    await fetchSubjects();
    switch (semesterId.value) {
      case '2':
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
              'lesson2': PlutoCell(value: ''),
              'lesson3': PlutoCell(value: ''),
              'lesson4': PlutoCell(value: ''),
              'lesson5': PlutoCell(value: ''),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'tues'.tr),
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: 'تطبيقات برمجة'),
              'lesson3': PlutoCell(value: 'تمارين جبر'),
              'lesson4': PlutoCell(value: 'تمارين إحصاء'),
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
              'lesson3': PlutoCell(value: subjectList.value[6].subjectName),
              'lesson4': PlutoCell(value: subjectList.value[5].subjectName),
              'lesson5': PlutoCell(value: ''),
            },
          ),
        ];
        break;
      case '3':
        rows = [
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'sat'.tr),
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: ''),
              'lesson3': PlutoCell(value: ''),
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
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: 'عملي هياكل'),
              'lesson3': PlutoCell(value: 'عملي قواعدالبيانات'),
              'lesson4': PlutoCell(value: 'عملي أساليب'),
              'lesson5': PlutoCell(value: 'تمارين الخطي'),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'wen'.tr),
              'lesson1': PlutoCell(value: subjectList.value[0].subjectName),
              'lesson2': PlutoCell(value: subjectList.value[1].subjectName),
              'lesson3': PlutoCell(value: subjectList.value[2].subjectName),
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
        break;
      case '4':
        rows = [
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'sat'.tr),
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: ''),
              'lesson3': PlutoCell(value: ''),
              'lesson4': PlutoCell(value: ''),
              'lesson5': PlutoCell(value: ''),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'sun'.tr),
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: ''),
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
              'lesson1': PlutoCell(value: 'عملي تحليل إحصائي'),
              'lesson2': PlutoCell(value: ''),
              'lesson3': PlutoCell(value: ''),
              'lesson4': PlutoCell(value: 'عملي أساليب'),
              'lesson5': PlutoCell(value: 'تمارين تفاضلية'),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'wen'.tr),
              'lesson1': PlutoCell(value: subjectList.value[0].subjectName),
              'lesson2': PlutoCell(value: subjectList.value[1].subjectName),
              'lesson3': PlutoCell(value: subjectList.value[2].subjectName),
              'lesson4': PlutoCell(value: ''),
              'lesson5': PlutoCell(value: ''),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'thr'.tr),
              'lesson1': PlutoCell(value: subjectList.value[3].subjectName),
              'lesson2': PlutoCell(value: subjectList.value[4].subjectName),
              'lesson3': PlutoCell(value: ''),
              'lesson4': PlutoCell(value: ''),
              'lesson5': PlutoCell(value: ''),
            },
          ),
        ];
        break;
      case '5':
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
              'lesson2': PlutoCell(value: ''),
              'lesson3': PlutoCell(value: ''),
              'lesson4': PlutoCell(value: ''),
              'lesson5': PlutoCell(value: ''),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'tues'.tr),
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: 'عملي ذكاء'),
              'lesson3': PlutoCell(value: 'عملي تحليل'),
              'lesson4': PlutoCell(value: ''),
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
        break;
      case '6':
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
              'lesson2': PlutoCell(value: ''),
              'lesson3': PlutoCell(value: ''),
              'lesson4': PlutoCell(value: ''),
              'lesson5': PlutoCell(value: ''),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'tues'.tr),
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: 'عملي تقنيات'),
              'lesson3': PlutoCell(value: 'عملي هندسة برمجيات'),
              'lesson4': PlutoCell(value: ''),
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
        break;
      case '7':
        rows = [
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'sat'.tr),
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: ''),
              'lesson3': PlutoCell(value: ''),
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
              'lesson5': PlutoCell(value: subjectList.value[5].subjectName),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'mon'.tr),
              'lesson1': PlutoCell(value: subjectList.value[0].subjectName),
              'lesson2': PlutoCell(value: subjectList.value[1].subjectName),
              'lesson3': PlutoCell(value: subjectList.value[2].subjectName),
              'lesson4': PlutoCell(value: ''),
              'lesson5': PlutoCell(value: ''),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'tues'.tr),
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: 'عملي تقنيات'),
              'lesson3': PlutoCell(value: 'عملي نمذجة'),
              'lesson4': PlutoCell(value: ''),
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
              'lesson5': PlutoCell(value: subjectList.value[6].subjectName),
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
        break;
      case '8':
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
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: ''),
              'lesson3': PlutoCell(value: ''),
              'lesson4': PlutoCell(value: ''),
              'lesson5': PlutoCell(value: ''),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'mon'.tr),
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: ''),
              'lesson3': PlutoCell(value: ''),
              'lesson4': PlutoCell(value: ''),
              'lesson5': PlutoCell(value: ''),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'tues'.tr),
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: ''),
              'lesson3': PlutoCell(value: ''),
              'lesson4': PlutoCell(value: ''),
              'lesson5': PlutoCell(value: ''),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'wen'.tr),
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: 'عملي قواعد بيانات'),
              'lesson3': PlutoCell(value: 'عملي أمن معلومات'),
              'lesson4': PlutoCell(value: ''),
              'lesson5': PlutoCell(value: 'عملي تطبقات هواتف'),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'thr'.tr),
              'lesson1': PlutoCell(value: subjectList.value[3].subjectName),
              'lesson2': PlutoCell(value: subjectList.value[4].subjectName),
              'lesson3': PlutoCell(value: ''),
              'lesson4': PlutoCell(value: ''),
              'lesson5': PlutoCell(value: subjectList.value[5].subjectName),
            },
          ),
        ];
        break;
      case '9':
        rows = [
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'sat'.tr),
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: ''),
              'lesson3': PlutoCell(value: ''),
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
              'lesson1': PlutoCell(value: subjectList.value[0].subjectName),
              'lesson2': PlutoCell(value: subjectList.value[1].subjectName),
              'lesson3': PlutoCell(value: subjectList.value[2].subjectName),
              'lesson4': PlutoCell(value: ''),
              'lesson5': PlutoCell(value: ''),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'tues'.tr),
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: 'عملي تقنيات'),
              'lesson3': PlutoCell(value: 'عملي تنقيب بيانات'),
              'lesson4': PlutoCell(value: ''),
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
        break;
      case '10':
        rows = [
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'sat'.tr),
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: ''),
              'lesson3': PlutoCell(value: ''),
              'lesson4': PlutoCell(value: subjectList.value[0].subjectName),
              'lesson5': PlutoCell(value: 'عملي التجارة'),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'sun'.tr),
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: ''),
              'lesson3': PlutoCell(value: ''),
              'lesson4': PlutoCell(value: ''),
              'lesson5': PlutoCell(value: ''),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'mon'.tr),
              'lesson1': PlutoCell(value: 'عملي شبكات'),
              'lesson2': PlutoCell(value: 'عملي قواعد'),
              'lesson3': PlutoCell(value: subjectList.value[3].subjectName),
              'lesson4': PlutoCell(value: subjectList.value[1].subjectName),
              'lesson5': PlutoCell(value: ''),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'tues'.tr),
              'lesson1': PlutoCell(value: ''),
              'lesson2': PlutoCell(value: ''),
              'lesson3': PlutoCell(value: ''),
              'lesson4': PlutoCell(value: ''),
              'lesson5': PlutoCell(value: ''),
            },
          ),
          PlutoRow(
            cells: {
              'days': PlutoCell(value: 'wen'.tr),
              'lesson1': PlutoCell(value: subjectList.value[0].subjectName),
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
        break;
      default:
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
        break;
    }
  }
}
