import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Shared/Model/user_model.dart';
import '../legal/legal_page.dart';
import 'signup_profile_pic_page.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/CustomRadio.dart';
import '../../utils/generic_ap_bar.dart';
import '../../utils/widgets/logo.dart';

class SignUp4 extends StatefulWidget {
  @override
  _SignUp4State createState() => _SignUp4State();
}

class _SignUp4State extends State<SignUp4> {
  String _valueDOB = "Date Of Birth dd/mm/yy*";
  DateTime _valueinDTO;
  bool agreement = false;

  //FOCUS
  FocusNode _fbFocus = FocusNode();
  FocusNode _twFocus = FocusNode();
  FocusNode _igFocus = FocusNode();
  FocusNode _tiktokFocus = FocusNode();
  FocusNode _dobFocus = FocusNode();

  //missing field
  bool _dob = false;

  //field correct
  bool _fieldCorrect = true;

  //unfocusing
  unFocusAllFields() {
    _fbFocus.unfocus();
    _twFocus.unfocus();
    _igFocus.unfocus();
    _tiktokFocus.unfocus();
    _dobFocus.unfocus();
  }

  //checking field and making it yellow
  checkField() {
    setState(() {
      if (UserModel().dob == null || UserModel().dob == '') {
        _dob = true;
        _fieldCorrect = false;
      }
    });
  }

  //reset yellow fields
  resetYellowFields() {
    _fieldCorrect = true;
    setState(() {
      _dob = false;
    });
  }

  Future dateTimePicker({Function onTap}) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
              color: Color.fromRGBO(70, 69, 69, 1),
              height: MediaQuery.of(context).copyWith().size.height / 2.5,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        height: 42,
                        color: Color.fromRGBO(70, 69, 69, 1),
                        child: Text(
                          'SELECT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onTap: onTap,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        backgroundColor: Colors.white,
                        onDateTimeChanged: (DateTime dateTime) {
                          _valueinDTO = dateTime;
                        },
                        mode: CupertinoDatePickerMode.date,
                      ),
                    ),
                  ),
                ],
              ));
        });
  }

  final _dateOfBirthTextController = TextEditingController();

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
              child: Text("SIGN UP", style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 18)),
            ),
            Focus(
              autofocus: true,
              focusNode: _dobFocus,
              canRequestFocus: true,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 15, 16, 0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(70, 69, 69, 1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: _dob ? Colors.yellow : Colors.white,
                      )),
                  child: DateTimePicker(
                    controller: _dateOfBirthTextController,
                    textAlignVertical: TextAlignVertical.center,
                    firstDate: DateTime(1970),
                    lastDate: DateTime(2100),
                    onChanged: (val) => print(val),
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => print(val),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                      hintText: _valueDOB,
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              child: CustomRadio(),
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
                          focusNode: _fbFocus,
                          onEditingComplete: () {
                            _twFocus.requestFocus();
                          },
                          onChanged: (value) => UserModel().facebookHandler = value,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                            hintText: 'Facebook Handle @Name',
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
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          focusNode: _twFocus,
                          onEditingComplete: () {
                            _igFocus.requestFocus();
                          },
                          onChanged: (value) => UserModel().twitterHandler = value,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                            hintText: 'Twitter Handle @Name',
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
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          focusNode: _igFocus,
                          onEditingComplete: () {
                            _tiktokFocus.requestFocus();
                          },
                          onChanged: (value) => UserModel().instaHandler = value,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                            hintText: 'Instagram Handle @Name',
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
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          focusNode: _tiktokFocus,
                          onChanged: (value) => UserModel().tiktokHandler = value,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                            hintText: 'TikTok Handle @Name',
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
              padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(70, 69, 69, 1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white)),
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Color.fromRGBO(70, 69, 69, 1),
                      ),
                      child: Checkbox(
                          activeColor: Color.fromRGBO(70, 69, 69, 1),
                          checkColor: Colors.white,
                          value: agreement,
                          onChanged: (bool value) {
                            if (value == true) {
                              setState(() {
                                agreement = value;
                              });
                            } else {
                              setState(() {
                                agreement = value;
                              });
                            }
                          }),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            if (!agreement) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LegalPage(
                                            openFromSignUp: true,
                                            agreed: (v) {
                                              setState(() {
                                                agreement = v;
                                              });
                                              Navigator.pop(context);
                                            },
                                          )));
                            } else {
                              setState(() {
                                agreement = false;
                              });
                            }
                          },
                          child: Text(
                            'By Signing Up you agree to our Terms,' + '\nPrivacy Policy and End User License Agreement',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF9D9B9D),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                    //
                    // Get.to(VerifyPinPage());
                    Get.to(SignupProfilePicPage());
                    /*if (_fieldCorrect) {
                      if (agreement) {
                        bool status = await Authentication.signUpUser();

                        if (status) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyPinPage()),
                          );
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg:
                                "Please agree to our terms, Privacy Policy And User License Agreement",
                            gravity: ToastGravity.CENTER,
                            toastLength: Toast.LENGTH_LONG);
                      }
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
          ],
        ),
      ),
    );
  }
}
