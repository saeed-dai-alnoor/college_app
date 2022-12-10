import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/modules/languages_type/controllers/languages_type_controller.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final langController = Get.find<LanguagesTypeController>();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DefaultTabController(
            length: controller.tabs.length,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: PageView(
                    onPageChanged: ((value) =>
                        controller.pageIndex.value = value),
                    controller: controller.pageController,
                    children: List.generate(
                      controller.tabs.length,
                      (index) => Container(
                        margin: const EdgeInsets.all(20.0),
                        child: ListView(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 60.0),
                              child: CommonStyle.commonText(
                                label: controller.tabs[index],
                                color: const Color(0xff3160C5),
                                size: 21.0,
                              ),
                            ),
                            Image.asset(
                              'assets/images/png/onbImg$index.png',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 110.0,
                    vertical: 35.0,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: IconButton(
                    onPressed: () {
                      controller.pageIndex.value == 3
                          ? controller.onFinished()
                          : controller.pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linearToEaseOut);
                    },
                    icon: const Icon(
                      Icons.double_arrow,
                      color: Color(0xff3160C5),
                      size: 35.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Obx(
                    () => DotsIndicator(
                      dotsCount: controller.tabs.length,
                      reversed:
                          langController.defaultLang == 'ar' ? true : false,
                      position: controller.pageIndex.value.toDouble(),
                      decorator: const DotsDecorator(
                        color: Colors.white,
                        activeColor: Colors.indigo,
                        size: Size.square(18.0),
                        activeSize: Size.square(16.0),
                        shape: CircleBorder(
                          side: BorderSide(
                            width: 1.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      onTap: (value) => controller.pageController.animateToPage(
                        value.toInt(),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linearToEaseOut,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextButton.icon(
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: Color.fromARGB(200, 8, 98, 38),
                  ),
                  onPressed: () => controller.onSkip(),
                  label: CommonStyle.commonText(
                      label: 'skip',
                      color: const Color.fromARGB(200, 8, 98, 38),
                      size: 13.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
