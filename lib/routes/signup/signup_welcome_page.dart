import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../Shared/DAL/Authentication.dart';
import '../../Shared/DAL/PlayerData.dart';
import '../../Shared/Model/user_model.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../main/main_page.dart';
import '../main/my_home_page.dart';
import 'signup_profile_pic_page.dart';
import '../../utils/AppBarBuy.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/generic_ap_bar.dart';
import '../../utils/widgets/logo.dart';

class SignupWelcomePage extends StatefulWidget {
  final bool fromEditProfile;

  SignupWelcomePage({this.fromEditProfile});

  @override
  _SignupWelcomePage createState() => _SignupWelcomePage(fromEditProfile);
}

class _SignupWelcomePage extends State<SignupWelcomePage> {
  bool fromEditProfile;
  String enteredPin;
  bool pinStatus = false;
  bool screenStatus = false;
  _SignupWelcomePage(this.fromEditProfile);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: CustomDrawer(context: context),
      appBar:
          fromEditProfile ? AppBarBuy() : GenericAppBar(showMenu: true, showBackButton: true, showLoginButton: false, showRegButton: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 50),
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                fromEditProfile ? Container() : ChoohooLogo(),
                fromEditProfile
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child:
                            Text("SIGN UP", style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 16)),
                      ),
                _messageContainer(context),
                fromEditProfile == false
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(70, 69, 69, 1),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white)),
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward),
                            iconSize: 22,
                            color: Colors.white,
                            onPressed: () => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => MainPage()),
                              )
                            },
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

  _messageContainer(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double widgetWidth = screenWidth - 80;
    print(screenWidth);
    print(widgetWidth);
    return Center(
        child: Container(
            child: Column(children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: AutoSizeText(
                fromEditProfile ? Localization.stLocalized("welcomeMessageEditProfile") : "You have signed up successfully!",
                textAlign: TextAlign.left,
                style: CTheme.textLight16Yellow(),
              ),
            ),
          ),
        ],
      ),
      fromEditProfile == false
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                    child: AutoSizeText(
                      fromEditProfile ? Localization.stLocalized("emailSentVerifyEditProfile") : "Your Choohoo ID is insert number",
                      style: CTheme.textLight16Yellow(),
                    ),
                  ),
                ),
              ],
            )
          : Container(),
      fromEditProfile == false
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
                    child: AutoSizeText(fromEditProfile ? Localization.stLocalized("checkLinkEditProfile") : "",
                        style: TextStyle(
                            fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 16, fontWeight: FontWeight.w100)),
                  ),
                ),
              ],
            )
          : Container(),
      //Place the text field here to enter the pin
      // fromEditProfile == false
      //     ? Padding(
      //         padding: const EdgeInsets.fromLTRB(16, 15, 15, 0),
      //         child: Form(
      //           child: Column(
      //             children: <Widget>[
      //               Container(
      //                 height: 50,
      //                 child: TextFormField(
      //                   onChanged: (value) {
      //                     setState(() {
      //                       enteredPin = value;
      //                     });
      //                   },
      //                   style: TextStyle(color: Colors.white),
      //                   cursorColor: Colors.white,
      //                   decoration: InputDecoration(
      //                     contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
      //                     hintText: 'Enter the Pin you Received',
      //                     hintStyle: CTheme.textRegular16White(),
      //                     filled: true,
      //                     fillColor: Color.fromRGBO(70, 69, 69, 1),
      //                     focusedBorder: OutlineInputBorder(
      //                       borderRadius: BorderRadius.circular(20),
      //                       borderSide: BorderSide(
      //                         color: Colors.white,
      //                         width: 1,
      //                         style: BorderStyle.solid,
      //                       ),
      //                     ),
      //                     enabledBorder: OutlineInputBorder(
      //                         borderSide: BorderSide(
      //                           color: Colors.white,
      //                           width: 1,
      //                         ),
      //                         borderRadius:
      //                             BorderRadius.all(const Radius.circular(20))),
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      //               screenStatus == true
      //                   ? pinStatus == false
      //                       ? Text("Pin Does Not Match",
      //                           style: CTheme.textLight16Yellow())
      //                       : Container()
      //                   : Container(),
      //               SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      //             ],
      //           ),
      //         ),
      //       )
      //     : Container(),
      SizedBox(height: 70),
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Color.fromRGBO(70, 69, 69, 1),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.all(color: Colors.white)),
        child: IconButton(
            icon: Icon(Icons.arrow_forward),
            iconSize: 22,
            color: Colors.white,
            onPressed: () async {
              Get.to(() => MyHomePage(name: "Name/Nickname"));
              return;
              bool status;

              if (enteredPin == UserModel().verifyAccountPin) {
                await PlayerData.getUserData();
                status = await Authentication.verifyAccount(UserModel().verifyAccountPin);
                if (status == true) {
                  setState(() {
                    screenStatus = true;
                    pinStatus = true;
                  });
                } else {
                  setState(() {
                    screenStatus = true;
                    pinStatus = false;
                  });
                }
              } else if (enteredPin == "" || enteredPin == null) {
                Fluttertoast.showToast(msg: "Please fill in the text field", toastLength: Toast.LENGTH_LONG);
                setState(() {
                  pinStatus = false;
                  screenStatus = true;
                });
              } else {
                setState(() {
                  pinStatus = false;
                  screenStatus = true;
                });
              }
              print(status);
              if (status == true) {
                await Future.delayed(Duration(seconds: 3));
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignupProfilePicPage();
                }));
              }
            }),
      ),
      SizedBox(height: 50),
      //Show the user that you are verified now.
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
      fromEditProfile == false
          ? screenStatus == true && pinStatus == true
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            fromEditProfile
                                ? Localization.stLocalized("profileUpdatedMessage")
                                : Localization.stLocalized("detailsVerified"),
                            style: CTheme.textLight16Yellow(),
                          )),
                    )
                  ],
                )
              : Container()
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 10, 0),
                      child: Text(
                        fromEditProfile ? Localization.stLocalized("profileUpdatedMessage") : Localization.stLocalized("detailsVerified"),
                        style: CTheme.textLight16Yellow(),
                      )),
                )
              ],
            ),
      fromEditProfile == false
          ? screenStatus == true && pinStatus == true
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: //Text(Localization.stLocalized("choohooIdNumber"),
                            Text(
                                "Your Choohoo ID is: ${UserModel().playerModel?.data?.choohooId == null ? "" : UserModel().playerModel?.data?.choohooId}",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Color.fromRGBO(180, 179, 180, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w100)),
                      ),
                    )
                  ],
                )
              : Container()
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: //Text(Localization.stLocalized("choohooIdNumber"),
                        Text("Your Choohoo ID is: ${UserModel().playerModel?.data?.choohooId ?? ""}",
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 16, fontWeight: FontWeight.w100)),
                  ),
                )
              ],
            ),
      fromEditProfile == false
          ? screenStatus == true && pinStatus == true
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: AutoSizeText(Localization.stLocalized("readyToHunt"),
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 16, fontWeight: FontWeight.w100)),
                      ),
                    ),
                  ],
                )
              : Container()
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: AutoSizeText(Localization.stLocalized("readyToHunt"),
                        style: TextStyle(
                            fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 16, fontWeight: FontWeight.w100)),
                  ),
                ),
              ],
            ),
    ])));
  }
}
