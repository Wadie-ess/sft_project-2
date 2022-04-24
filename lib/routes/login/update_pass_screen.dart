import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Shared/DAL/Authentication.dart';
import '../../Shared/Model/user_model.dart';
import '../../constants/CTheme.dart';
import 'login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../signup/signup_name_page.dart';
import '../../utils/CustomDrawer.dart';

class UpdatePasswordScreen extends StatefulWidget {
  @override
  _UpdatePasswordScreenState createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  String enteredPin = '';
  bool pinStatus = false;
  bool screenStatus = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(112, 112, 112, 1),
          titleSpacing: 0.0,
          title: Text(
            "Update Your Password",
            style: GoogleFonts.roboto(
              fontSize: 20,
            ),
          )),
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
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text("UPDATE PASSWORD DETAILS", style: CTheme.textRegular16LightGrey()),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 15, 15, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Text("Please enter the Pin you received in your email.",
                            textAlign: TextAlign.left, style: CTheme.textLight16Yellow()),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                enteredPin = value;
                              });
                            },
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                              hintText: 'Pin',
                              hintStyle: CTheme.textRegular16White(),
                              filled: true,
                              fillColor: Color.fromRGBO(70, 69, 69, 1),
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
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        screenStatus == true
                            ? pinStatus == false
                                ? Text("Pin Does Not Match", style: CTheme.textLight16Yellow())
                                : Container()
                            : Container(),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        Visibility(
                          visible: !pinStatus,
                          child: Container(
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
                                if (UserModel().forgetPin == enteredPin) {
                                  setState(() {
                                    screenStatus = true;
                                    pinStatus = true;
                                  });
                                } else {
                                  setState(() {
                                    pinStatus = false;
                                    screenStatus = true;
                                  });
                                }

                                // bool status = await Authentication.resetRequest();
                                // print(status);
                                // setState(() {
                                //   screenStatus = true;
                                //   emailStatus = status;
                                // });

                                // if (status == true) {
                                //   await Future.delayed(Duration(seconds: 3));
                                // }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        //Heading
                        screenStatus == true
                            ? Padding(
                                padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                                child: pinStatus == true ? Text("Pin is Correct.", style: CTheme.textLight16Yellow()) : Text(""),
                              )
                            : Container(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        //Email Field
                        Visibility(
                          visible: pinStatus,
                          child: Container(
                            height: 50,
                            child: TextFormField(
                              onChanged: (value) {
                                UserModel().email = value;
                              },
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                                hintText: 'Enter your Email',
                                hintStyle: CTheme.textRegular16White(),
                                filled: true,
                                fillColor: Color.fromRGBO(70, 69, 69, 1),
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        //password field
                        Visibility(
                          visible: pinStatus,
                          child: Container(
                            height: 50,
                            child: TextFormField(
                              onChanged: (value) {
                                UserModel().password = value;
                              },
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                                hintText: 'Enter your New Password',
                                hintStyle: CTheme.textRegular16White(),
                                filled: true,
                                fillColor: Color.fromRGBO(70, 69, 69, 1),
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        //Button Field
                        Visibility(
                          visible: pinStatus,
                          child: Container(
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
                                bool status = await Authentication.updateForgotPassword(
                                    UserModel().email, UserModel().password, UserModel().forgetPin);
                                print(status);
                                if (status == true) {
                                  Fluttertoast.showToast(msg: "Password updated successfully", toastLength: Toast.LENGTH_LONG);
                                  await Future.delayed(Duration(seconds: 3));
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                    return LoginPage();
                                  }));
                                }
                              },
                            ),
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
