import 'package:flutter_svg/svg.dart';

import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/app_utils.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SpecialCodeDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SpecialCodeDetailState();
  }
}

class SpecialCodeDetailState extends State<SpecialCodeDetail> {
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
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Column(children: <Widget>[
              SizedBox(height: 20),
              AutoSizeText(
                Localization.stLocalized("specialCodeDetails").toUpperCase(),
                style: CTheme.textRegular16Black(),
                textAlign: Localization.textAlignLeft(),
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Text(
                    Localization.stLocalized("generatedNumber"),
                    style: CTheme.textRegular16Black(),
                  )
                ],
              ),
              Row(
                children: <Widget>[Text(Localization.stLocalized("dateTime"), style: CTheme.textLight14Black())],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: _codeDetailContainer(),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _codeDetailContainer() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 15),
                child: Text(
                  Localization.stLocalized("expireOn"),
                  style: CTheme.textItalic12LightGrey(),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SvgPicture.asset("assets/svg-icons/special_code_icon.svg", width: 90, height: 90),
                
                //Image.asset("assets/images/triangle/triangle_super.png", width: 90, height: 90),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: AutoSizeText(
                    Localization.stLocalized("specialCodeMessage"),
                    style: CTheme.textRegular14Black(),
                  ),
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ],
      ),
      decoration: AppUtils.circularBoxDecoration(background: CColor.appWhite, border: CColor.appGreyLight),
    );
  }
}
