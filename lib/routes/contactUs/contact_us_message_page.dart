import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import '../main/my_home_page.dart';

class ContactUsMessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactUsMessagePageState();
  }
}

class ContactUsMessagePageState extends State<ContactUsMessagePage> {
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
                      Localization.stLocalized("contactUs").toUpperCase(),
                      style: CTheme.textRegular16DarkGrey(),
                      textAlign: Localization.textAlignLeft(),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: CircularProgressIndicator(
                        backgroundColor: Color.fromRGBO(112, 112, 112, 1),
                        strokeWidth: 5,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        Localization.stLocalized("processing"),
                        style: CTheme.textRegular16Black(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16, top: 20),
                      child: Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            Expanded(
                                child: Text(
                              Localization.stLocalized("contactUsMessage"),
                              style: CTheme.textLight16Black(),
                            )),
                          ])
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 70),
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
                              MaterialPageRoute(builder: (context) => MyHomePage(name: "Name/Nickname")),
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
