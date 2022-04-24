import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import 'FAQ_page.dart';
import 'contact_us_page.dart';

class ContactUsMenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactUsMenuState();
  }
}

class ContactUsMenuState extends State<ContactUsMenuPage> {
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
                Localization.stLocalized("contactUsFAQ").toUpperCase(),
                style: CTheme.textRegular16DarkGrey(),
                textAlign: Localization.textAlignLeft(),
              ),
              GestureDetector(
                child: _contactUsBar(),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage()));
                },
              ),
              GestureDetector(
                child: _faqBar(),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FAQPage()));
                },
              ),
              SizedBox(
                height: 10,
              )
            ]),
          ),
        )));
  }

  Widget _contactUsBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 5),
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
                Localization.stLocalized("contactUs").toUpperCase(),
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

  Widget _faqBar() {
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
                Localization.stLocalized("faq").toUpperCase(),
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
