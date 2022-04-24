///Created by zakria khan at 26/06/2021///
///email contact@zakriakhan.com///
///fiver link :  https://www.fiverr.com/users/toptutorial270///

import 'dart:convert';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:world/Shared/DAL/Authentication.dart';
import 'package:world/Shared/Model/security_question_model.dart';
import 'package:world/Shared/Model/user_model.dart';
import 'package:world/constants/CTheme.dart';
import 'package:world/constants/localization.dart';
import 'package:world/routes/profile/message_page.dart';
import 'package:world/routes/profile/view_user_profile_page.dart';
import 'package:world/routes/signup/signup_welcome_page.dart';
import 'package:world/utils/AppBarBuy.dart';

import "package:http/http.dart" as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:world/utils/CustomDrawer.dart';

class UpdateSecurityQuestionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UpdateSecurityQuestionPageState();
  }
}

class UpdateSecurityQuestionPageState extends State<UpdateSecurityQuestionPage> {
  String enteredPin = '';

  bool resetPinSend = false;

  String securityQuestionValue = '11';

  @override
  void initState() {
    UserModel().email = UserModel().playerModel.data.email;
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
                    SizedBox(height: 20),
                    AutoSizeText(
                      Localization.stLocalized("SqQuestionChange").toUpperCase(),
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
                              if (UserModel().securityuestionID != null && UserModel().securityAnswer != null) {
                                Authentication.resetRequest().then((value) {
                                  setState(() {
                                    resetPinSend = value;
                                  });
                                  if (!value || value == null) {
                                    Fluttertoast.showToast(msg: "Something went wrong.", toastLength: Toast.LENGTH_LONG);
                                  }
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Please enter password for the security question", toastLength: Toast.LENGTH_LONG);
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
                                bool status = await Authentication.updateSecurityQuestion(
                                    UserModel().email, UserModel().securityuestionID, UserModel().securityAnswer, enteredPin);
                                status == true
                                    ? Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MessageDisplayScreen(
                                                  message: 'sQChangeSuccess',
                                                )),
                                      )
                                    : Fluttertoast.showToast(msg: "Please enter correct pin.", toastLength: Toast.LENGTH_LONG);
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
          padding: const EdgeInsets.fromLTRB(16, 15, 16, 0),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Color.fromRGBO(70, 69, 69, 1), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor: Color.fromRGBO(70, 69, 69, 1)),
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    underline: Container(),
                    iconEnabledColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    hint: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Security Question*',
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 16, color: Colors.white),
                      ),
                    ),
                    isExpanded: true,
                    items: dropDownMenuItems(),
                    onChanged: (value) {
                      UserModel().securityuestionID = value;
                      setState(() {
                        securityQuestionValue = value;
                      });
                    },
                    value: securityQuestionValue,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.fromLTRB(16, 15, 16, 0),
          child: TextFormField(
            onChanged: (value) => UserModel().securityAnswer = value,
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
              hintText: 'Security Answer*',
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
      ],
    );
  }
}

List<DropdownMenuItem<String>> dropDownMenuItems() {
  // print(SecurityQuestionModel().questions);
  List<DropdownMenuItem<String>> questions = [];
  SecurityQuestionModel().questions.forEach((ques) {
    questions.add(DropdownMenuItem(
      value: ques.questionId.toString(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "${ques.questionId}.	",
            style: TextStyle(color: Colors.white),
          ),
          Expanded(
            child: Text(
              ques.question,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ));
  });
  return questions;
}
