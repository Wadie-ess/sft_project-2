import 'package:flutter/material.dart';

import '../../utils/CustomBottomBar.dart';
import '../../utils/CustomDrawer.dart';
import 'real_hunt_detail_page.dart';

class RealWorldHuntSearchPage extends StatefulWidget {
  @override
  _RealWorldHuntSearchPage createState() => _RealWorldHuntSearchPage();
}

class _RealWorldHuntSearchPage extends State<RealWorldHuntSearchPage> {
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                  child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                height: 40,
                                width: 40,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              )),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
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
                                              onChanged: (value) => {
                                                setState(() {
                                                  firstTextValue = value;
                                                  if (firstTextValue == '') {
                                                    firstText = 'Search for other Real World'
                                                        ' Hunts in more Cities &'
                                                        ' Locations ';
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
                                                    Icons.search,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () => {
//                                                    Navigator.push(
//                                                      context,
//                                                      MaterialPageRoute(
//                                                          builder: (context) => FoundItProcessingPage()
//                                                      ),
//                                                    )
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
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            "Sorry, there are currently no Real World "
                            "Hunts in the area you searched. or There are "
                            "currently x26 Real World Hunts in the area you "
                            "searched, please see below. However, the x9 Real "
                            "World Hunts closest to your search are listed"
                            " below.If you do not want to play in the Real "
                            "World Hunts below, close this window to return "
                            "to the previous Hunt list.",
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 14, fontWeight: FontWeight.w100)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      shrinkWrap: true,
                      itemCount: listOfHunts.length,
                      itemBuilder: (BuildContext context, int index) {
                        final listOfHuntItem = listOfHunts[index];

                        return GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RealHuntDetailPage()),
                            )
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(70, 69, 69, 1),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () => {debugPrint('C1 Clicked')},
                                              child: Container(
                                                padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                                                alignment: Alignment.topCenter,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(3, 248, 50, 1),
                                                    border: Border.all(color: Colors.black, width: 1.5),
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: Text(
                                                  'C1',
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () => {debugPrint('C2 Clicked')},
                                              child: Container(
                                                padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(3, 248, 50, 1),
                                                    border: Border.all(color: Colors.black, width: 1.5),
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: Text(
                                                  'C2',
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: Stack(
                                          children: [
                                            Align(
                                              child: Image.asset("assets/images/red_head_square/red_head_square.png"),
                                              alignment: Alignment.center,
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
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color.fromRGBO(70, 69, 69, 1),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    listOfHuntItem.city,
                                                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w100),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    listOfHuntItem.dateTime,
                                                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w100),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    listOfHuntItem.prizes,
                                                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w100),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    listOfHuntItem.price,
                                                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w100),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    listOfHuntItem.description,
                                                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w100),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    listOfHuntItem.huntName,
                                                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w100),
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
