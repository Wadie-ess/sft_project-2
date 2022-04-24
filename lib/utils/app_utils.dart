import 'package:flutter/material.dart';

class AppUtils {
  static circularBoxDecoration({Color background, Color border}) => BoxDecoration(
        border: Border.all(color: border, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(20),
        color: background,
      );

  bool isScreenWidthGreater() {
    return true;
  }
}
