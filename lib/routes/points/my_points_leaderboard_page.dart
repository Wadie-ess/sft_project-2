import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import 'my_points_digital_wlb_page.dart';
import 'my_points_page.dart';
import 'my_points_private_hunt_page.dart';
import 'my_points_real_wlb_page.dart';
import 'my_points_top_history_page.dart';

class MyPointsLeaderBoardPage extends StatefulWidget {
  @override
  _MyPointsLeaderBoardPage createState() => _MyPointsLeaderBoardPage();
}

class _MyPointsLeaderBoardPage extends State<MyPointsLeaderBoardPage> {
  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;
  String imageValue = 'assets/images/mastercardimg.png';

  var abc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBarBuy(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: AutoSizeText(
                    "MY POINTS, LEADERBOARD & WINNERS".toUpperCase(),
                    style: CTheme.textRegular16DarkGrey(),
                    textAlign: Localization.textAlignLeft(),
                  ),
                ),
                GestureDetector(
                  child: _selectBar("MY POINTS"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyPointsPage()),
                    );
                  },
                ),
                GestureDetector(
                  child: _selectBar("REAL WORLD LEADERBOARD 2019"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyPointsRealWLBPage()),
                    );
                  },
                ),
                GestureDetector(
                  child: _selectBar("DIGITAL WORLD LEADERBOARD 2019"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyPointsDigitalWLBPage()),
                    );
                  },
                ),
                GestureDetector(
                  child: _selectBar("TOP 10 HISTORY"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyPointsTopHistoryPage()),
                    );
                  },
                ),
                GestureDetector(
                  child: _selectBar("PRIVATE HUNT WINNERS"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyPointsPrivateHuntWPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectBar(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8, right: 8),
              child: Text(
                title.toUpperCase(),
                style: CTheme.textRegular14White(),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Image.asset("assets/images/forward_white/forward_white.png"),
            )
          ],
        ),
        decoration:
            BoxDecoration(color: CColor.appGreyDark, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
}
