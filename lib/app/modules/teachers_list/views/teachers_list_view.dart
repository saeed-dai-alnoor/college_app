import 'package:college_app/app/widgets/screens_appBar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../controllers/teachers_list_controller.dart';

class TeachersListView extends GetView<TeachersListController> {
  const TeachersListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensAppBar(title: 'teachersList'),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 8.0),
          Expanded(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                    future: controller.fetchTeachers(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return snapshot.hasData
                          ? PlutoGrid(
                              columns: controller.columns,
                              rows: controller.rows,
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 3.0,
                              ),
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
