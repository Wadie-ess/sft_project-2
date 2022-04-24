import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/app_utils.dart';
import '../riddleClue/get_riddle_clue_page.dart';
import 'track_record.dart';

class MyHuntsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHuntState();
  }
}

class MyHuntState extends State<MyHuntsPage> {
  String imageAddress = "assets/images/placeholder/black_adidas.png";

  int keyValue = 0;

  @override
  void initState() {
    super.initState();
    swapLogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: Colors.white,
        appBar: AppBarBuy(),
        bottomNavigationBar: _bottomBar(),
        body: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                child: Column(children: <Widget>[
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: AutoSizeText(
                      Localization.stLocalized("myHunts").toUpperCase(),
                      style: CTheme.textRegular16Black(),
                      textAlign: Localization.textAlignLeft(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: _listOfHunts(),
                    ),
                  ),
                ]))));
  }

  _listOfHunts() {
    return [
      _huntMainContainer(
          huntAvailable: true,
          clue1Available: true,
          clue2Available: false,
          clue1Message: Localization.stLocalized("clueAvailable"),
          clue2Message: Localization.stLocalized("clueNotAvailable")),
      _huntMainContainer(
          huntAvailable: true,
          clue1Available: false,
          clue2Available: false,
          clue1Message: Localization.stLocalized("clueAvailable"),
          clue2Message: Localization.stLocalized("clueSeen")),
      _huntMainContainer(
          huntAvailable: true,
          clue1Available: true,
          clue2Available: false,
          clue1Message: Localization.stLocalized("clueAvailable"),
          clue2Message: Localization.stLocalized("clueSeen")),
    ];
  }

  Container _huntMainContainer({bool huntAvailable, bool clue1Available, bool clue2Available, String clue1Message, String clue2Message}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Container(
          margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage("assets/images/placeholder/red_head.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: 80.0,
                        width: 80.0,
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return ScaleTransition(child: child, scale: animation);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: 80.0,
                          width: 80.0,
                          key: ValueKey<int>(keyValue),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image: AssetImage(imageAddress),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Container(
                          child: Text(
                            'Hunt name goes here plea\nDW1.  |  SH/NSH',
                            style: CTheme.textRegular14Black(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: <Widget>[AutoSizeText(Localization.stLocalized("huntDate"), style: CTheme.textRegular14Black())],
              ),
              _riddle(isAvailable: huntAvailable),
              _clue(clueTitle: Localization.stLocalized("clue1"), clueDescription: clue1Message, isAvailable: clue1Available),
              _clue(clueTitle: Localization.stLocalized("clue2"), clueDescription: clue2Message, isAvailable: clue2Available),
            ],
          ),
        ),
      ),
    );
  }

  Container containerAdidisHead() {
    return Container(
        child: Stack(children: <Widget>[
      Image.asset("assets/images/background_white/background.png"),
      Image.asset("assets/images/head_red/head_red.png"),
      Positioned(
        left: 60,
        child: Image.asset("assets/images/adidis_logo/adidis_logo.png"),
      )
    ]));
  }

  _decorationDecider({bool isAvailable}) {
    return isAvailable
        ? AppUtils.circularBoxDecoration(background: CColor.appGreyDark, border: CColor.appWhite)
        : AppUtils.circularBoxDecoration(background: CColor.appGreyLight, border: CColor.appBlackLight);
  }

  Widget _riddle({bool isAvailable}) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset("assets/images/clue_key/clue_key.png"),
            Image.asset("assets/images/forward_white/forward_white.png"),
          ],
        ),
        decoration: _decorationDecider(isAvailable: isAvailable),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GetRiddleCluePage()),
        );
      },
    );
  }

  Widget _clue({
    String clueTitle,
    String clueDescription,
    bool isAvailable,
  }) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(16),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset("assets/images/forward_white/forward_white.png"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 30, 5),
              child: Row(
                children: <Widget>[
                  Text(
                    clueTitle,
                    style: CTheme.textRegular14White(),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("|", style: CTheme.textRegular14White()),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(clueDescription, style: CTheme.textRegular14White()),
                  )
                ],
              ),
            ),
          ],
        ),
        decoration: _decorationDecider(isAvailable: isAvailable),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GetRiddleCluePage()),
        );
      },
    );
  }

  _bottomBar() {
    return Container(
      color: CColor.appGreyDark,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: Image.asset("assets/images/track_record/track_record.png"),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TrackRecord()));
            },
          )
        ],
      ),
    );
  }

  swapLogs() {
    int time = 1;
    new Future.delayed(Duration(seconds: time), () {
      setState(() {
        keyValue = 1;
        imageAddress == "assets/images/placeholder/red_adidas.png"
            ? imageAddress = "assets/images/placeholder/black_adidas.png"
            : imageAddress = "assets/images/placeholder/red_adidas.png";
      });
      swapLogs();
    });
  }
}
