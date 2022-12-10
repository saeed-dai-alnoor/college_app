// ignore_for_file: file_names, must_be_immutable

import 'package:college_app/app/core/themes/common_style.dart';
import 'package:college_app/app/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  String image;
  String title;
  Function() onpressed;
  GridCard({
    Key? key,
    required this.image,
    required this.title,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(4.0),
      onPressed: onpressed,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffCCDEDC),
          borderRadius: BorderRadius.circular(25.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 18 / 11,
                      child: Image.asset('assets/images/png/$image.png'),
                    ),
                    const SizedBox(height: 8.0),
                    CommonStyle.commonText(
                        label: title, size: 14.0, color: CustomColors.primColor)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
