import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Shared/Model/user_model.dart';
import '../constants/CTheme.dart';
import '../routes/main/my_home_page.dart';

class AppBarMain extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool main;

  AppBarMain({this.scaffoldKey, this.main});

  @override
  _AppBarMainState createState() => _AppBarMainState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55);
}

class _AppBarMainState extends State<AppBarMain> {
  SharedPreferences _pref;
  bool nickName;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      _pref = value;
      setState(() {
        nickName = _pref.getBool('nickname') ?? false;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(112, 112, 112, 1),
      titleSpacing: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          /*  IconButton(
            icon: Icon(Icons.menu),
            iconSize: 40,
            color: Colors.white,
            onPressed: () => widget.scaffoldKey.currentState.openDrawer(),
          ),*/
          widget.main ?? false
              ? SizedBox()
              : Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () => {Navigator.pop(context)},
                      child: Icon(Icons.arrow_back),
                    ),
                    /*IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        // if (widget.main ?? false) {
                        // CTheme.showAppAlert(
                        //     context: context,
                        //     title: "Choohoo",
                        //     bodyText: "Do you want to Close the Application?",
                        //     btnTitle: "Okay",
                        //     negativeButtonHandler: (_) {
                        //       Navigator.pop(context);
                        //     },
                        //     positiveButtonHandler: (_) {
                        //       Future.delayed(const Duration(milliseconds: 1000), () {
                        //         SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                        //       });
                        //     });
                        // } else {
                        Navigator.pop(context);
                        // }
                      },
                    ),*/
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
                    UserModel().playerModel == null
                        ? ''
                        : "Hi ${nickName ?? false ? UserModel().playerModel.data.playerNicknameAlias : UserModel().playerModel.data.name}",
                    style: CTheme.textRegular14White()),
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
