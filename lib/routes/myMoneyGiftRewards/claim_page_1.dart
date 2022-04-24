import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';
import '../../Shared/Model/user_model.dart';
import '../../constants/CColors.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import 'package:flutter/material.dart';
import '../../utils/widgets/stepper.dart';
import '../../Shared/Model/countryModel.dart' as cModel;

import 'claim_page_2.dart';

class ClaimPage extends StatefulWidget {
  @override
  _ClaimPage createState() => _ClaimPage();
}

class _ClaimPage extends State<ClaimPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;
  File takeImg;
  File uploadImg;
  String countryValue = "Country*";
  String stateValue = "Select State/Province*";
  String cityValue = "Select City*";
  List<cModel.CountryParse> countries;
  bool _country = false;
  bool _city = false;
  bool _state = false;
  List<cModel.State> statesOfCountry;
  List<cModel.City> cityOfStates;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getCountryData();
  }

  // get country data from geolocation
  Future<void> getCountryData() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/country.json");
    countries = cModel.countryParseFromJson(data);
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  Widget _paymentSecuredBotomBar() {
    return InkWell(
      onTap: () => Get.to(() => ClaimPage2()),
      child: Container(
        padding: EdgeInsets.only(right: 20),
        color: Color.fromRGBO(180, 179, 180, 1),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: IconButton(
                icon: Icon(Icons.lock),
                iconSize: 20,
                color: Color.fromRGBO(106, 105, 106, 1),
                onPressed: () => {},
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  'Your payment information is secure.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromRGBO(106, 105, 106, 1)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _paymentSecuredBotomBar(),
      backgroundColor: Colors.white,
      drawer: CustomDrawer(context: context),
      appBar: AppBarBuy(),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                    backgroundColor: Color.fromRGBO(112, 112, 112, 1),
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.grey[300],
                    ),
                  ),)
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 30, 16, 0),
                        child: Text("MY MONEY-REWARDS | CLAIM",
                            textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Roboto', color: Colors.grey[800], fontSize: 16)),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: AppStepper(active: 2),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "STEP 2",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "SEND US YOUR BANK INFO to receive your Money-Reward in your chosen account.",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[800],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "This information must be accurate or your transfer will be delayed.",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[800],
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      _fields(),
                      SizedBox(height: 50),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            border: Border.all(color: Colors.white)),
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          iconSize: 22,
                          color: Colors.white,
                          onPressed: () async {
                            Get.to(() => ClaimPage2());
                            return;
                          },
                        ),
                      ),
                      SizedBox(height: 150),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  _fields() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      onChanged: (value) => UserModel().name = value,
                      onEditingComplete: () {
                        // _surNameFocus.requestFocus();
                      },
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'First Name*',
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
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
          child: Form(
//                    key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      onChanged: (value) => UserModel().surname = value,
                      onEditingComplete: () {
                        // _nickNameFocus.requestFocus();
                      },
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'Last Name*',
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
        Padding(
          padding: EdgeInsets.fromLTRB(30, 8, 30, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  "Please enter your full name as registered on your bank account. Any missing or incorrect names could cause delays to your transfer.",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.grey[800],
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(70, 69, 69, 1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _country ? CColor.appYellow : Colors.white,
            ),
          ),
          child: Center(
            child: DropdownSearch<String>(
              mode: Mode.DIALOG,
              showSearchBox: true,
              maxHeight: 350,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  // iconColor: Colors.white,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                  labelText: "Country*",
                  labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              items: countries.map((e) => e.name).toList(),
              dropDownButton: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
              ),
              dropdownBuilder: (context, itemStr) {
                return Text(
                  itemStr ?? countryValue,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                );
              },
              dropdownSearchDecoration: InputDecoration(
                hintText: countryValue,
                // iconColor: Colors.white,
                labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                contentPadding: EdgeInsets.fromLTRB(18, 0, 0, 0),
                border: InputBorder.none,
              ),
              onChanged: (countryName) {
                print("Country name: $countryName");
                var country = countries.firstWhere((element) => element.name == countryName);
                statesOfCountry = country.state;
                cityOfStates = null;
                if (countryName != null) UserModel().country = countryName.toString().trim();
                setState(() {
                  _country = false;
                  countryValue = countryName.toString();
                });
                print(countryValue);
              },
            ),
          ),
        ),
        (statesOfCountry != null && statesOfCountry.isNotEmpty)
            ? Container(
                height: 50,
                margin: const EdgeInsets.fromLTRB(16, 6, 16, 0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(70, 69, 69, 1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _state ? Colors.yellow : Colors.white)),
                child: DropdownSearch<String>(
                  mode: Mode.DIALOG,
                  showSearchBox: true,
                  maxHeight: 350,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                      labelText: "State*",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  items: statesOfCountry.map((e) => e.name).toList(),
                  dropDownButton: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                  ),
                  dropdownBuilder: (context, itemStr) {
                    return Text(
                      itemStr ?? stateValue,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    );
                  },
                  dropdownSearchDecoration: InputDecoration(
                    hintText: stateValue,
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    contentPadding: EdgeInsets.fromLTRB(18, 0, 0, 0),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    var state = statesOfCountry.firstWhere((element) => element.name == value);
                    print(state.id);

                    if (value != null) {
                      cityOfStates = state.city;
                      UserModel().province = value.toString().trim();
                      setState(() {
                        _state = false;
                        stateValue = value.toString();
                      });
                      print("State: " + value + " City :${cityOfStates.length}");
                    }
                  },
                ),
              )
            : SizedBox(),
        (cityOfStates != null && cityOfStates.isNotEmpty)
            ? Container(
                height: 50,
                margin: const EdgeInsets.fromLTRB(16, 6, 16, 0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(70, 69, 69, 1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _city ? Colors.yellow : Colors.white)),
                child: DropdownSearch<String>(
                  mode: Mode.DIALOG,
                  showSearchBox: true,
                  maxHeight: 350,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                      labelText: "City*",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  items: cityOfStates.map((e) => e.name).toList(),
                  dropDownButton: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                  ),
                  dropdownBuilder: (context, itemStr) {
                    print("item selected : $itemStr");
                    return Text(
                      itemStr ?? cityValue,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    );
                  },
                  dropdownSearchDecoration: InputDecoration(
                    hintText: cityValue,
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    contentPadding: EdgeInsets.fromLTRB(18, 0, 0, 0),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    var city = cityOfStates.firstWhere((element) => element.name == value);
                    print(city.id);
                    if (value != null) UserModel().city = value.toString().trim();
                    setState(() {
                      _city = false;
                      cityValue = value.toString();
                    });
                    print(value);
                  },
                ),
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
          child: Form(
//                    key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      onChanged: (value) {
                        UserModel().address = value;
                      },
                      onEditingComplete: () {
                        // _createPassFocus.requestFocus();
                      },
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
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
          child: Form(
//                    key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      onChanged: (value) {
                        UserModel().address = value;
                      },
                      onEditingComplete: () {
                        // _createPassFocus.requestFocus();
                      },
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'Mobile Number*',
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
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
          child: Form(
//                    key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      onChanged: (value) => UserModel().nickName = value,
                      onEditingComplete: () {
                        // _emailFocus.requestFocus();
                      },
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'Bank Name*',
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
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
          child: Form(
//                    key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      onChanged: (value) => UserModel().email = value,
                      onEditingComplete: () {
                        // _addressFocus.requestFocus();
                      },
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'Branch Name*',
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
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
          child: Form(
//                    key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      onChanged: (value) {
                        UserModel().address = value;
                      },
                      onEditingComplete: () {
                        // _createPassFocus.requestFocus();
                      },
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'Account Number*',
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
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
          child: Form(
//                    key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      onChanged: (value) {
                        UserModel().address = value;
                      },
                      onEditingComplete: () {
                        // _createPassFocus.requestFocus();
                      },
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'Swift Code or BIC Code*',
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
      ],
    );
  }
}
