import 'package:college_app/app/widgets/screens_appBar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensAppBar(title: 'notfy'),
      body: ListView(
        children: const <Widget>[],
      ),
    );
  }
}
