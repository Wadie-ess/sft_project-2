// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';
import '../../Shared/Model/countryModel.dart' as cModel;

import 'package:auto_size_text/auto_size_text.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:world/constants/CColors.dart';
import 'package:world/constants/CTheme.dart';
import 'package:world/constants/localization.dart';
import 'package:world/routes/profile/view_user_profile_page.dart';
import 'package:world/routes/reseller/become_seller_message.dart';
import 'package:world/utils/AppBarBuy.dart';
import 'package:world/utils/CommonUtils.dart';
import 'package:world/utils/CustomDrawer.dart';
import 'package:world/utils/CustomRadioSeller.dart';
import 'package:world/utils/city_country_picker/country_picker.dart' as countryPicker;
import "package:http/http.dart" as http;

class BecomeSellerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BecomeSellerPageState();
  }
}

class BecomeSellerPageState extends State<BecomeSellerPage> {
  List<DropdownMenuItem> arrayCountryValue = List();
  List<String> arrayCountryValues = List();
  List<String> arrayCountryKeys = List();
  List<String> arrayCallingCode = List();
  List<DropdownMenuItem> arrayStateValue = List();
  List<String> arrayStateValues = List();
  List<String> arrayStateKeys = List();
  List<DropdownMenuItem> arrayCityValue = List();
  List<String> arrayCityValues = List();
  List<String> arrayCityKeys = List();
  String selectedValueCountry = "";
  String selectedCountry = "";
  String selectedCountryCallingCode = "";
  String selectedValueState = "";
  String selectedState = "";
  String selectedValueCity = "";
  String selectedCity = "";
  File takeImg;
  File uploadImg;

  List<cModel.State> statesOfCountry;
  List<cModel.City> cityOfStates;
  String countryValue = "Country*";
  String stateValue = "State/Province*";
  String cityValue = "City*";
  bool _country = false;
  bool _city = false;
  bool _state = false;

  List<cModel.CountryParse> countries;

