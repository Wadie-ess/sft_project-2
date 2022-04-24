import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/AlertBox.dart';
import 'CColors.dart';

class CTheme {
  static defaultFont() => "Roboto";

  static textRegular16White() =>
      TextStyle(fontFamily: CTheme.defaultFont(), fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w400);

  static textLight16White() => TextStyle(fontFamily: CTheme.defaultFont(), fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w200);

  static textRegular14White() =>
      TextStyle(fontFamily: CTheme.defaultFont(), fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.w400);

  static textLight16Yellow() =>
      TextStyle(fontFamily: CTheme.defaultFont(), fontSize: 16.sp, color: Colors.yellowAccent, fontWeight: FontWeight.w200);

  static textRegular16DarkGrey() =>
      TextStyle(fontFamily: CTheme.defaultFont(), fontSize: 13.sp, color: Color.fromRGBO(70, 69, 69, 1), fontWeight: FontWeight.w400);

  static textRegular16LightGrey() =>
      TextStyle(fontFamily: CTheme.defaultFont(), fontSize: 16.sp, color: CColor.appGreyLight, fontWeight: FontWeight.w400);

  static textRegular16Black() =>
      TextStyle(fontFamily: CTheme.defaultFont(), fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.w400);

  static textRegular14Black() =>
      TextStyle(fontFamily: CTheme.defaultFont(), fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w400);

  static textRegular12Black() =>
      TextStyle(fontFamily: CTheme.defaultFont(), fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.w400);

  static textLight14Black() => TextStyle(fontFamily: CTheme.defaultFont(), fontSize: 13.sp, color: Colors.black, fontWeight: FontWeight.w200);

  static textLight16Black() => TextStyle(fontFamily: CTheme.defaultFont(), fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.w200);

  static textLight11Black() => TextStyle(fontFamily: CTheme.defaultFont(), fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.w200);

  static textBold12LightGrey() =>
      TextStyle(fontFamily: CTheme.defaultFont(), fontSize: 12.sp, color: CColor.appGreyLight, fontWeight: FontWeight.w700);

  static textRegular12LightGrey() =>
      TextStyle(fontFamily: CTheme.defaultFont(), fontSize: 12.sp, color: CColor.appGreyLight, fontWeight: FontWeight.w400);

  static textItalic12LightGrey() => TextStyle(
      fontFamily: CTheme.defaultFont(), fontSize: 12.sp, color: CColor.appGreyLight, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic);

  static textLight18Black() => TextStyle(
      fontFamily: CTheme.defaultFont(), fontSize: 18.sp, color: CColor.appGreyDark, fontWeight: FontWeight.w200, fontStyle: FontStyle.normal);

  static void showAppAlert(
      {BuildContext context,
      String title,
      String bodyText,
      String btnTitle,
      EWPAlertHandler positiveButtonHandler,
      EWPAlertHandler negativeButtonHandler,
      bool barrierDismissible = true,
      bool forNotification = false}) {
    showDialog(
        context: context,
        builder: (context) => CloseAlertDialog(
              title: title,
              actions: [
                EWPAlertAction(title: "Cancel", handler: negativeButtonHandler),
                EWPAlertAction(title: "Okay", handler: positiveButtonHandler)
              ],
              description: bodyText,
              error: forNotification,
            ),
        barrierDismissible: barrierDismissible);
  }
}
