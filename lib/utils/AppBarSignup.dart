import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../routes/main/my_home_page.dart';

class AppBarSignup extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(112, 112, 112, 1),
      titleSpacing: 0.0,
      title: Stack(
        children: <Widget>[
          Container(
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
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
//                Positioned(
//                  top: 12.0,
//                  right: 10.0,
//                  width: 10.0,
//                  height: 10.0,
//                  child: Container(
//                    decoration: BoxDecoration(
//                      shape: BoxShape.circle,
//                      color: Colors.black,
//                    ),
//                  ),
//                )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 55,
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      automaticallyImplyLeading: true,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}
