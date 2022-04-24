import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:world/routes/codes/super_special_code_detail.dart';
import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import 'special_code_detail.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/app_utils.dart';

class CodePage extends StatefulWidget {
  const CodePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CodePageState();
  }
}

class CodePageState extends State<CodePage> {
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
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
                    child: AutoSizeText(
                      "SPECIAL CODES & SUPER SPECIAL CODES",
                      style: CTheme.textRegular16Black(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _specialCodeContainer(),
                  _superSpecialContainer(),
                  //SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Special Codes",
                          style: CTheme.textRegular16Black(),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          Localization.stLocalized("speicalCodeMessage"),
                          style: CTheme.textLight16Black(),
                        ),
                        Text(
                          "Super Special Codes",
                          style: CTheme.textRegular16Black(),
                        ),
                        Text(
                          Localization.stLocalized("superSpecialText"),
                          style: CTheme.textLight16Black(),
                        ),
                        _searchBar(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0, top: 20),
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: _superSpecialListview(),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              )),
        ));
  }

  _specialCodeContainer() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                Localization.stLocalized("specialCodeReceievedDate"),
                style: CTheme.textRegular12Black(),
              ),
              Text(
                " 5",
                style: CTheme.textRegular12Black(),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                Localization.stLocalized("specialCodeUsedDate"),
                style: CTheme.textRegular12Black(),
              ),
              Text(
                " 2",
                style: CTheme.textRegular12Black(),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                Localization.stLocalized("specialCodeExpires"),
                style: CTheme.textRegular12Black(),
              ),
              Text(
                " 2",
                style: CTheme.textRegular12Black(),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                Localization.stLocalized("specialCodeAvailable"),
                style: CTheme.textRegular12Black(),
              ),
              Text(
                " 2",
                style: CTheme.textRegular12Black(),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                Localization.stLocalized("specialCodePromo"),
                style: CTheme.textRegular12Black(),
              ),
              Text(
                " 2",
                style: CTheme.textRegular12Black(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _superSpecialContainer() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                Localization.stLocalized("superSpecialCodeReceievedDate"),
                style: CTheme.textRegular12Black(),
              ),
              Text(
                " 5",
                style: CTheme.textRegular12Black(),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                Localization.stLocalized("superSpecialCodeUsedDate"),
                style: CTheme.textRegular12Black(),
              ),
              Text(
                " 2",
                style: CTheme.textRegular12Black(),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                Localization.stLocalized("superSpecialCodeExpires"),
                style: CTheme.textRegular12Black(),
              ),
              Text(
                " 2",
                style: CTheme.textRegular12Black(),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                Localization.stLocalized("superSpecialCodeAvailable"),
                style: CTheme.textRegular12Black(),
              ),
              Text(
                " 2",
                style: CTheme.textRegular12Black(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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

  _specialCodeListview() {
    return [
      GestureDetector(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 15),
                    child: Text(
                      Localization.stLocalized("specialCodeTitle"),
                      style: CTheme.textRegular14Black(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 15),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.redAccent,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.redAccent,
                      ),
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 10),
                    child: SvgPicture.asset(
                        "assets/svg-icons/special_code_icon.svg"),

                    //Image.asset("assets/images/triangle/triangle_super.png"),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0, top: 10),
                      child: AutoSizeText(
                        Localization.stLocalized("codeMessage"),
                        style: CTheme.textLight14Black(),
                      ),
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    AutoSizeText(
                      Localization.stLocalized("dateTime"),
                      style: CTheme.textLight11Black(),
                    ),
                  ],
                ),
              )
            ],
          ),
          decoration: AppUtils.circularBoxDecoration(
              background: CColor.appWhite, border: CColor.appGreyLight),
        ),
        onTap: () {
          
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SpecialCodeDetail()));
        },
      )
    ];
  }

  _superSpecialListview() {
    return [
      _giftBox(false),
      SizedBox(height: 10),
      _giftBox(true),
      SizedBox(height: 10),
      _giftBox(false),
      SizedBox(height: 10),
      _giftBox(true),
      SizedBox(height: 10),
      _giftBox(false),
      SizedBox(height: 10),
      _giftBox(true),
      SizedBox(height: 10),
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
      SizedBox(height: 50),
    ];
  }

  GestureDetector _giftBox(bool isSuperSpecial) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 10, 12, 18),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      " Expires on Date and Year",
                      style: CTheme.textLight11Black(),
                    ),
                  ),
                ),
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.redAccent,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.redAccent,
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            SizedBox(height: 13),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 94,
                  child: Container(
                    child: SvgPicture.asset(isSuperSpecial
                        ? "assets/svg-icons/super_special_icon.svg"
                        : "assets/svg-icons/special_code_icon.svg"),

                    // Image.asset(
                    //   isSuperSpecial
                    //       ? "assets/images/triangle/4.0x/triangle_super_special.png"
                    //       : "assets/images/triangle/4.0x/triangle_super.png",
                    // ),
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  flex: 186,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Get a SFT...",
                        style: CTheme.textRegular16Black(),
                      ),
                      SizedBox(height: 6),
                      AutoSizeText(
                        "Special Code:\nIssued: Date Year, Day at Time\nUsed: Y/N\nSFT Number:\nArtist Name:\nPod Number: ",
                        style: CTheme.textLight14Black(),
                      ),
                    ],
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            SizedBox(height: 16),
          ],
        ),
        decoration: AppUtils.circularBoxDecoration(
            background: CColor.appWhite, border: CColor.appGreyLight),
      ),
      onTap: () {
       isSuperSpecial
                           ? Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SuperSpecialCodeDetail())):Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SpecialCodeDetail()));
      },
    );
  }
}
