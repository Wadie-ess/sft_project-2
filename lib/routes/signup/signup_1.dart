import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Shared/Model/user_model.dart';
import '../../constants/CColors.dart';
import 'sign_up2.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/generic_ap_bar.dart';
import '../../utils/widgets/logo.dart';

class SignUp1 extends StatefulWidget {
  @override
  _SignUp1State createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  String _confirmEmailAddress;

  //Focus Node
  FocusNode _nameFocus = FocusNode();
  FocusNode _surNameFocus = FocusNode();
  FocusNode _nickNameFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _confirmEmailFocus = FocusNode();

  // missingField
  bool _name = false;
  bool _surname = false;
  bool _email = false;
  bool _confirmEmail = false;

  //fieldCorrect
  bool _fieldCorrect = true;

  //unfocusing
  unFocusAllFields() {
    _nameFocus.unfocus();
    _surNameFocus.unfocus();
    _emailFocus.unfocus();
    _confirmEmailFocus.unfocus();
    _nickNameFocus.unfocus();
  }

  //checking field and making it yellow
  checkField() {
    setState(() {
      if (UserModel().name == null || UserModel().name.length == 0) {
        _name = true;
        _fieldCorrect = false;
      }
      if (UserModel().surname == null || UserModel().surname.length == 0) {
        _surname = true;
        _fieldCorrect = false;
      }
      if (UserModel().email == null || UserModel().email.length == 0 || !UserModel().email.contains('@')) {
        _email = true;
        _confirmEmail = true;
        _fieldCorrect = false;
      }
      if (UserModel().email != _confirmEmailAddress) {
        _confirmEmail = true;
        _fieldCorrect = false;
      }
    });
  }

  //reset yellow fields
  resetYellowFields() {
    setState(() {
      _name = false;
      _surname = false;
      _email = false;
      _confirmEmail = false;
      _fieldCorrect = true;
    });
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
                          focusNode: _nameFocus,
                          onChanged: (value) {
                            setState(() {
                              _name = false;
                            });
                            return UserModel().name = value;
                          },
                          onEditingComplete: () {
                            _surNameFocus.requestFocus();
                          },
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                            hintText: 'First Name*',
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
                                  color: _name ? Colors.yellow : Colors.white,
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
                          focusNode: _surNameFocus,
                          onChanged: (value) {
                            setState(() {
                              _surname = false;
                            });
                            return UserModel().surname = value;
                          },
                          onEditingComplete: () {
                            _nickNameFocus.requestFocus();
                          },
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                            hintText: 'Last Name*',
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
                                  color: _surname ? Colors.yellow : Colors.white,
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
                          focusNode: _nickNameFocus,
                          onChanged: (value) {
                            return UserModel().nickName = value;
                          },
                          onEditingComplete: () {
                            _emailFocus.requestFocus();
                          },
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                            hintText: 'Nickname or Alias (Optional)',
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
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          focusNode: _emailFocus,
                          onChanged: (value) {
                            setState(() {
                              _email = false;
                            });
                            return UserModel().email = value.trim();
                          },
                          onEditingComplete: () {
                            _confirmEmailFocus.requestFocus();
                          },
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                            hintText: 'Email*',
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
                                  color: _email ? Colors.yellow : Colors.white,
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
                          focusNode: _confirmEmailFocus,
                          onChanged: (value) {
                            setState(() {
                              _confirmEmail = false;
                            });
                            _confirmEmailAddress = value;
                          },
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                            hintText: 'Enter email again to confirm*',
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
                                  color: _confirmEmail ? Colors.yellow : Colors.white,
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
                    print(_fieldCorrect);
                    Get.to(
                      SignUp2(),
                      transition: Transition.rightToLeft,
                      duration: Duration(milliseconds: 700),
                    );
                    /*if (_fieldCorrect) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp2()));
                    } else {
                      Fluttertoast.showToast(
                          msg:
                              "Please Make Sure To Fill All the Fields Correctly",
                          gravity: ToastGravity.CENTER,
                          toastLength: Toast.LENGTH_LONG);
                    }*/
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => SignupWelcomePage(
                    //         fromEditProfile: false,
                    //       )),
                    // )
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
