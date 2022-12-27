// ignore_for_file: file_names

import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/core/themes/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// ignore: must_be_immutable
class ScreensAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  double height;
  bool back;
  ScreensAppBar(
      {Key? key, required this.title, this.height = 120.0, this.back = true})
      : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: back
          ? IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_sharp),
            )
          : null,
      title: CommonStyle.commonText(
        label: title,
        size: 19.0,
      ),
      centerTitle: true,
      toolbarHeight: height,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(Layout.getAppWidth(context), 30.0),
        ),
      ),
    );
  }
}
