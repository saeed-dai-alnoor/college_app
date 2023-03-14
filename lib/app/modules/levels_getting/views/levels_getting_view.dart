import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/widgets/common_methods.dart';
import 'package:college_app/app/widgets/login_button.dart';
import 'package:college_app/app/widgets/screens_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:pluto_grid/pluto_grid.dart';
import '../controllers/levels_getting_controller.dart';

class LevelsGettingView extends GetView<LevelsGettingController> {
  const LevelsGettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: controller.isLoading.value,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: ScreensAppBar(title: 'levels'),
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 30.0,
                  ),
                  child: FutureBuilder(
                    future: controller.getLevels(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (controller.empty.value) {
                        return Center(
                          child: CommonStyle.commonText(
                            label: 'messageForEmptyTable',
                            color: Colors.black,
                            size: 18.0,
                          ),
                        );
                      } else {
                        return snapshot.hasData
                            ? PlutoGrid(
                                columns: controller.columns,
                                rows: controller.rows,
                              )
                            : const Center();
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        LoginButton(
                          onPressed: () => CommonMethods.createLevel(context),
                          label: 'addLevel',
                          buttonColor: const Color(0xff00BB9F),
                          textColor: Colors.white,
                        ),
                        LoginButton(
                          onPressed: () => CommonMethods.updateLevel(context),
                          label: 'updateLevel',
                          buttonColor: Colors.blueGrey,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    LoginButton(
                      onPressed: () => CommonMethods.deleteLevel(context),
                      label: 'deleteLevel',
                      buttonColor: const Color.fromARGB(255, 213, 41, 29),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
