import 'package:college_app/app/widgets/login_button.dart';
import 'package:college_app/app/modules/languages_type/views/languages_type_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/start_controller.dart';

class StartView extends GetView<StartController> {
  const StartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            width: 300,
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/png/myCollagepng.png",
                ),
              ),
            ),
          ),
          LanguagesTypeView(
            margin: 38.0,
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 130.0, vertical: 25.0),
            child: LoginButton(
              onPressed: () => controller.start(),
              label: 'start',
              buttonColor: const Color(0xff00A951),
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
