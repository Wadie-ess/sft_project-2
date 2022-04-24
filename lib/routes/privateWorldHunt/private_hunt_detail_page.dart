// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../buyRiddle/buy_riddle_page.dart';
import '../prize/prize_detail_page.dart';
import '../useGameUnits/use_game_units_page.dart';
import '../useSpecialCodes/use_special_code_page.dart';
import '../../utils/AppBarMain.dart';
import '../../utils/CustomBottomBar.dart';
import '../../utils/CustomDrawer.dart';

class PrivateHuntDetailPage extends StatefulWidget {
  @override
  _PrivateHuntDetailPage createState() => _PrivateHuntDetailPage();
}

class _PrivateHuntDetailPage extends State<PrivateHuntDetailPage> {
  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(
        shareable: true,
      ),
      backgroundColor: Colors.black,
      appBar: AppBarMain(),
      drawer: CustomDrawer(context: context),
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
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text("PRIVATE HUNTS",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color.fromRGBO(180, 179, 180, 1),
                        fontSize: 16,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
//                  child: Expanded(
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PrizeDetailPage()),
                      )
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Container(
                                    child: ClipRRect(
                                      child: Image.asset("assets/images/placeholder/red_head.png"),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 5.0, right: 5.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        border: Border(
                                            bottom: BorderSide(color: Colors.black),
                                            top: BorderSide(color: Colors.black),
                                            right: BorderSide(color: Colors.black),
                                            left: BorderSide(color: Colors.black))),
                                    child: ClipRRect(
                                      child: Image.asset("assets/images/placeholder/black_adidas.png"),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        border: Border(
                                            bottom: BorderSide(color: Colors.black),
                                            top: BorderSide(color: Colors.black),
                                            right: BorderSide(color: Colors.black),
                                            left: BorderSide(color: Colors.black))),
                                    child: ClipRRect(
                                      child: Image.asset("assets/images/placeholder/red_adidas.png"),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 2,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Text(
                                    "VIEW PRIZES",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
//                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text("Hunt name goes here please\nDW1.  |  SH/NSH",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: 16,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                        "You do not have the Riddle/Clue 1, you need to\n"
                        "first get the Riddle/Clue 1 before getting\n"
                        "Clue1/Clue 2",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.yellow,
                          fontSize: 16,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                        "City, Location, Worldwide\nDate Time "
                        "Started/Start Date Time\nPrice of Riddle/Clue1/Clue2:"
                        " Free/Price\nDescription is typed here about"
                        " eg. Adidas is impossible\nis nothing."
                        "Description is typed here about eg."
                        " Adidas is\nimpossible is nothing."
                        "Description is typed here about\neg. "
                        "Adidas is impossible is nothing.",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: 16,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
                  child: Text("GET RIDDLE/CLUE 1/CLUE 2 ",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color.fromRGBO(180, 179, 180, 1),
                        fontSize: 16,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 15, 16, 30),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                          child: Container(
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0), side: BorderSide(color: Colors.white)),
                              color: Color.fromRGBO(70, 69, 69, 1),
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => UseSpecialCodePage()),
                                );
                              },
                              child: Center(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                                        child: Text(
                                          "USE SPECIAL/ SUPER SPECIAL CODE",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                          child: Container(
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0), side: BorderSide(color: Colors.white)),
                              color: Color.fromRGBO(70, 69, 69, 1),
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => UseGameUnitsPage()),
                                );
                              },
                              child: Center(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                                        child: Text(
                                          "USE GAME UNITS",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                          child: Container(
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0), side: BorderSide(color: Colors.white)),
                              color: Color.fromRGBO(70, 69, 69, 1),
                              textColor: Colors.white,
                              onPressed: () {
                                // Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => DigitalWorldHuntPage()
//                                ),
//                              );
                              },
                              child: Center(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                                        child: Text(
                                          "FREE",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                          child: Container(
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0), side: BorderSide(color: Colors.white)),
                              color: Color.fromRGBO(70, 69, 69, 1),
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BuyRiddlePage()),
                                );
                              },
                              child: Center(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                                        child: Text(
                                          "BUY",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
