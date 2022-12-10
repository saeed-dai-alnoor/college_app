// ignore_for_file: must_be_immutable, file_names

import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  Function() drawerFunction;
  Function() languageFunction;
  String appBarTitle;
  double size;
  HomeAppBar({
    Key? key,
    this.size = 24,
    required this.drawerFunction,
    required this.languageFunction,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 265.0,
        decoration: const BoxDecoration(
          color: CustomColors.primColor,
        ),
        child: SafeArea(
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              ListTile(
                leading: IconButton(
                  onPressed: drawerFunction,
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
                trailing: IconButton(
                  onPressed: languageFunction,
                  icon: const Icon(Icons.language),
                  color: Colors.white,
                ),
              ),
              CommonStyle.commonText(
                label: appBarTitle,
                color: Colors.white,
                size: size,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
