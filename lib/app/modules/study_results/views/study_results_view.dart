import 'package:college_app/app/widgets/screens_appBar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/study_results_controller.dart';

class StudyResultsView extends GetView<StudyResultsController> {
  const StudyResultsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensAppBar(title: 'results'),
      body: ListView(
        children: const <Widget>[],
      ),
    );
  }
}
