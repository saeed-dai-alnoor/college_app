// ignore_for_file: invalid_use_of_protected_member
import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:college_app/app/data/models/level/levels_getting.dart';
import 'package:college_app/app/data/providers/level_provider/level_provider.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

class LevelsGettingController extends GetxController {
  var levels = <Datum>[].obs;
  List<PlutoColumn> columns = [];
  List<PlutoRow> rows = [];
  RxBool empty = false.obs;
  // For loading...
  RxBool isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    getColumns();
    getRows();
  }

  // For get all levels
  Future<List<Datum?>> getLevels() async {
    final result = await LevelProvider().getLevels();
    result.fold((l) {
      if (l!.isEmpty) {
        empty.value = true;
      }
      levels.value = l;
    }, (r) => null);
    return levels.value;
  }

  // Column level table
  void getColumns() {
    columns = <PlutoColumn>[
      PlutoColumn(
        readOnly: true,
        backgroundColor: CustomColors.primColor,
        enableContextMenu: false,
        enableColumnDrag: false,
        enableDropToResize: false,
        enableHideColumnMenuItem: false,
        width: 120.0,
        title: 'semester'.tr,
        field: 'levelId',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        readOnly: true,
        backgroundColor: CustomColors.primColor,
        enableContextMenu: false,
        enableColumnDrag: false,
        enableDropToResize: false,
        enableHideColumnMenuItem: false,
        width: 295.0,
        title: 'level'.tr,
        field: 'levelName',
        type: PlutoColumnType.text(),
      ),
    ];
  }

  // Row level table
  void getRows() async {
    await getLevels();
    isLoading.value = false;
    rows = List.generate(
      levels.value.length,
      (index) => PlutoRow(
        cells: {
          'levelId': PlutoCell(value: levels.value[index].levelId),
          'levelName': PlutoCell(value: levels.value[index].levelName),
        },
      ),
    );
  }
}
