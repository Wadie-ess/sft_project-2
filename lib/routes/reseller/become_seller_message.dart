import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';

class BecomeSellerMessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BecomeSellerMessagePageState();
  }
}

class BecomeSellerMessagePageState extends State<BecomeSellerMessagePage> {
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
                      Localization.stLocalized("becomeSeller").toUpperCase(),
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
                              Localization.stLocalized("ressellerMessage"),
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
}
