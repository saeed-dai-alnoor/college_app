import 'package:flutter/material.dart';

class Layout {
  static double getAppHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
  static double getAppWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
