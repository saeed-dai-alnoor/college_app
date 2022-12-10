// ignore_for_file: unnecessary_overrides
import 'package:college_app/app/modules/level_type/controllers/level_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StudentsListController extends GetxController {
  final levelController = Get.find<LevelTypeController>();
  TextEditingController searchController = TextEditingController();
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  @override
  void onInit() {
    super.onInit();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeesData: employees);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

////////////////////////////////////////////////////////////////
class Employee {
  Employee(this.id, this.name);
  final int id;
  final String name;
}

List<Employee> getEmployeeData() {
  return [
    Employee(10001, 'Saeed Dai Alnoor Aldodo'),
    Employee(10002, 'Muhammad Hisham Nasser'),
    Employee(10003, 'Abdul Rahman Ibrahim Ahmed'),
    Employee(10004, 'Wahib Ahmed Mohammed'),
    Employee(10005, 'Saeed Dai Alnoor Aldodo'),
    Employee(10006, 'Muhammad Hisham Nasser Ali'),
    Employee(10007, 'Abdul Rahman Ibrahim Ahmed'),
    Employee(10008, 'Wahib Ahmed Mohammed Al-Hassan'),
    Employee(10009, 'Saeed Dai Alnoor Aldodo'),
    Employee(10010, 'Muhammad Hisham Nasser Ali'),
    Employee(10011, 'Abdul Rahman Ibrahim Ahmed'),
    Employee(10012, 'Wahib Ahmed Mohammed Al-Hassan'),
    Employee(10001, 'Saeed Dai Alnoor Aldodo'),
    Employee(10002, 'Muhammad Hisham Nasser Ali'),
    Employee(10003, 'Abdul Rahman Ibrahim Ahmed'),
    Employee(10004, 'Wahib Ahmed Mohammed Al-Hassan'),
  ];
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<Employee> employeesData}) {
    employeeData = employeesData
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
            ],
          ),
        )
        .toList();
  }
  List<DataGridRow> employeeData = [];
  @override
  List<DataGridRow> get rows => employeeData;
  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    // Color getRowBackgroundColor() {
    //   final int index = effectiveRows.indexOf(row);
    //   if (index % 2 != 0) {
    //     return const Color(0xff6B6C84);
    //   } else {
    //     return Colors.white;
    //   }
    // }
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>(
        (employeeData) {
          return Container(
            alignment: (employeeData.columnName == 'id' ||
                    employeeData.columnName == 'name')
                ? Alignment.center
                : Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 2.0,
              vertical: 10.0,
            ),
            child: Text(
              employeeData.value.toString(),
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ).toList(),
    );
  }
}
