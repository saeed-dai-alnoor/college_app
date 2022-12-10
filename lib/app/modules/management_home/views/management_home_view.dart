import 'package:college_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/management_home_controller.dart';

class ManagementHomeView extends GetView<ManagementHomeController> {
  const ManagementHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManagementHomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.toNamed(Routes.USER_KIND),
          child: const Text(
            'ManagementHomeView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
