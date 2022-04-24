import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/app_utils.dart';
import 'receipt_details_clue_one.dart';
import 'receipt_details_clue_two.dart';
import 'receipt_details_riddle.dart';
import 'receipt_details_units.dart';

class ReceiptPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReceiptPageState();
  }
}

class ReceiptPageState extends State<ReceiptPage> {
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
                Localization.stLocalized("receiptPage").toUpperCase() + " | LIST",
                style: CTheme.textRegular16DarkGrey(),
                textAlign: Localization.textAlignLeft(),
              ),
              _searchBar(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 10, bottom: 10),
                child: _listOfItems(),
              ),
              SizedBox(
                height: 10,
              )
            ]),
          ),
        )));
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 5),
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
            hintText: Localization.stLocalized("search"),
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

  Widget _listOfItems() {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        _box(),
        SizedBox(height: 10),
        _box(),
        SizedBox(height: 10),
        _box(),
        SizedBox(height: 10),
        _box(),
        SizedBox(height: 10),
        _box(),
        SizedBox(height: 10),
        _box(),
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
        // _unitContainer(),
        // SizedBox(height: 10),
        // _riddleContainer(),
        // SizedBox(
        //   height: 10,
        // ),
        // _clueOneContainer(),
        // SizedBox(
        //   height: 10,
        // ),
        // _clueTwoContainer(),
      ],
    );
  }

  _box() {
    return GestureDetector(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 6),
                  child: Text(
                    "SFT Name",
                    style: CTheme.textRegular14Black(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 15),
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.redAccent, width: 1, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.redAccent,
                    ),
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  height: 80,
                  width: 80,
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF9b9d9d)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "SFT Image",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, top: 0),
                    child: AutoSizeText(
                      "SFT Price:\nArtist Name:\nSFT Number:\nPod Number:",
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
                  AutoSizeText(
                    Localization.stLocalized("recieptNumber"),
                    style: CTheme.textLight11Black(),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            )
          ],
        ),
        decoration: AppUtils.circularBoxDecoration(background: CColor.appWhite, border: CColor.appGreyLight),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReceiptDetailsUnits()));
      },
    );
  }

  _unitContainer() {
    return GestureDetector(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15),
                  child: Text(
                    Localization.stLocalized("unitsPurchased"),
                    style: CTheme.textRegular14Black(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 15),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.redAccent, width: 1, style: BorderStyle.solid),
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
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  child: Image.asset("assets/images/triangle/triangle_units.png"),
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
                  AutoSizeText(
                    Localization.stLocalized("recieptNumber"),
                    style: CTheme.textLight11Black(),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            )
          ],
        ),
        decoration: AppUtils.circularBoxDecoration(background: CColor.appWhite, border: CColor.appGreyLight),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReceiptDetailsUnits()));
      },
    );
  }

  _riddleContainer() {
    return GestureDetector(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15),
                  child: Text(
                    Localization.stLocalized("riddlePurchased"),
                    style: CTheme.textRegular14Black(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 15),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.redAccent, width: 1, style: BorderStyle.solid),
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
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  child: Image.asset("assets/images/triangle/triangle_riddle.png"),
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
                  AutoSizeText(
                    Localization.stLocalized("recieptNumber"),
                    style: CTheme.textLight11Black(),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            )
          ],
        ),
        decoration: AppUtils.circularBoxDecoration(background: CColor.appWhite, border: CColor.appGreyLight),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReceiptDetailsRiddle()));
      },
    );
  }

  _clueOneContainer() {
    return GestureDetector(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15),
                  child: Text(
                    Localization.stLocalized("clueOnePurchased"),
                    style: CTheme.textRegular14Black(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 15),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.redAccent, width: 1, style: BorderStyle.solid),
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
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  child: Image.asset("assets/images/triangle/triangle_clue_one.png"),
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
                  AutoSizeText(
                    Localization.stLocalized("recieptNumber"),
                    style: CTheme.textLight11Black(),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            )
          ],
        ),
        decoration: AppUtils.circularBoxDecoration(background: CColor.appWhite, border: CColor.appGreyLight),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReceiptDetailsClueOne()));
      },
    );
  }

  _clueTwoContainer() {
    return GestureDetector(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15),
                  child: Text(
                    Localization.stLocalized("clueTwoPurchased"),
                    style: CTheme.textRegular14Black(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 15),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.redAccent, width: 1, style: BorderStyle.solid),
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
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  child: Image.asset("assets/images/triangle/triangle_clue_two.png"),
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
                  AutoSizeText(
                    Localization.stLocalized("recieptNumber"),
                    style: CTheme.textLight11Black(),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            )
          ],
        ),
        decoration: AppUtils.circularBoxDecoration(background: CColor.appWhite, border: CColor.appGreyLight),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReceiptDetailsClueTwo()));
      },
    );
  }
}
