import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Shared/DAL/PlayerData.dart';
import '../constants/CColors.dart';
import '../routes/appPromoCode/app_promo_code.dart';
import '../routes/codes/code_page.dart';
import '../routes/contactUs/contact_us_menu_page.dart';
import '../routes/legal/legal_page.dart';
import '../routes/main/my_home_page.dart';
import '../routes/moneyGiftRecipients/money_gift_recipients_page.dart';
import '../routes/myMoneyGiftRewards/my_money_gift_rewards.dart';
import '../routes/mySFTs/my_sfts.dart';
import '../routes/notification/notification_page.dart';
import '../routes/profile/view_user_profile_page.dart';
import '../routes/publicBenifit/public_benifit_list_page.dart';
import '../routes/receipts/receipt_page.dart';
import '../routes/story/about_choohoo.dart';
import '../routes/technicalUpdate/technical_update.dart';
import 'LogoutDialog.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import "package:http/http.dart" as http;

class CustomDrawer extends StatefulWidget {
  CustomDrawer({this.context});
  final context;

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Future<void> getPlayerData() async {
    await PlayerData.getUserData();
    if (mounted) {
      setState(() {});
    }
  }

  // Future<void> getMyGameUnitsQuantity() async {
  //   await MyGameUnitsQuantityData.myGameUnitsQuantity();
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  // Future<void> getMyGameUnitsHistory() async {
  //   await MyGameUnitsHistoryData.myGameUnitsHistory();
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  // Future<void> getCurrentGameUnitPrice() async {
  //   await GetCurrentGameUnitPriceData.getCurrentGameUnitPriceData();
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  DateTime currentDate = new DateTime.now();
  final dateFormatTime = new DateFormat.Hm();
  var county = "Country";
  var city = "Your";

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        return Future.error('Location permissions are denied (actual value: $permission).');
      }
    }

    await Geolocator.getCurrentPosition().then((value) => {
          http
              .get(Uri.parse(
                  "https://nominatim.openstreetmap.org/reverse?format=json&lat=${value.latitude}&lon=${value.longitude}&zoom=18&addressdetails=1"))
              .then((http.Response response) {
            print(response.body);
            print(value.latitude);
            print(value.longitude);
            if (response.statusCode == 200) {
              setState(() {
                county = ((json.decode(response.body))['address']['country']);
                city = ((json.decode(response.body))['address']['city']);
                if (city == null) {
                  city = ((json.decode(response.body))['address']['village']);
                  if (city == null) {
                    city = "";
                  } else {
                    city = "$city,";
                  }
                } else {
                  city = "$city,";
                }
              });
            }
          }).catchError((error) {
            print(error.toString());
          })
        });
  }

  String setup() {
    tz.initializeTimeZones();
    var detroit = tz.getLocation('Africa/Johannesburg');
    var now = tz.TZDateTime.now(detroit);
    print(dateFormatTime.format(now));
    return dateFormatTime.format(now);
  }

  @override
  Widget build(context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: CColor.appBlackLight,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.to(() => MyHomePage(name: "Name/Nickname"));
                        },
                        child: Container(
                          width: 100,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Home",
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          Navigator.of(context).pop();
                          Get.to(() => ViewUserProfilePage());
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ViewUserProfilePage()));
                        },
                        child: Badge(
                          badgeContent: Text('  '),
                          position: BadgePosition(top: -10, end: -12),
                          child: Container(
                            child: Text(
                              "Profile",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.to(() => NotificationPage());
                        },
                        child: Badge(
                          alignment: Alignment.centerLeft,
                          badgeContent: Text('  '),
                          position: BadgePosition(top: -10, end: -12),
                          child: Container(
                            child: Text(
                              "Notifications",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                    //   child: InkWell(
                    //     onTap: () async {
                    //       // await getMyGameUnitsQuantity();
                    //       // await getMyGameUnitsHistory();
                    //       // await getCurrentGameUnitPrice();
                    //       Navigator.push(
                    //           context, MaterialPageRoute(builder: (context) => BuyGameUnitsPage()));
                    //     },
                    //     child: Container(
                    //       child: Row(
                    //         children: <Widget>[
                    //           Expanded(
                    //             child: Text(
                    //               "Buy or Load Game Units",
                    //               style: TextStyle(color: Colors.white, fontSize: 16),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.pop(context);
                    //
                    //       Navigator.push(
                    //           context, MaterialPageRoute(builder: (context) => MyHuntsPage()));
                    //     },
                    //     child: Container(
                    //       child: Row(
                    //         children: <Widget>[
                    //           Expanded(
                    //             child: Text(
                    //               "My Hunts",
                    //               style: TextStyle(color: Colors.white, fontSize: 16),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.pop(context);
                    //       Navigator.push(context,
                    //           MaterialPageRoute(builder: (context) => MyPointsLeaderBoardPage()));
                    //     },
                    //     child: Container(
                    //       child: Row(
                    //         children: <Widget>[
                    //           Expanded(
                    //             child: Text(
                    //               "My Points and Leaderboard",
                    //               style: TextStyle(color: Colors.white, fontSize: 16),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(
                    //           context, MaterialPageRoute(builder: (context) => ResellerPage()));
                    //     },
                    //     child: Container(
                    //       child: Row(
                    //         children: <Widget>[
                    //           Expanded(
                    //             child: Text(
                    //               "Resellers",
                    //               style: TextStyle(color: Colors.white, fontSize: 16),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(
                    //           context, MaterialPageRoute(builder: (context) => BookPrivatePage()));
                    //     },
                    //     child: Container(
                    //       child: Row(
                    //         children: <Widget>[
                    //           Expanded(
                    //             child: Text(
                    //               "Booking & Team Building",
                    //               style: TextStyle(color: Colors.white, fontSize: 16),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(
                    //           context, MaterialPageRoute(builder: (context) => StoryPage()));
                    //     },
                    //     child: Container(
                    //       child: Row(
                    //         children: <Widget>[
                    //           Expanded(
                    //             child: Text(
                    //               "Our Story",
                    //               style: TextStyle(color: Colors.white, fontSize: 16),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                    //   child: InkWell(
                    //     onTap: () {
                    //       Navigator.push(
                    //           context, MaterialPageRoute(builder: (context) => HowToPlayPage()));
                    //     },
                    //     child: Container(
                    //       child: Row(
                    //         children: <Widget>[
                    //           Expanded(
                    //             child: Text(
                    //               "How To Play, Details & Rules",
                    //               style: TextStyle(color: Colors.white, fontSize: 16),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.to(() => MySFTsPage());
                        },
                        child: Badge(
                          alignment: Alignment.centerLeft,
                          badgeContent: Text('  '),
                          position: BadgePosition(top: -10, end: -12),
                          child: Container(
                            child: Text(
                              "My SFTs",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.to(() => MyMoneyGiftRewards());
                        },
                        child: Badge(
                          alignment: Alignment.centerLeft,
                          badgeContent: Text('  '),
                          position: BadgePosition(top: -10, end: -12),
                          child: Container(
                            child: Text(
                              "My Money-Rewards",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.to(() => CodePage());
                        },
                        child: Badge(
                          alignment: Alignment.centerLeft,
                          badgeContent: Text('  '),
                          position: BadgePosition(top: -10, end: -12),
                          child: Container(
                            child: Text(
                              "Special & Super Special Codes",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.to(() => PublicBenifitsListPage());
                        },
                        child: Badge(
                          alignment: Alignment.centerLeft,
                          badgeContent: Text('  '),
                          position: BadgePosition(top: -10, end: -12),
                          child: Container(
                            child: Text(
                              "SFTs & Public Benefits",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.to(() => MoneyGiftRecipientsPage());
                        },
                        child: Badge(
                          alignment: Alignment.centerLeft,
                          badgeContent: Text('  '),
                          position: BadgePosition(top: -10, end: -12),
                          child: Container(
                            child: Text(
                              "Money-Reward Recipients",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.to(() => ReceiptPage());
                        },
                        child: Badge(
                          alignment: Alignment.centerLeft,
                          badgeContent: Text('  '),
                          position: BadgePosition(top: -10, end: -12),
                          child: Container(
                            child: Text(
                              "Receipts",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.to(() => AboutChoohoo());
                        },
                        child: Badge(
                          alignment: Alignment.centerLeft,
                          badgeContent: Text('  '),
                          position: BadgePosition(top: -10, end: -12),
                          child: Container(
                            child: Text(
                              "About Choohoo",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.to(() => ContactUsMenuPage());
                        },
                        child: Badge(
                          alignment: Alignment.centerLeft,
                          badgeContent: Text('  '),
                          position: BadgePosition(top: -10, end: -12),
                          child: Container(
                            child: Text(
                              "Contact Us & FAQ",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.to(() => TechnicalUpdatePage());
                        },
                        child: Badge(
                          alignment: Alignment.centerLeft,
                          badgeContent: Text('  '),
                          position: BadgePosition(top: -10, end: -12),
                          child: Container(
                            child: Text(
                              "Technical Update",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.to(() => LegalPage());
                        },
                        child: Badge(
                          alignment: Alignment.centerLeft,
                          badgeContent: Text('  '),
                          position: BadgePosition(top: -10, end: -12),
                          child: Container(
                            child: Text(
                              "Legal v1.01",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Time in South Africa: " + setup(),
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Time in $city $county: ${dateFormatTime.format(currentDate)}",
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 30, 0, 35),
                      child: InkWell(
                        onTap: () {
                          LogoutDialog.logoutDialogBox(context);
                        },
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Logout",
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Badge(
                        badgeContent: Text('  '),
                        position: BadgePosition(top: -2, end: -2),
                        child: Container(
//                      width: 103,
//                      height: 35,
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0), side: BorderSide(color: Colors.white)),
                            color: CColor.appBlackLight,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(6.0),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AppPromoCodePage()));
                            },
                            child: Text(
                              "  App Promo Code  ",
                              style: GoogleFonts.roboto(
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
