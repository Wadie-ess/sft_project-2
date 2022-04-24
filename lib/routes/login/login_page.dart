import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Shared/Model/user_model.dart';
import '../../constants/CColors.dart';
import '../main/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/generic_ap_bar.dart';
import 'forget_password_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool obsecureText = false;
  FocusNode _emailFocus = FocusNode();
  FocusNode _passFocus = FocusNode();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _passC = TextEditingController();

  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;
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
      appBar: GenericAppBar(
        showMenu: true,
        showBackButton: true,
        showLoginButton: false,
        showRegButton: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                    height: 80,
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
                  child: Text("LOGIN",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color.fromRGBO(180, 179, 180, 1),
                        fontSize: 16,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Container(
                            height: 50,
                            child: TextFormField(
                              focusNode: _emailFocus,
                              onEditingComplete: () {
                                _passFocus.requestFocus();
                              },
                              controller: _emailC,
                              onChanged: (value) => UserModel().email = value,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                                hintText: 'Email',
                                hintStyle: TextStyle(color: Colors.white),
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
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Form(
//                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Container(
                            height: 50,
                            child: TextFormField(
                              obscureText: !obsecureText,
                              focusNode: _passFocus,
                              onChanged: (value) => UserModel().password = value,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                suffixIcon: FlatButton(
                                  splashColor: Colors.transparent,
                                  onPressed: () {
                                    setState(() {
                                      obsecureText = !obsecureText;
                                    });
                                  },
                                  child: Text(
                                    !obsecureText ? "SHOW" : "HIDE",
                                    style: TextStyle(color: Color.fromRGBO(180, 179, 180, 1)),
                                  ),
                                ),
                                contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.white),
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
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      color: Colors.black,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(2.0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                        );
                      },
                      child: Text(
                        "Forgot password?",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(color: Color.fromRGBO(180, 179, 180, 1)),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
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
                      onPressed: () async {
                        //LoginStatus status = await Authentication.loginUser();
                        //print(status);
                        // Get.to(() => MainPage());
                        Get.to(() => MyHomePage(name: "Name/Nickname"));

                        /*if (status == LoginStatus.login) {
                          Fluttertoast.showToast(
                              msg: "Login Successfully",
                              toastLength: Toast.LENGTH_SHORT);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              'MAIN_PAGE', (Route<dynamic> route) => false);
                        } else {
                          if (status == LoginStatus.notVerified) {
                            Fluttertoast.showToast(
                                msg:
                                    "Your account is not verified. Please follow the instructions at email.",
                                toastLength: Toast.LENGTH_SHORT);
                          } else {
                            Fluttertoast.showToast(
                                msg: "Email or Password is incorrect",
                                toastLength: Toast.LENGTH_SHORT);
                          }
                        }*/
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
}
