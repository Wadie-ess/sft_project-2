import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Shared/DAL/Authentication.dart';
import '../../Shared/Model/user_model.dart';
import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../main/my_home_page.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/generic_ap_bar.dart';
import 'update_pass_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPage createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;
  bool emailStatus = false;
  bool screenStatus = false;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: CustomDrawer(context: context),
      appBar: GenericAppBar(showMenu: true, showBackButton: true, showLoginButton: false, showRegButton: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 50),
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                    height: 70,
                    width: 180,
                    child: SvgPicture.asset('assets/onboarding/logo-white.svg'),
                      
                    
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Text(
                    "FORGOT PASSWORD & LOGIN DETAILS",
                    style: CTheme.textRegular16LightGrey(),
                  ),
                ),
                // SizedBox(height: 15),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 20),
                //   child: Text(
                //       "Please enter your email address to reset your Choohoo password",
                //       style: CTheme.textLight16Yellow()),
                // ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 15, 15, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: TextFormField(
                            onChanged: (value) {
                              UserModel().email = value;
                              print(value);
                            },
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                              hintText: 'Enter email to reset your password',
                              hintStyle: CTheme.textRegular16White(),
                              filled: true,
                              fillColor: CColor.appBlackLight,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.all(const Radius.circular(20))),
                            ),
                          ),
                        ),
                        screenStatus == true
                            ? Padding(
                                padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
                                child: emailStatus == false
                                    ? Text(
                                        "The email address you have entered does not "
                                        "match any of the email addresses in our"
                                        " system.",
                                        style: CTheme.textLight16Yellow())
                                    : Text(
                                        "An email  has  been sent  to you  to reset"
                                        " your password.",
                                        style: CTheme.textLight16Yellow()),
                              )
                            : Container(),
                        screenStatus == true
                            ? Padding(
                                padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                                child: emailStatus == false
                                    ? Text("Please check the spelling of your email address or try an alternate email address.",
                                        style: CTheme.textLight16White())
                                    : Text(
                                        "Kindly click the link in your email to"
                                        "reset your password.",
                                        style: CTheme.textLight16White()),
                              )
                            : Container(),
                        screenStatus == true
                            ? Padding(
                                padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                                child: emailStatus == false
                                    ? Text(
                                        "If you  do not  know which  email address  you "
                                        "signed up with, please try entering all your "
                                        "email address till you get a match with our system.",
                                        style: CTheme.textLight16White())
                                    : Text(""),
                              )
                            : Container(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
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
                              Get.to(() => MyHomePage(name: "Name/Nickname"));
                              return;
                              bool status = await Authentication.resetRequest();

                              print(UserModel().forgetPin);
                              setState(() {
                                screenStatus = true;
                                emailStatus = status;
                              });
                              if (UserModel().forgetPin == null) {
                                Fluttertoast.showToast(msg: "Email Doesn't Exist", toastLength: Toast.LENGTH_LONG);
                                return;
                              }

                              if (status == true) {
                                await Future.delayed(Duration(seconds: 3));
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                  return UpdatePasswordScreen();
                                }));
                              }
                            },
                          ),
                        )
                      ],
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
