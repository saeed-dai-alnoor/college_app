import 'package:college_app/app/widgets/screens_appBar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lessons_tables_controller.dart';

class LessonsTablesView extends GetView<LessonsTablesController> {
  const LessonsTablesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensAppBar(title: 'tables'),
      body: ListView(
        children: const <Widget>[],
      ),
    );
  }
}
