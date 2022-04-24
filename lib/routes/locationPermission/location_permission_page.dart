import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world/routes/onboarding/onboarding_view.dart';

import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../services/location_service.dart';
import '../main/main_page.dart';
import '../main/my_home_page.dart';

class LocationPermissionPage extends StatefulWidget {
  @override
  _LocationPermissionPage createState() => _LocationPermissionPage();
}

class _LocationPermissionPage extends State<LocationPermissionPage> {
  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 110, 0, 0),
                  child: Container(
                    height: 80,
                   width: Get.width * 0.35,
                    child: SvgPicture.asset('assets/onboarding/logo-white.svg'),
                      
                    
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0, 110, 0, 0),
                //   child: Container(
                //     height: 80,
                //     width: 180,
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: AssetImage('assets/splash/chohoo_img.png'),
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                //   child: Text("it's for yoo hoo",
                //       textAlign: TextAlign.center,
                //       style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 24, fontWeight: FontWeight.w300)),
                // ),
                Padding(
                  padding: EdgeInsets.fromLTRB(54, 44, 54, 0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("This app cannot be fully used without accessing the location, notifications and camera on your device…",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w200,
                          color: CColor.appYellow,
                          fontSize: 14,
                        )),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: CColor.appYellow,
                                )),
                            child: Checkbox(
                                activeColor: Colors.black,
                                checkColor: CColor.appYellow,
                                value: allowVal,
                                onChanged: (bool value) async {
                                  if (value == true) {
                                    setState(() {
                                      blockVal = false;
                                    });
                                    bool locationGot = await LocationService().setLocation(context);
                                    if (locationGot) {
                                      setState(() {
                                        allowVal = value;
                                      });
                                      SharedPreferences _prefs = await SharedPreferences.getInstance();
                                      String auth = _prefs.getString('token');
                                      auth == null || auth == ""
                                          ? Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) => MyHomePage()),
                                            )
                                          : Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) => MainPage()),
                                            );
                                    } else {
                                      allowVal = false;
                                    }
                                  } else {
                                    setState(() {
                                      blockVal = true;
                                    });
                                  }
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              'Allow',
                              style: TextStyle(
                                  color: CColor.appYellow, fontSize: 14, fontFamily: CTheme.defaultFont(), fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: CColor.appYellow,
                                  )),
                              child: Checkbox(
                                  activeColor: Colors.black,
                                  checkColor: CColor.appYellow,
                                  value: blockVal,
                                  onChanged: (bool value) {
                                    setState(() {
                                      blockVal = value;
                                    });
                                    if (value == true) {
                                      setState(() {
                                        allowVal = false;
                                      });
                                    } else {
                                      setState(() {
                                        allowVal = true;
                                      });
                                    }
                                  }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              'Block',
                              style: TextStyle(
                                  color: CColor.appYellow, fontSize: 14, fontFamily: CTheme.defaultFont(), fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
