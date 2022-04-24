import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Shared/Model/user_model.dart';
import '../routes/login/login_page.dart';
import 'HandleNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutDialog {
// Ask for logout dialog
  static Future<void> logoutDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Platform.isIOS
              ? CupertinoAlertDialog(
                  content: Text("Are you sure you want to Logout from Choohoo?"),
                  actions: [
                    CupertinoButton(
                        child: Text('Yes'),
                        onPressed: () {
                          logoutClearData(context);
                        }),
                    CupertinoButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.pop(context, true);
                        }),
                  ],
                )
              : AlertDialog(
                  content: Text("Are you sure you want to Logout from Choohoo?"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          logoutClearData(context);
                        },
                        child: Text('Yes')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('No')),
                  ],
                );
        });
  }

  // Clear all Shared Preferences and local data when logout
  static Future<void> logoutClearData(BuildContext context) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    UserModel().email = null;
    UserModel().password = null;
    _prefs.setString("token", "");
    HandleNavigation.appExitCheck = true;
    Navigator.pop(context);
    Get.to(() => LoginPage());
  }
}
