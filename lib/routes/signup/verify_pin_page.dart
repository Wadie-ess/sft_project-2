import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';
import '../profile/view_user_profile_page.dart';
import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import 'signup_welcome_page.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/generic_ap_bar.dart';
import '../../utils/widgets/logo.dart';

enum FromPage {
  Signup,
  ProfileEdit,
  PasswordUpdate,
}

class VerifyPinPage extends StatefulWidget {
  final FromPage sourcePage;

  const VerifyPinPage({Key key, this.sourcePage = FromPage.Signup}) : super(key: key);

  @override
  _VerifyPinPageState createState() => _VerifyPinPageState();
}

class _VerifyPinPageState extends State<VerifyPinPage> {
  String enterPin;
  bool pinNotMatch = true;
  bool pinMatch = false;

  Map<FromPage, String> _titles = {
    FromPage.Signup: 'SIGN UP',
    FromPage.ProfileEdit: 'UPDATE PROFILE DETAILS',
    FromPage.PasswordUpdate: 'UPDATE PASSWORD DETAILS',
  };

  Map<FromPage, String> _message = {
    FromPage.Signup: 'Your details have been verified.',
    FromPage.ProfileEdit: 'Your updated details have been verified.',
    FromPage.PasswordUpdate: 'Your Pin has been verified.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: CustomDrawer(context: context),
      appBar: GenericAppBar(showMenu: true, showBackButton: true, showLoginButton: false, showRegButton: false),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 50),
          child: Column(
            children: [
              ChoohooLogo(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Text(
                  _titles[widget.sourcePage],
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color.fromRGBO(180, 179, 180, 1),
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Text(
                  Localization.stLocalized("welcomeMessage"),
                  textAlign: TextAlign.center,
                  style: CTheme.textLight16Yellow(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  Localization.stLocalized("emailSentVerify"),
                  textAlign: TextAlign.center,
                  style: CTheme.textLight16Yellow(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  Localization.stLocalized("checkLink"),
                  textAlign: TextAlign.center,
                  style: CTheme.textLight16Yellow(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: PinPut(
                  fieldsCount: 6,
                  eachFieldHeight: 48,
                  eachFieldWidth: 48,
                  separator: SizedBox(width: 6),
                  onSubmit: (String pin) => print("Pin: $pin"),
                  submittedFieldDecoration: BoxDecoration(
                    color: CColor.appBlackLight,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  selectedFieldDecoration: BoxDecoration(
                    color: CColor.appBlackLight,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  followingFieldDecoration: BoxDecoration(
                    color: CColor.appBlackLight,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                ),
                // child: Container(
                //   height: 50,
                //   child: TextFormField(
                //     onChanged: (value) => enterPin = value,
                //     style: TextStyle(color: Colors.white),
                //     cursorColor: Colors.white,
                //     decoration: InputDecoration(
                //       contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                //       hintText: 'Enter Pin',
                //       hintStyle: TextStyle(color: Colors.white),
                //       filled: true,
                //       fillColor: Color.fromRGBO(70, 69, 69, 1),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //         borderSide: BorderSide(
                //           color: Colors.white,
                //           width: 1,
                //           style: BorderStyle.solid,
                //         ),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //           borderSide: BorderSide(
                //             color: Colors.white,
                //             width: 1,
                //           ),
                //           borderRadius:
                //               BorderRadius.all(const Radius.circular(20))),
                //     ),
                //   ),
                // ),
              ),

              // Visibility(
              //   visible: pinNotMatch ?? false,
              //   child: Container(
              //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //     child: Text(
              //       Localization.stLocalized("Pin Does Not Match"),
              //       textAlign: TextAlign.center,
              //       style: CTheme.textLight16Yellow(),
              //     ),
              //   ),
              // ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Text(
                  _message[widget.sourcePage],
                  textAlign: TextAlign.center,
                  style: CTheme.textLight16Yellow(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
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
                      bool status;
                      if (widget.sourcePage == FromPage.Signup) {
                        Get.to(() => SignupWelcomePage(fromEditProfile: false));
                      } else {
                        Get.to(() => ViewUserProfilePage());
                      }
                      /*if (enterPin == UserModel().verifyAccountPin) {
                        await PlayerData.getUserData();
                        status = await Authentication.verifyAccount(
                            UserModel().verifyAccountPin);
                        if (status == true) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SignupProfilePicPage()));
                          setState(() {
                            pinMatch = true;
                          });
                        }
                      } else if (enterPin == "" || enterPin == null) {
                        Fluttertoast.showToast(
                            msg: "Please fill in the text field",
                            toastLength: Toast.LENGTH_LONG);
                        setState(() {
                          pinMatch = false;
                        });
                      } else {
                        setState(() {
                          pinNotMatch = true;
                          pinMatch = false;
                        });
                      }*/
                    }),
              ),
              SizedBox(height: 50),
            ],
          )),
    );
  }
}
