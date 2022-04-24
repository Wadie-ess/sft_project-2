import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/CColors.dart';
import '../../services/location_service.dart';
import '../../utils/AppBarMain.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/HandleNavigation.dart';
import '../digitalWorldHunt/digital_world_hunt_page.dart';
import '../privateWorldHunt/private_hunts_page.dart';
import '../realWorldHunt/real_world_hunt_page.dart';

class ChooseHuntPage extends StatefulWidget {
  @override
  _ChooseHuntPage createState() => _ChooseHuntPage();
}

class _ChooseHuntPage extends State<ChooseHuntPage> {
  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;

  bool locationEnable = false;

  get scaffoldKey => null;

  @override
  void initState() {
    super.initState();
    LocationService().allRequirePermissionGranted().then((value) {
      setState(() {
        locationEnable = value;
      });
    });
    HandleNavigation.appExitCheck = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarMain(scaffoldKey: scaffoldKey),
      drawer: CustomDrawer(context: context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                    height: 80,
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/splash/chohoo_img.png'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text("      if yoo find it,\n   it's for yoo hoo   ",
                      style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300)),
                ),

                Visibility(
                  visible: !locationEnable,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                              "  This game cannot be played without\n  "
                              "accessing the location on your device...",
                              style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(235, 244, 17, 1), fontSize: 14)),
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
                                        color: Color.fromRGBO(235, 244, 17, 1),
                                      )),
                                  child: Checkbox(
                                      activeColor: Colors.black,
                                      checkColor: Color.fromRGBO(235, 244, 17, 1),
                                      value: allowVal,
                                      onChanged: (bool value) async {
                                        if (value == true) {
                                          bool locationGot = await LocationService().setLocation(context);

                                          if (locationGot) {
                                            setState(() {
                                              allowVal = value;
                                              locationEnable = true;
                                            });
                                          } else {
                                            allowVal = false;
                                          }
                                        } else {
                                          setState(() {
                                            allowVal = value;
                                          });
                                        }
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    'Allow',
                                    style: TextStyle(
                                      color: CColor.appYellow,
                                    ),
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
                                          color: Color.fromRGBO(235, 244, 17, 1),
                                        )),
                                    child: Checkbox(
                                        activeColor: Colors.black,
                                        checkColor: Color.fromRGBO(235, 244, 17, 1),
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
                                      color: Color.fromRGBO(235, 244, 17, 1),
                                    ),
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

                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                  child: Text(
                    "HUNT OPTIONS | CHOOSE & CRACK RIDDLE",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromRGBO(180, 179, 180, 1), fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
                    height: 85,
                    width: 205,
                    child: FlatButton(
                      shape:
                          new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0), side: BorderSide(color: Colors.white)),
                      color: Color.fromRGBO(70, 69, 69, 1),
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      onPressed: () async {
                        Get.to(() => RealWorldHuntPage());
                        /*bool status = await GetHunts.getHuntsData("RW");
                        print("Realword hunt click : $status");
                        status == true
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RealWorldHuntPage()),
                              )
                            : Fluttertoast.showToast(
                                msg: "No Hunts Available Right Now",
                                toastLength: Toast.LENGTH_LONG);*/
                      },
                      child: Center(
                        child: Text(
                          "REAL WORLD\n      HUNTS",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
                    height: 85,
                    width: 205,
                    child: FlatButton(
                      shape:
                          new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0), side: BorderSide(color: Colors.white)),
                      color: Color.fromRGBO(70, 69, 69, 1),
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      onPressed: () async {
                        Get.to(() => DigitalWorldHuntPage());
                        /*bool status = await GetHunts.getHuntsData("DW");
                        status == true
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DigitalWorldHuntPage()),
                              )
                            : Fluttertoast.showToast(
                                msg: "No Hunts Available Right Now",
                                toastLength: Toast.LENGTH_LONG);*/
                      },
                      child: Center(
                        child: Text(
                          "DIGITAL WORLD\n        HUNTS",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                  child: Container(
                    height: 85,
                    width: 205,
                    child: FlatButton(
                      shape:
                          new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0), side: BorderSide(color: Colors.white)),
                      color: Color.fromRGBO(70, 69, 69, 1),
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PrivateHuntsPage()),
                        );
                      },
                      child: Text(
                        "PRIVATE\n HUNTS",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
//    )

//              Padding(
//                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//                child: Row(
//                  children: <Widget>[              // [Monday] checkbox
//                    Column(
//                      children: <Widget>[
//                        Text("Mon"),
//                        Checkbox(
//                          checkColor: Colors.yellow,
//                          value: monVal,
//                          onChanged: (bool value) {
//                            setState(() {
//                              monVal = value;
//                            });
//                          },
//                        ),
//                      ],
//                    ),              // [Tuesday] checkbox
//                    Column(
//                      children: <Widget>[
//                        Text("Tu"),
//                        Checkbox(
//                          value: tuVal,
//                          onChanged: (bool value) {
//                            setState(() {
//                              tuVal = value;
//                            });
//                          },
//                        ),
//                      ],
//                    ),              // [Wednesday] checkbox
//                  ],
//                ),
//              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
