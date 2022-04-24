import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';

class MyPointsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPointsPageState();
  }
}

class MyPointsPageState extends State<MyPointsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBarBuy(),
      body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              child: Container(
                child: Column(children: <Widget>[
                  SizedBox(height: 20),
                  AutoSizeText(
                    "MY POINTS",
                    // Localization.stLocalized("buyGameUnits",).toUpperCase(),
                    style: CTheme.textRegular16DarkGrey(),
                    textAlign: Localization.textAlignLeft(),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, top: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Total Points to date:",
                              style: CTheme.textRegular12Black(),
                            ),
                            Text(" 257"),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Points in 2019:",
                              style: CTheme.textRegular12Black(),
                            ),
                            Text(" 200"),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Points from Promo Code:",
                              style: CTheme.textRegular12Black(),
                            ),
                            Text((" 150")),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Points converted to Special Codes:",
                              style: CTheme.textRegular12Black(),
                            ),
                            Text((" 50")),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, top: 20),
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Expanded(
                              child: Text(
                            "Those who find the Choohoo and validate it in"
                            " 1st to 10th place are also awarded points,"
                            " and sometimes other instant rewards.\n\n"
                            "Accumulated points translate to various "
                            "rewards.\n\nEvery 50 points gets you a free "
                            "Special Code.\n\nThe Game Masters issue"
                            " Special Codes to players at various times."
                            " Special Codes can be used for any Riddle "
                            "or Clue in Standard Hunts only. Special"
                            " Codes are valid for 6 months.\n\nIn "
                            "addition to the prize for 1st place per "
                            "Hunt, the top 5 hunters with the most "
                            "points on the Leaderboard (Digital or "
                            "Real World) at the end of the year also "
                            "win rewards.\n\nPoints awarded per Hunt:\n",
                            style: CTheme.textLight16Black(),
                          )),
                        ])
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 5, 16, 30),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 25,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  '1st',
                                  style: TextStyle(
                                    color: Color.fromRGBO(70, 69, 69, 1),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              child: Text(
                                '25 points',
                                style: TextStyle(
                                  color: Color.fromRGBO(70, 69, 69, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 25,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  '2nd',
                                  style: TextStyle(
                                    color: Color.fromRGBO(70, 69, 69, 1),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              child: Text(
                                '20 points',
                                style: TextStyle(
                                  color: Color.fromRGBO(70, 69, 69, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 25,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  '3rd',
                                  style: TextStyle(
                                    color: Color.fromRGBO(70, 69, 69, 1),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              child: Text(
                                '15 points',
                                style: TextStyle(
                                  color: Color.fromRGBO(70, 69, 69, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 25,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  '4th',
                                  style: TextStyle(
                                    color: Color.fromRGBO(70, 69, 69, 1),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              child: Text(
                                '10 points',
                                style: TextStyle(
                                  color: Color.fromRGBO(70, 69, 69, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 25,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  '5th',
                                  style: TextStyle(
                                    color: Color.fromRGBO(70, 69, 69, 1),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              child: Text(
                                '8 points',
                                style: TextStyle(
                                  color: Color.fromRGBO(70, 69, 69, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 25,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  '6th',
                                  style: TextStyle(
                                    color: Color.fromRGBO(70, 69, 69, 1),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              child: Text(
                                '7 points',
                                style: TextStyle(
                                  color: Color.fromRGBO(70, 69, 69, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 25,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  '7th',
                                  style: TextStyle(
                                    color: Color.fromRGBO(70, 69, 69, 1),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              child: Text(
                                '5 points',
                                style: TextStyle(
                                  color: Color.fromRGBO(70, 69, 69, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 25,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  '8th',
                                  style: TextStyle(
                                    color: Color.fromRGBO(70, 69, 69, 1),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              child: Text(
                                '3 points',
                                style: TextStyle(
                                  color: Color.fromRGBO(70, 69, 69, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 25,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  '9th',
                                  style: TextStyle(
                                    color: Color.fromRGBO(70, 69, 69, 1),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              child: Text(
                                '2 points',
                                style: TextStyle(
                                  color: Color.fromRGBO(70, 69, 69, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 25,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  '10th',
                                  style: TextStyle(
                                    color: Color.fromRGBO(70, 69, 69, 1),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    style: BorderStyle.solid,
                                  )),
                              child: Text(
                                '1 points',
                                style: TextStyle(
                                  color: Color.fromRGBO(70, 69, 69, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
              ))),
    );
  }
}
