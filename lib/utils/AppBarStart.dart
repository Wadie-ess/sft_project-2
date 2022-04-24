// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/CColors.dart';
import '../routes/login/login_page.dart';
import '../routes/signup/signup_1.dart';

class AppBarStart extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CColor.appGreyDark,
      titleSpacing: 0.0,
      automaticallyImplyLeading: true,
      centerTitle: true,
      actions: <Widget>[
        FlatButton(
          color: CColor.appGreyDark,
          textColor: Colors.white,
          padding: EdgeInsets.all(2.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
            debugPrint('Login Clicked');
          },
          child: Text(
            "LOGIN",
            style: GoogleFonts.roboto(
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: FlatButton(
            color: CColor.appGreyDark,
            textColor: Colors.white,
            padding: EdgeInsets.all(2.0),
            onPressed: () {
              Get.to(SignUp1(), transition: Transition.rightToLeft, duration: Duration(milliseconds: 500));
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp1()),
              );*/
              debugPrint('Sign Up Clicked');
            },
            child: Text(
              "SIGN UP",
              style: GoogleFonts.roboto(
                fontSize: 20,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}
