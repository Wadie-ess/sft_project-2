///Created by zakria khan at 26/06/2021///
///email contact@zakriakhan.com///
///fiver link :  https://www.fiverr.com/users/toptutorial270///

import 'dart:convert';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:world/Shared/DAL/Authentication.dart';
import 'package:world/Shared/Model/user_model.dart';
import 'package:world/constants/CTheme.dart';
import 'package:world/constants/localization.dart';
import 'package:world/routes/profile/message_page.dart';
import 'package:world/routes/profile/view_user_profile_page.dart';
import 'package:world/routes/signup/signup_welcome_page.dart';
import 'package:world/routes/signup/verify_pin_page.dart';
import 'package:world/utils/AppBarBuy.dart';

import "package:http/http.dart" as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:world/utils/CustomDrawer.dart';
import 'package:world/utils/widgets/logo.dart';

class UpdatePasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UpdatePasswordPageState();
  }
}

class UpdatePasswordPageState extends State<UpdatePasswordPage> {
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  String pwd1 = "";
  String pwd2 = "";

  String enteredPin = '';

  bool resetPinSend = false;

  FocusNode _createPassFocus = FocusNode();
  FocusNode _confirmPassFocus = FocusNode();

  @override
  void initState() {
    // UserModel().email = UserModel().playerModel.data.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: Colors.black,
        appBar: AppBarBuy(),
        body: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    ChoohooLogo(),
                    SizedBox(height: 40),
                    AutoSizeText(
                      Localization.stLocalized("passChange").toUpperCase() + " DETAILS",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: CTheme.defaultFont(),
                        color: Colors.white,
                      ),
                      textAlign: Localization.textAlignLeft(),
                    ),
                    SizedBox(height: 15),
                    _passwordFields(context: context),
                    Visibility(
                      visible: !resetPinSend,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
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
                              Get.to(() => VerifyPinPage(sourcePage: FromPage.PasswordUpdate));
                              return;
                              if (pwd1 == pwd2 && pwd1.length >= 6) {
                                setState(() {});

                                Authentication.resetRequest().then((value) {
                                  setState(() {
                                    resetPinSend = value;
                                  });
                                  if (!value || value == null) {
                                    Fluttertoast.showToast(msg: "Something went wrong.", toastLength: Toast.LENGTH_LONG);
                                  }
                                });
                              } else {
                                if (pwd1.length < 6) {
                                  Fluttertoast.showToast(
                                      msg: "Passwords must be at least 6 character long", toastLength: Toast.LENGTH_LONG);
                                  return;
                                }
                                Fluttertoast.showToast(msg: "Passwords do not match", toastLength: Toast.LENGTH_LONG);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Visibility(
                      visible: resetPinSend,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
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
                            hintText: 'Enter the Pin you Received',
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
                    Visibility(
                      visible: resetPinSend,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
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
                              if (resetPinSend) {
                                bool status = await Authentication.updatePassword(UserModel().email, pwd1, enteredPin);
                                status == true
                                    ? Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MessageDisplayScreen(
                                                  message: 'passChangeSuccess',
                                                )),
                                      )
                                    : '';
                              } else {
                                Fluttertoast.showToast(msg: "Something went wrong.", toastLength: Toast.LENGTH_LONG);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ))));
  }

  _passwordFields({BuildContext context}) {
    return Column(
      children: <Widget>[
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
                      focusNode: _createPassFocus,
                      onChanged: (value) {
                        UserModel().password = value;
                        pwd1 = value;
                      },
                      onEditingComplete: () {
                        _confirmPassFocus.requestFocus();
                      },
                      obscureText: _obscureText1,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        suffixIcon: Container(
                          width: 66,
                          child: FlatButton(
                              padding: EdgeInsets.only(right: 16),
                              splashColor: Colors.transparent,
                              onPressed: _showpasswordtoggle1,
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: new Text(
                                    _obscureText1 ? "SHOW" : "HIDE",
                                    style: TextStyle(color: Color.fromRGBO(180, 179, 180, 1)),
                                  ))),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'New Password*',
                        hintStyle: TextStyle(color: Colors.white),
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
                      focusNode: _confirmPassFocus,
                      onChanged: (value) {
                        pwd2 = value;
                      },
                      obscureText: _obscureText2,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        suffixIcon: Container(
                          width: 66,
                          child: FlatButton(
                              padding: EdgeInsets.only(right: 16),
                              splashColor: Colors.transparent,
                              onPressed: _showpasswordtoggle2,
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: new Text(
                                    _obscureText2 ? "SHOW" : "HIDE",
                                    style: TextStyle(color: Color.fromRGBO(180, 179, 180, 1)),
                                  ))),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'Enter Password again*',
                        hintStyle: TextStyle(color: Colors.white),
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
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showpasswordtoggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _showpasswordtoggle2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }
}
