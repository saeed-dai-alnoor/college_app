import 'package:college_app/app/widgets/screens_appBar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/advertisement_controller.dart';

class AdvertisementView extends GetView<AdvertisementController> {
  const AdvertisementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensAppBar(title: 'adver'),
      body: ListView(
        children: const <Widget>[],
      ),
    );
  }
}
