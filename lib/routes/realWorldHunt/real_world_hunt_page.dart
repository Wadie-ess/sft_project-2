import 'package:flutter/material.dart';
import '../profile/view_user_profile_page.dart';
import '../../utils/AppBarMain.dart';
import '../../utils/CustomBottomBar.dart';
import '../../utils/CustomDrawer.dart';

import 'real_world_hunt_search_page.dart';

class RealWorldHuntPage extends StatefulWidget {
  @override
  _RealWorldHuntPage createState() => _RealWorldHuntPage();
}

class _RealWorldHuntPage extends State<RealWorldHuntPage> {
  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  List<RealWorldHuntCard> listOfHunts = [];
  double boxHeight = 150;

  final FocusNode _focusNode = FocusNode();
  String firstTextValue = "";

  String firstText = 'Search for other Real World Hunts in more Cities & '
      'Locations ';

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      print("Has focus: ${_focusNode.hasFocus}");
      if (!_focusNode.hasFocus) {
        if (firstTextValue.isEmpty) {
          setState(() {
            firstText = 'Search for other Real World Hunts in more Cities & '
                'Locations ';
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
            firstText = 'Search for other Real World Hunts in more Cities & '
                'Locations ';
          });
        }
        if (firstTextValue != '') {
          setState(() {
            firstText = '';
          });
        }
      }
    });

    RealWorldHuntCard card1 = RealWorldHuntCard(
        "City, Location",
        "Date Time Started/Start Date Time",
        "Prizes: 1st, 2nd, 3rd, 4th, 5th",
        "oPrice of Riddle: Free/Price",
        "Description is typed here about eg. Adidas is impossible is nothing.",
        "RW1.  |  SH/NSH\nHunt name goes here please",
        Colors.green);
    RealWorldHuntCard card2 = RealWorldHuntCard(
        "City, Location",
        "Date Time Started/Start Date Time",
        "Prizes: 1st, 2nd, 3rd, 4th, 5th",
        "oPrice of Riddle: Free/Price",
        "Description is typed here about eg. Adidas is impossible is nothing.",
        "RW1.  |  SH/NSH\nHunt name goes here please",
        Colors.green);
    listOfHunts.add(card1);
    listOfHunts.add(card2);

    if (listOfHunts[0].description.length > 62) {
      boxHeight = boxHeight + 30;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(),
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
                      style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 16, fontWeight: FontWeight.w200)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text("REAL WORLD HUNTS",
                      style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 18)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            "At the top of the list are Hunts "
                            "that are available closest to your current "
                            "location which have most recently started"
                            ". You are not limited to these Hunts, you "
                            "can also play in any City & Location of your choice.",
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 14, fontWeight: FontWeight.w100)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
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
                                                    firstText = 'Search for other Real World'
                                                        ' Hunts in more Cities &'
                                                        ' Locations ';
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
                                                    Icons.search,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => RealWorldHuntSearchPage()),
                                                    );
                                                  },
                                                ),
                                                contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                                                filled: true,
                                                fillColor: Color.fromRGBO(70, 69, 69, 1),
                                                focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide.none, borderRadius: BorderRadius.all(const Radius.circular(20))),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(18, 15, 45, 15),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _focusNode.requestFocus();
                                              });
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
                        /*Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 10,
                                );
                              },
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              shrinkWrap: true,
                              itemCount: UserModel().huntModel.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                //  final listOfHuntItem = listOfHunts[index];

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RealHuntDetailPage(
                                                  indexClicked: index)),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromRGBO(70, 69, 69, 1),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        debugPrint(
                                                            'C1 Clicked');
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8,
                                                                right: 8,
                                                                top: 2,
                                                                bottom: 2),
                                                        alignment:
                                                            Alignment.topCenter,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color.fromRGBO(
                                                                    3,
                                                                    248,
                                                                    50,
                                                                    1),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Text(
                                                          'C1',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        debugPrint(
                                                            'C2 Clicked');
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8,
                                                                right: 8,
                                                                top: 2,
                                                                bottom: 2),
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color.fromRGBO(
                                                                    3,
                                                                    248,
                                                                    50,
                                                                    1),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Text(
                                                          'C2',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 4.0),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      child: Image.asset(
                                                          "assets/images/red_head_square/red_head_square.png"),
                                                      alignment:
                                                          Alignment.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color:
                                                  Color.fromRGBO(70, 69, 69, 1),
                                            ),
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 5, 5, 5),
                                              child: Column(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Text(
                                                            "City: " +
                                                                UserModel()
                                                                    .huntModel
                                                                    .data[index]
                                                                    .huntCity +
                                                                ", Location: " +
                                                                UserModel()
                                                                    .huntModel
                                                                    .data[index]
                                                                    .huntLocation,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 3, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Text(
                                                            "Start Date Time: ${UserModel().huntModel.data[index].huntStartDate}" +
                                                                " ${UserModel().huntModel.data[index].huntStartTime}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 3, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Text(
                                                            "Prizes: 1st, 2nd, 3rd, 4th, 5th",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 3, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Text(
                                                            "Price of Riddle: " +
                                                                        UserModel()
                                                                            .huntModel
                                                                            .data[
                                                                                index]
                                                                            .riddle
                                                                            .riddleCost
                                                                            .toString() ==
                                                                    "0"
                                                                ? "Price of Riddle: Free Price"
                                                                : "Price of Riddle: " +
                                                                    UserModel()
                                                                        .huntModel
                                                                        .data[
                                                                            index]
                                                                        .riddle
                                                                        .riddleCost
                                                                        .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 3, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Text(
                                                            "Description: " +
                                                                UserModel()
                                                                    .huntModel
                                                                    .data[index]
                                                                    .huntDescription,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 3, 0, 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Text(
                                                            "Hunt Name: " +
                                                                UserModel()
                                                                    .huntModel
                                                                    .data[index]
                                                                    .huntName +
                                                                "\nDW1.  |  SH/NSH",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100),
                                                          ),
                                                        ),
                                                      ],
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
                                );
                              }),
                        ),*/
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

class RealWorldHuntCard {
  final String city;
  final String dateTime;
  final String prizes;
  final String price;
  final String description;
  final String huntName;
  final Color color;

  RealWorldHuntCard(this.city, this.dateTime, this.prizes, this.price, this.description, this.huntName, this.color);
}
