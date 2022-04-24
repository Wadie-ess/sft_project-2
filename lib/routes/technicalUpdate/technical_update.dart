import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import '../main/my_home_page.dart';

class TechnicalUpdatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TechnicalUpdatePageState();
  }
}

class TechnicalUpdatePageState extends State<TechnicalUpdatePage> {
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
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    AutoSizeText(
                      Localization.stLocalized("techniacalUpdate").toUpperCase(),
                      style: CTheme.textRegular16DarkGrey(),
                      textAlign: Localization.textAlignLeft(),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            Expanded(
                                child: Text(
                              Localization.stLocalized("techniacalUpdateMessage"),
                              style: CTheme.textLight16Black(),
                            )),
                          ])
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            Expanded(
                                child: Text("*Must always auto update, user must not have to click anything",
                                    style: CTheme.textRegular16Black())),
                          ])
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white)),
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          iconSize: 22,
                          color: Colors.white,
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage(
                                        name: "Name/Nickname",
                                      )),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
