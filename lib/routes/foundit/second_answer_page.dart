import 'package:flutter/material.dart';
import '../profile/view_user_profile_page.dart';
import 'third_answer_page.dart';
import '../../utils/AppBarMain.dart';
import '../../utils/CustomDrawer.dart';

import '../main/choose_hunt_page.dart';

class SecondAnswerPage extends StatefulWidget {
  @override
  _SecondAnswerPage createState() => _SecondAnswerPage();
}

class _SecondAnswerPage extends State<SecondAnswerPage> {
  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;
  final FocusNode _focusNode = FocusNode();
  String firstTextValue = "";
  String firstText = 'ENTER SECOND ANSWER NOW';

  @override
  void initState() {
    _focusNode.addListener(() {
      print("Has focus: ${_focusNode.hasFocus}");
      if (!_focusNode.hasFocus) {
        if (firstTextValue.isEmpty) {
          setState(() {
            firstText = 'ENTER SECOND ANSWER NOW';
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
            firstText = 'ENTER SECOND ANSWER NOW';
          });
        }
        if (firstTextValue != '') {
          setState(() {
            firstText = '';
          });
        }
      }
    });

    super.initState();
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
                iconSize: 130,
                color: Colors.white,
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChooseHuntPage()),
                  )
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
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 5),
                  child: CircularProgressIndicator(
                    backgroundColor: Color.fromRGBO(112, 112, 112, 1),
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(235, 244, 17, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text("Processing", style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(235, 244, 17, 1), fontSize: 16)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text("Validated!",
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Color.fromRGBO(235, 244, 17, 1), fontSize: 14, fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 2, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text("Congratulations, your answer is correct!",
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 14, fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text("This Hunt requires a second answer. ",
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 14, fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
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
                                      onChanged: (value) => {
                                        setState(() {
                                          firstTextValue = value;
                                          if (firstTextValue == '') {
                                            firstText = 'ENTER SECOND ANSWER NOW';
                                          } else {
                                            firstText = '';
                                          }
                                        })
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
                                          onPressed: () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => ThirdAnswerPage()),
                                            )
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
                                  padding: EdgeInsets.fromLTRB(18, 15, 40, 10),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        _focusNode.requestFocus();
                                      })
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            firstText,
                                            style: TextStyle(color: Colors.white, fontSize: 16),
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
