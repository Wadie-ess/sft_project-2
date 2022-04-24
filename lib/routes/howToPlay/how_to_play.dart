import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../signup/signup_name_page.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomBottomBar.dart';
import '../../utils/CustomDrawer.dart';

class HowToPlayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HowToPlayPageState();
  }
}

class HowToPlayPageState extends State<HowToPlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: Colors.white,
        bottomNavigationBar: CustomBottomBar(),
        appBar: AppBarBuy(),
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        color: Colors.black,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Container(
                                height: 80,
                                width: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/splash/chohoo_img.png'),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                              child: Text("if yoo find it,\nit's for yoo hoo",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300)),
                            ),
                          ],
                        )),
                    SizedBox(height: 20),
                    AutoSizeText(
                      Localization.stLocalized("howToPlay").toUpperCase(),
                      style: CTheme.textRegular16Black(),
                      textAlign: Localization.textAlignLeft(),
                    ),
                    SizedBox(height: 20),
                    _photoOrVideoContainer(),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
                      child: Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            Expanded(
                                child: Text(
                              Localization.stLocalized("howToPlayMessageCentred"),
                              textAlign: TextAlign.center,
                              style: CTheme.textLight16Black(),
                            )),
                          ]),
                          Row(children: <Widget>[
                            Expanded(
                                child: Text(
                              Localization.stLocalized("howToPlayMessage"),
                              style: CTheme.textLight16Black(),
                            )),
                          ])
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }

  _photoOrVideoContainer() {
    return Container(
      height: 160,
      padding: EdgeInsets.only(top: 30, bottom: 30),
      margin: EdgeInsets.only(left: 16, right: 16, top: 15),
      child: Center(
        child: Text(
          Localization.stLocalized("photoVideo"),
          style: CTheme.textRegular16LightGrey(),
        ),
      ),
      decoration: BoxDecoration(
        color: CColor.appWhite,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border(
            bottom: BorderSide(color: CColor.appGreyLight),
            top: BorderSide(color: CColor.appGreyLight),
            right: BorderSide(color: CColor.appGreyLight),
            left: BorderSide(color: CColor.appGreyLight)),
      ),
    );
  }
}
