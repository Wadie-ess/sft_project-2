import 'package:flutter/material.dart';
import '../profile/view_user_profile_page.dart';
import 'second_answer_page.dart';
import '../main/choose_hunt_page.dart';
import '../../services/location_service.dart';
import '../../utils/AppBarMain.dart';
import '../../utils/CustomDrawer.dart';

import 'found_it_processing_page.dart';

class FoundItPage extends StatefulWidget {
  @override
  _FoundItPage createState() => _FoundItPage();
}

class _FoundItPage extends State<FoundItPage> {
  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  String firstTextValue = "";

  String firstText = 'If you have found the Choohoo '
      'ENTER SECRET NO. '
      '(It’s on the Choohoo)';

  String secondTextValue = "";
  String secondText = 'If you are in a Digital Hunt and have not found the '
      'Choohoo yet, ENTER ANSWER/S to find it, and GET SECRET NO.';

  bool locationEnable = false;
  @override
  void initState() {
    super.initState();
    LocationService().allRequirePermissionGranted().then((value) {
      setState(() {
        locationEnable = value;
      });
    });
    _focusNode.addListener(() {
      print("Has focus: ${_focusNode.hasFocus}");
      if (!_focusNode.hasFocus) {
        if (firstTextValue.isEmpty) {
          setState(() {
            firstText = 'If you have found the Choohoo '
                'ENTER SECRET NO. '
                '(It’s on the Choohoo)';
          });
        }
        if (firstTextValue.isNotEmpty) {
          setState(() {
            firstText = '';
          });
        }
      } else {
        if (firstTextValue == '') {
          setState(() {
            firstText = 'If you have found the Choohoo '
                'ENTER SECRET NO. '
                '(It’s on the Choohoo)';
          });
        }
        if (firstTextValue != '') {
          setState(() {
            firstText = '';
          });
        }
      }
    });

    _focusNode2.addListener(() {
      print("Has focus: ${_focusNode2.hasFocus}");
      if (!_focusNode2.hasFocus) {
        if (secondTextValue.isEmpty) {
          setState(() {
            secondText = 'If you are in a Digital Hunt and have not found the '
                'Choohoo yet, ENTER ANSWER/S to find it, and GET SECRET NO.';
          });
        }
        if (secondTextValue.isNotEmpty) {
          setState(() {
            secondText = '';
          });
        }
      } else {
        if (secondTextValue == '') {
          setState(() {
            secondText = 'If you are in a Digital Hunt and have not found the '
                'Choohoo yet, ENTER ANSWER/S to find it, and GET SECRET NO.';
          });
        }

        if (secondTextValue != '') {
          setState(() {
            secondText = '';
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Color.fromRGBO(45, 45, 45, 1),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: IconButton(
                icon: Image.asset('assets/images/huntoptionicon.png'),
                iconSize: 150,
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChooseHuntPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      drawer: CustomDrawer(context: context),
      appBar: AppBarMain(scaffoldKey: scaffoldKey),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                    height: 50,
                    width: 100,
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
                      style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 16, fontWeight: FontWeight.w100)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text("FOUND IT?", style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 18)),
                ),
                Visibility(
                  visible: !locationEnable,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                              "  This game cannot be played without\n  "
                              "accessing the location on your device...",
                              style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(235, 244, 17, 1), fontSize: 14)),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color.fromRGBO(235, 244, 17, 1),
                                      )),
                                  child: Checkbox(
                                      activeColor: Colors.black,
                                      checkColor: Color.fromRGBO(235, 244, 17, 1),
                                      value: allowVal,
                                      onChanged: (bool value) async {
                                        if (value == true) {
                                          bool locationGot = await LocationService().setLocation(context);

                                          print(locationGot);
                                          if (locationGot) {
                                            setState(() {
                                              allowVal = value;
                                              locationEnable = true;
                                            });
                                          } else {
                                            allowVal = false;
                                          }
                                        } else {
                                          setState(() {
                                            allowVal = value;
                                          });
                                        }
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    'Allow',
                                    style: TextStyle(
                                      color: Color.fromRGBO(235, 244, 17, 1),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Color.fromRGBO(235, 244, 17, 1),
                                        )),
                                    child: Checkbox(
                                        activeColor: Colors.black,
                                        checkColor: Color.fromRGBO(235, 244, 17, 1),
                                        value: blockVal,
                                        onChanged: (bool value) {
                                          setState(() {
                                            blockVal = value;
                                          });
                                          if (value == true) {
                                            setState(() {
                                              allowVal = false;
                                            });
                                          } else {
                                            setState(() {
                                              allowVal = true;
                                            });
                                          }
                                        }),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    'Block',
                                    style: TextStyle(
                                      color: Color.fromRGBO(235, 244, 17, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(70, 69, 69, 1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                )),
                            child: Stack(
                              overflow: Overflow.clip,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          firstTextValue = value;
                                          if (firstTextValue == '') {
                                            firstText = 'If you have found the Choohoo '
                                                'ENTER SECRET NO. '
                                                '(It’s on the Choohoo)';
                                          } else {
                                            firstText = '';
                                          }
                                        });
                                      },
                                      focusNode: _focusNode,
                                      style: TextStyle(color: Colors.white),
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => FoundItProcessingPage()),
                                            );
                                          },
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                                        filled: true,
                                        fillColor: Color.fromRGBO(70, 69, 69, 1),
                                        focusedBorder:
                                            OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none, borderRadius: BorderRadius.all(const Radius.circular(20))),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(18, 15, 40, 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _focusNode.requestFocus();
                                      });
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                                            child: Text(
                                              firstText,
                                              style: TextStyle(color: Colors.white, fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 40),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(70, 69, 69, 1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                )),
                            child: Stack(
                              overflow: Overflow.clip,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          secondTextValue = value;
                                          if (secondTextValue == '') {
                                            secondText = 'If you are in a '
                                                'Digital Hunt and have not '
                                                'found the '
                                                'Choohoo yet, ENTER ANSWER/S '
                                                'to find it, and GET '
                                                'SECRET NO.';
                                          } else {
                                            secondText = '';
                                          }
                                        });
                                      },
                                      focusNode: _focusNode2,
                                      style: TextStyle(color: Colors.white),
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => SecondAnswerPage()),
                                            );
                                          },
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                                        filled: true,
                                        fillColor: Color.fromRGBO(70, 69, 69, 1),
                                        focusedBorder:
                                            OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none, borderRadius: BorderRadius.all(const Radius.circular(20))),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(18, 15, 40, 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _focusNode2.requestFocus();
                                      });
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                                            child: Text(
                                              secondText,
                                              style: TextStyle(color: Colors.white, fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
