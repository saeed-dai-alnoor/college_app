// ignore_for_file: unnecessary_overrides, invalid_use_of_protected_member, prefer_typing_uninitialized_variables
import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/data/models/students_lists.dart';
import 'package:college_app/app/data/providers/students_lists_provider.dart';
import 'package:college_app/app/modules/level_type/controllers/level_type_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pluto_grid/pluto_grid.dart';

class StudentsListController extends GetxController {
  final levelTypeController = Get.find<LevelTypeController>();
  var levelName = ''.obs;
  var levelId = ''.obs;
  final getStorage = GetStorage();
  var studentList = <Datum>[].obs;
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

  Future<List<Datum>?> fetchStudents() async {
    String levelName = levelTypeController.defaultLevel.value;

    if (levelName == 'level2' || getStorage.read('level') == '2') {
      levelId.value = '2';
    } else if (levelName == 'level3' || getStorage.read('level') == '3') {
      levelId.value = '3';
    } else if (levelName == 'level4' || getStorage.read('level') == '4') {
      levelId.value = '4';
    } else if (levelName == 'level5' || getStorage.read('level') == '5') {
      levelId.value = '5';
    } else {
      levelId.value = '1';
    }

    final result =
        await StudentsListsProvider.fetchStudentsLists(levelId: levelId.value);
    result.fold((l) => studentList.value = l!, (r) => null);

    return studentList.value;
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
        title: 'studentId'.tr,
        field: 'studentId',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        readOnly: true,
        backgroundColor: CustomColors.primColor,
        enableContextMenu: false,
        enableColumnDrag: false,
        enableDropToResize: false,
        enableHideColumnMenuItem: false,
        width: 240.0,
        title: 'name'.tr,
        field: 'name',
        type: PlutoColumnType.text(),
      ),
    ];
  }

  void getRows() async {
    await fetchStudents();
    rows = List.generate(
      studentList.value.length,
      (index) => PlutoRow(
        cells: {
          'studentId': PlutoCell(value: studentList.value[index].studentId),
          'name': PlutoCell(value: studentList.value[index].name),
        },
      ),
    );
  }
}
