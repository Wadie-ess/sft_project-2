import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:world/utils/CustomBottomBar.dart';
import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../receipts/receipt_details_units.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/app_utils.dart';

class AppPromoCodePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppPromoCodeState();
  }
}

class AppPromoCodeState extends State<AppPromoCodePage> {
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
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
              SizedBox(height: 20),
              AutoSizeText(
                Localization.stLocalized("appPromoCode").toUpperCase(),
                style: CTheme.textRegular16Black(),
                textAlign: Localization.textAlignLeft(),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "SFTs from Promo Codes: ",
                    style: CTheme.textRegular12Black(),
                  ),
                  Text(
                    " 20",
                    style: CTheme.textRegular12Black(),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Promo Codes used for SFTs:",
                    style: CTheme.textRegular12Black(),
                  ),
                  Text(
                    " 50",
                    style: CTheme.textRegular12Black(),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    Localization.stLocalized("yourCode").toUpperCase(),
                    style: CTheme.textLight16Black(),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(4, 0, 10, 0),
                      color: CColor.appGreyDark,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        Localization.stLocalized(
                          "dummyCode",
                        ),
                        style: CTheme.textRegular16White(),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Use this App Promo Code to get 1 SFT every time you Refer 10 People that Sign Up.\n\nAmount of people you referred, \nthat Signed Up: 4\n\nGet 6 more people to Sign Up to get your App Promo Code to be “greenlit” in order to get 1 SFT and a money-reward opportunity of your choice. which is valid for 6 months from date of issue.\n\nShare and Refer…",
                  style: CTheme.textLight16Black(),
                ),
              ),
              GestureDetector(
                onTap: (){
                  share(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Center(
                    child:SvgPicture.asset("assets/svg-icons/lrg_share_button.svg"),
                    
                    
                    
                    //  Stack(
                    //   children: <Widget>[
                    //     Image.asset("assets/images/share/container.png"),
                    //     Positioned.fill(
                    //       child: Align(
                    //         alignment: Alignment.center,
                    //         child:  SvgPicture.asset("assets/svg-icons/share_button.svg", height:50.0,width:50.0),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              AutoSizeText(
                "USED PROMO CODES | LIST",
                style: CTheme.textRegular16DarkGrey(),
                textAlign: Localization.textAlignLeft(),
              ),
              SizedBox(height: 20),
              _searchBar(),
              SizedBox(height: 20),
              _listOfItems(),
              SizedBox(
                height: 50,
              )
            ]),
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
                    "Promo Code Number",
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReceiptDetailsUnits(fromPromo: true)));
      },
    );
  }

  Widget _searchBar() {
    return Container(
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
    );
  }
}
