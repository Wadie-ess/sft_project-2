import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/CColors.dart';
import '../constants/CTheme.dart';
import '../routes/main/my_home_page.dart';

class AppBarBuy extends StatefulWidget implements PreferredSizeWidget {
  const AppBarBuy({Key key}) : super(key: key);

  @override
  _AppBarBuyState createState() => _AppBarBuyState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55);
}

class _AppBarBuyState extends State<AppBarBuy> {
  SharedPreferences _pref;
  bool nickName;
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      _pref = value;
      // setState(() {
      //   nickName = _pref.getBool('nickname') ?? false;
      // });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CColor.appBlackLight,
      titleSpacing: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          /*    SizedBox(width: 10),
          InkWell(
            onTap: () => {
              scaffoldKey.currentState.openDrawer(),
            },
            child: Icon(Icons.menu),
          ),
          SizedBox(width: 10),*/
          InkWell(
            onTap: () => {Navigator.pop(context)},
            child: Icon(Icons.arrow_back),
          ),
          SizedBox(width: 16),
          InkWell(
            onTap: () => {Get.to(() => MyHomePage(name: "Name/Nickname"))},
            child: SvgPicture.asset(
              "assets/svg-icons/half-moon.svg",
            ),
          ),
        ],
      ),
      automaticallyImplyLeading: true,
      centerTitle: true,
      actions: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _pref.setBool('nickname', !nickName);
                    nickName = _pref.getBool('nickname');
                  });
                },
                child: Text(
                  "Hi Name/Nickname",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55);
}
