// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Shared/Model/security_question_model.dart';
import '../../Shared/Model/user_model.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/generic_ap_bar.dart';
import '../../utils/widgets/logo.dart';
import 'sign_up3.dart';

class SignUp2 extends StatefulWidget {
  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  String pwd1, pwd2;
  String _valueSQ;

  //focus nodes
  FocusNode _createPassFocus = FocusNode();
  FocusNode _confirmPassFocus = FocusNode();
  FocusNode _sQfocus = FocusNode();

  //missing / wrong fields
  bool _passNotMatch = false;
  bool _sQ = false;
  bool _sqAnswer = false;

  //unfocusing
  unFocusAllFields() {
    _createPassFocus.unfocus();
    _confirmPassFocus.unfocus();
    _sQfocus.unfocus();
  }

  //field correct
  bool _fieldCorrect = true;

  //checking field and making it yellow
  checkField() {
    setState(() {
      if (UserModel().securityAnswer == null || UserModel().securityAnswer == '') {
        _sqAnswer = true;
        _fieldCorrect = false;
      }
      if (UserModel().securityuestionID == null || UserModel().securityuestionID == '') {
        _sQ = true;
        _fieldCorrect = false;
      }

      if (pwd1 != pwd2 || pwd1 == '' || pwd2 == '') {
        _passNotMatch = true;
        _fieldCorrect = false;
      }
    });
  }

  //reset yellow fields
  resetYellowFields() {
    setState(() {
      _fieldCorrect = true;
      _passNotMatch = false;
      _sQ = false;
      _sqAnswer = false;
    });
  }

  void _showPasswordToggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _showPasswordToggle2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  List<DropdownMenuItem<String>> dropDownMenuItems() {
    // print(SecurityQuestionModel().questions);
    List<DropdownMenuItem<String>> questions = [];
    for (int i = 0; i < SecurityQuestionModel().questions.length; i++) {
      questions.add(DropdownMenuItem(
        value: SecurityQuestionModel().questions[i].questionId.toString(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "${i + 1}.	",
              style: TextStyle(color: Colors.white),
            ),
            Expanded(
              child: Text(
                SecurityQuestionModel().questions[i].question,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ));
    }

    return questions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: CustomDrawer(context: context),
      appBar: GenericAppBar(showMenu: true, showBackButton: true, showLoginButton: false, showRegButton: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChoohooLogo(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Text("SIGN UP", style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          focusNode: _createPassFocus,
                          onChanged: (value) {
                            setState(() {
                              _passNotMatch = false;
                            });
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
                                  padding: EdgeInsets.only(right: 10),
                                  splashColor: Colors.transparent,
                                  onPressed: _showPasswordToggle1,
                                  child: Align(
                                      child: new Text(
                                    _obscureText1 ? "SHOW" : "HIDE",
                                    style: TextStyle(color: Color.fromRGBO(180, 179, 180, 1)),
                                  ))),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(18, 14, 0, 14),
                            hintText: 'Create Password*',
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
                                  color: _passNotMatch ? Colors.yellow : Colors.white,
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
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          focusNode: _confirmPassFocus,
                          onChanged: (value) {
                            setState(() {
                              _passNotMatch = false;
                            });
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
                                  onPressed: _showPasswordToggle2,
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: new Text(
                                        _obscureText2 ? "SHOW" : "HIDE",
                                        style: TextStyle(color: Color.fromRGBO(180, 179, 180, 1)),
                                      ))),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(18, 14, 0, 14),
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
                                  color: _passNotMatch ? Colors.yellow : Colors.white,
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
              padding: const EdgeInsets.fromLTRB(16, 15, 16, 0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(70, 69, 69, 1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _sQ ? Colors.yellow : Colors.white)),
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
                            _valueSQ = value;
                            _sQ = false;
                          });
                        },
                        value: _valueSQ,
                      ),
                    ),
                  ),
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
                          onChanged: (value) {
                            setState(() {
                              _sqAnswer = false;
                            });
                            return UserModel().securityAnswer = value;
                          },
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
                                  color: _sqAnswer ? Colors.yellow : Colors.white,
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
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 60),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(70, 69, 69, 1), borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.white)),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  iconSize: 22,
                  color: Colors.white,
                  onPressed: () async {
                    resetYellowFields();
                    unFocusAllFields();
                    checkField();
                    // print(_fieldCorrect);
                    Get.to(
                      SignUp3(),
                      transition: Transition.rightToLeft,
                      duration: Duration(milliseconds: 500),
                    );
                    /* if (_fieldCorrect) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp3()));
                    } else {
                      Fluttertoast.showToast(
                          msg:
                              "Please Make Sure To Fill All the Fields Correctly",
                          gravity: ToastGravity.CENTER,
                          toastLength: Toast.LENGTH_LONG);
                    }*/
                  },
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
