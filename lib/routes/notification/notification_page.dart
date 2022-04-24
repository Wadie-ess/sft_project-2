import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/app_utils.dart';
import 'notification_detail_page.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotificationPageState();
  }
}

class NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBarBuy(),
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        child: Column(children: <Widget>[
          SizedBox(height: 20),
          AutoSizeText(
          
            Localization.stLocalized("notifications").toUpperCase() + " | LIST",
            // maxFontSize: 14.sp,
            style: CTheme.textRegular16Black(),
            textAlign: Localization.textAlignLeft(),
          ),
          _searchBar(),
          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: _listOfNotifications(),
          ),
          SizedBox(height: 40),
        ]),
      )),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () => {}),
            contentPadding: EdgeInsets.fromLTRB(18, 0, 18, 0),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white, fontSize: 16),
            filled: true,
            fillColor: Color.fromRGBO(70, 69, 69, 1),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(const Radius.circular(20))),
          ),
        ),
      ),
    );
  }

  _listOfNotifications() {
    return [
      _notificationBox(),
      _notificationBox(),
      _notificationBox(),
      _notificationBox(),
      _notificationBox(),
      _notificationBox(),
      _notificationBox(),
      _notificationBox(),
      _notificationBox(),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          ),
          AutoSizeText(
            "1 / 2135\nmore...",
            style: CTheme.textRegular16DarkGrey(),
            textAlign: TextAlign.center,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    ];
  }

  Container _notificationBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                AutoSizeText(
                  Localization.stLocalized("notificationTitle"),
                  // maxFontSize: 12.sp,
                  style: CTheme.textRegular14Black(),
                ),
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.redAccent, width: 1, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.redAccent,
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 80,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: AppUtils.circularBoxDecoration(
                        background: CColor.appWhite,
                        border: CColor.appGreyLight,
                      ),
                      child: Center(
                        child: Text(
                          "Image",
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  flex: 196,
                  child: AutoSizeText(
                    Localization.stLocalized("notificationDetailText"),
                    style: CTheme.textLight14Black(),
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FittedBox(
                child: Row(
                  children: <Widget>[
                    AutoSizeText(
                      Localization.stLocalized("dateTime"),
                      style: TextStyle(
                        fontSize: 9.sp,
                      ),
                      
                    ),
                    AutoSizeText(
                      Localization.stLocalized("notificationNumber"),
                       style: TextStyle(
                        fontSize: 9.sp,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationDetailPage()));
        },
      ),
      margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
      decoration: AppUtils.circularBoxDecoration(background: CColor.appWhite, border: CColor.appGreyLight),
    );
  }
}
