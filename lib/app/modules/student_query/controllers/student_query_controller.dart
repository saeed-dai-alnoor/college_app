// ignore_for_file: unnecessary_overrides, unused_element

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentQueryController extends GetxController {
  launchURL() async {
    const url = 'https://flutter.io';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
    @override
    void onInit() {
      super.onInit();
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
}