  Future<void> getCountryData() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/country.json");
    countries = cModel.countryParseFromJson(data);
    WidgetsFlutterBinding.ensureInitialized();
    if (mounted) {
      setState(() {
        // loading = false;
      });
    }
  }

  @override
  void initState() {
    getCountryData();
    super.initState();
  }

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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              Localization.stLocalized("sellerMessage"),
                              style: CTheme.textLight16Black(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    formWidget(),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 20),
                      child: Row(
                        children: <Widget>[
                          Text(Localization.stLocalized("uploadPhoto"), style: CTheme.textRegular16Black()),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
                        setState(() {
                          takeImg = File(pickedFile.path);
                        });
                      },
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: /*takeImg==null?*/ Image.asset("assets/images/camera/camera.png")
                              /*:new Image.file(takeImg,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover)*/
                              ,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(
                                Localization.stLocalized("takePhoto"),
                                style: CTheme.textRegular16Black(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
                        setState(() {
                          uploadImg = File(pickedFile.path);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 10),
                        child: uploadImg == null
                            ? Center(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Image.asset("assets/images/add_white/add_white.png"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 25, bottom: 30),
                                      child: Text(
                                        Localization.stLocalized("uploadPhotoC"),
                                        style: CTheme.textRegular16White(),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child:
                                    new Image.file(uploadImg, height: 150, width: MediaQuery.of(context).size.width, fit: BoxFit.fitWidth),
                              ),
                        decoration: BoxDecoration(
                            color: CColor.appGreyDark, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        Localization.stLocalized("uploadPhotoMessage"),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white)),
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          iconSize: 22,
                          color: Colors.white,
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BecomeSellerMessagePage()),
                            )
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }

  Widget formWidget() {
    return Column(
      children: <Widget>[
        Form(
          //key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: Container(
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                      hintText: 'Name*',
                      hintStyle: TextStyle(color: Colors.white),
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
              ),
            ],
          ),
        ),
        Form(
//                 key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: Container(
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                      hintText: 'Surname*',
                      hintStyle: TextStyle(color: Colors.white),
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
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 16, left: 16, top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Color.fromRGBO(70, 69, 69, 1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _country ? Colors.yellow : Colors.white)),
          child: MediaQuery.removePadding(
            removeBottom: true,
            removeTop: true,
            context: context,
            child: /*SearchableDropdown(
              style: TextStyle(color: Colors.white),
              isExpanded: true,
              underline: Container(),
              isCaseSensitiveSearch: false,
              items: countries.map((e) {
                return DropdownMenuItem(
                    child: Text(e.name, style: TextStyle()), value: e.name);
              }).toList(),
              //   value: selectedValue,
              hint: Text(countryValue, style: TextStyle(color: Colors.white)),

              searchHint: "Select one",
              onChanged: (value) {
                var country =
                    countries.firstWhere((element) => element.name == value);

                statesOfCountry = country.state;
                cityOfStates = null;
                if (value != null)
                  setState(() {
                    setState(() {
                      _country = false;
                    });
                    countryValue = value.toString();
                  });
                print(countryValue);
              },
            )*/
                Container(
              child: Text("Search able dropdown"),
            ),
          ),
        ),
        (statesOfCountry != null && statesOfCountry.isNotEmpty)
            ? Container(
                margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(70, 69, 69, 1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _state ? Colors.yellow : Colors.white)),
                child: MediaQuery.removePadding(
                  removeBottom: true,
                  removeTop: true,
                  context: context,
                  child: /*SearchableDropdown(
                    style: TextStyle(color: Colors.white),
                    isExpanded: true,
                    underline: Container(),
                    isCaseSensitiveSearch: false,
                    items: statesOfCountry.map((e) {
                      return DropdownMenuItem(
                          child: Text(e.name, style: TextStyle()),
                          value: e.name);
                    }).toList(),
                    //   value: selectedValue,
                    hint:
                        Text(stateValue, style: TextStyle(color: Colors.white)),

                    searchHint: "Select one",
                    onChanged: (value) {
                      var state = statesOfCountry
                          .firstWhere((element) => element.name == value);
                      print(state.id);
                      cityOfStates = state.city;
                      if (value != null)
                        setState(() {
                          _state = false;
                          stateValue = value.toString();
                        });
                      print(stateValue);
                    },
                  )*/
                      Container(
                    child: Text("Search able dropdown"),
                  ),
                ),
              )
            : SizedBox(),
        (cityOfStates != null && cityOfStates.isNotEmpty)
            ? Container(
                margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(70, 69, 69, 1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _city ? Colors.yellow : Colors.white)),
                child: MediaQuery.removePadding(
                  removeBottom: true,
                  removeTop: true,
                  context: context,
                  child: /*SearchableDropdown(
                    style: TextStyle(color: Colors.white),
                    isExpanded: true,
                    underline: Container(),
                    isCaseSensitiveSearch: false,
                    items: cityOfStates.map((e) {
                      return DropdownMenuItem(
                          child: Text(e.name, style: TextStyle()),
                          value: e.name);
                    }).toList(),
                    //   value: selectedValue,
                    hint:
                        Text(cityValue, style: TextStyle(color: Colors.white)),

                    searchHint: "Select one",
                    onChanged: (value) {
                      var city = cityOfStates
                          .firstWhere((element) => element.name == value);
                      print(city.id);
                      if (value != null)
                        setState(() {
                          _city = false;
                          stateValue = value.toString();
                        });
                      print(stateValue);
                    },
                  )*/
                      Container(
                    child: Text("Search able dropdown"),
                  ),
                ),
              )
            : SizedBox(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Form(
//                    key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'Email*',
                        hintStyle: TextStyle(color: Colors.white),
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
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 10),
                  child: Row(
                    children: <Widget>[
                      Text(
                        Localization.stLocalized("isSeller"),
                        style: CTheme.textRegular16Black(),
                      ),
                    ],
                  )),
              CustomRadioSeller(),
            ],
          ),
        ),
      ],
    );
  }
}
