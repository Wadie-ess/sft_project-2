import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';

class StoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoryState();
  }
}

class StoryState extends State<StoryPage> {
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
                      Localization.stLocalized("ourStory").toUpperCase(),
                      style: CTheme.textRegular16DarkGrey(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Text(Localization.stLocalized("ourStoryMessage"), style: CTheme.textLight16Black()),
                    ),
                    _photoOrVideoContainer()
                  ],
                ),
              )),
        ));
  }

  _photoOrVideoContainer() {
    return Container(
      height: 160,
      padding: EdgeInsets.only(top: 30, bottom: 30),
      margin: EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 40),
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
