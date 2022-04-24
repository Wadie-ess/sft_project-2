import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/app_utils.dart';

class NotificationDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotificationDetailState();
  }
}

class NotificationDetailState extends State<NotificationDetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                    Localization.stLocalized("notificationDetail").toUpperCase(),
                     //maxFontSize: 12.sp,
                    style: CTheme.textRegular16Black(),
                    textAlign: Localization.textAlignLeft(),
                  ),
                  Flex(
                    direction: Axis.horizontal,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex:  1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 15),
                          child: AutoSizeText(
                            Localization.stLocalized("notificationTitle"),
                            //maxFontSize: 12.sp,
                            style: CTheme.textRegular16Black(),
                          ),
                        ),
                      ),
                      Flexible(
                        flex:  1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, top: 15),
                          child: AutoSizeText(
                            Localization.stLocalized("notificationNumber"),
                            //maxFontSize: 12.sp,
                            
                            style: CTheme.textRegular12Black(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 5),
                    child: Text(Localization.stLocalized("dateTime") + " of Notification", style: CTheme.textLight11Black()),
                  ),
                  AspectRatio(
                    aspectRatio: 343.0 / 193.0,
                    child: Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(30),
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: AppUtils.circularBoxDecoration(background: CColor.appWhite, border: CColor.appGreyLight),
                      child: Center(
                        child: AutoSizeText(
                          Localization.stLocalized("mediaGoesHere"),
                          textAlign: TextAlign.center,
                          style: CTheme.textLight14Black(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(34, 0, 34, 34),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: AutoSizeText(
                            Localization.stLocalized("notificationDummyText"),
                            //maxFontSize: 12.sp,
                            style: CTheme.textLight16Black(),
                          ),
                        )
                      ],
                    ),
                  )
                ]))));
  }
}
