import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants/CTheme.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/widgets/AppText.dart';

class PublicBenefitDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PublicBenefitDetailsPageState();
  }
}

class PublicBenefitDetailsPageState extends State<PublicBenefitDetailsPage> {
  String line1 = "Public Benefit: \$120,00 | NGO/Initiative Name not longer than 2 lines";
  String line2 = "SFT Number: \nPod Number:";
  String line3 = "SFT Name: this line should not be more than 2 lines here \nBy Artist Name";
  String line4 =
      "Specification: 4K Resolution\n\nAbout SFT: any details if any lorem Ipsum nulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id. Nulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id.\n\nNulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id.";
  String line5 =
      "About Artist: Lorem Ipsum nulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id. Nulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id.\n\nNulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id.";
  String line6 = "Public Benefit Name: NGO/Initiative line should not be more than 2 lines here";
  String line7 =
      "About Public Benefit: Lorem Ipsum nulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id. Nulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id.\n\nNulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id.";

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AutoSizeText(
                  "PAST SFTs & PUBLIC BENEFITS DETAILS",
                  style: CTheme.textRegular16DarkGrey(),
                  textAlign: TextAlign.center,
                ),
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
            hintText: "Search SFTS & Public Benefits",
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "SFT Price: ",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
              Text(
                "\$2,50",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: AppText(text: line1, isBold: false),
        ),
        SizedBox(height: 6),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: AppText(text: line2, isBold: false),
        ),
        SizedBox(height: 16),
        Box(text: "Image/Video/Gif/Music", aspectRatio: 1),
        SizedBox(height: 16),
        Box(text: "Image/Video/Gif/Music", aspectRatio: 343.0 / 193.0),
        SizedBox(height: 16),
        Box(text: "Image/Video/Gif/Music", aspectRatio: 343.0 / 610.0),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: AppText(text: line3, isBold: true),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: AppText(text: line4, isBold: false),
        ),
        SizedBox(height: 16),
        Box(text: "Artist Image", aspectRatio: 343.0 / 193.0, shareButton: true),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: AppText(text: line5, isBold: false),
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: AppText(text: line6, isBold: true),
        ),
        SizedBox(height: 16),
        Box(text: "Public Benefit Image", aspectRatio: 343.0 / 193.0, shareButton: true),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: AppText(text: line7, isBold: false),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
