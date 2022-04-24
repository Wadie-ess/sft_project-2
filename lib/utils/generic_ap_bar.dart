// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/CColors.dart';
import '../routes/login/login_page.dart';
import '../routes/main/my_home_page.dart';
import '../routes/signup/signup_1.dart';

class GenericAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool showMenu;
  final bool showBackButton;
  final bool showLoginButton;
  final bool showRegButton;
  final String name;

  const GenericAppBar({Key key, this.showMenu, this.showBackButton, this.showLoginButton, this.showRegButton, this.name}) : super(key: key);

  @override
  State<GenericAppBar> createState() => _GenericAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55);
}

class _GenericAppBarState extends State<GenericAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CColor.appGreyDark,
      titleSpacing: 0.0,
      automaticallyImplyLeading: true,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          /* if (widget.showMenu)
            IconButton(
              padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () => scaffoldKey.currentState.openDrawer(),
            ),*/

          if (widget.showBackButton)
            InkWell(
              onTap: () => {Navigator.pop(context)},
              child: Icon(Icons.arrow_back),
            ),
          SizedBox(width: 16),
          InkWell(
            onTap: () => {
              Get.to(
                () => MyHomePage(name: "Name/Nickname"),
              ),
            },
            child: SvgPicture.asset(
              "assets/svg-icons/half-moon.svg",
            ),
          ),
          Spacer(),
          if (widget.name != null)
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Text(
                "Hi " + widget.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          if (widget.name == null && widget.showLoginButton)
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
          if (widget.name == null && widget.showRegButton)
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: FlatButton(
                color: CColor.appGreyDark,
                textColor: Colors.white,
                padding: EdgeInsets.all(2.0),
                onPressed: () {
                  Get.to(SignUp1(), transition: Transition.rightToLeft, duration: Duration(milliseconds: 500));
                  debugPrint('Sign Up Clicked');
                },
                child: Text(
                  "SIGN UP",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
        ],
      ),
      actions: <Widget>[],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}
