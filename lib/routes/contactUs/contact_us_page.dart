import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import '../../Shared/Model/countryModel.dart' as cModel;
import '../../Shared/Model/user_model.dart';
import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import 'contact_us_message_page.dart';

class ContactUsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactUsState();
  }
}

class ContactUsState extends State<ContactUsPage> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
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

  // get state data from geolocation
  Future getState() async {
    //var connectivityResult = await (Connectivity().checkConnectivity());
    /* if (connectivityResult == ConnectivityResult.none) {
      CommonUtils.validatorDialogBox(context, CommonUtils.NO_NETWORK_CONNECTED);
    } else {*/
    // get country
    return http
        .get(Uri.parse("https://choohoo.space/consolm/api/state-province?country_id=$selectedCountry"))
        .then((http.Response response) {
      print(response.body);
      if (response.statusCode == 200) {
        // save Shared Preferences data on success
        setState(() {
          arrayStateValue.clear();
          arrayStateValues.clear();
          arrayStateKeys.clear();
          var countryArray = ((json.decode(response.body))['stateProvinces']);
          for (int i = 0; i < countryArray.length; i++) {
            arrayStateValue.add(DropdownMenuItem(child: Text(countryArray[i]['title']), value: countryArray[i]['title'].toString()));
            arrayStateValues.add(countryArray[i]['title']);
            arrayStateValues.add(countryArray[i]['title']);
            arrayStateKeys.add(countryArray[i]['id'].toString());
          }
        });
      }
    }).catchError((error) {
      print(error.toString());
    });
    //}
  }

  // get city data from geolocation
  Future getCity() async {
    //var connectivityResult = await (Connectivity().checkConnectivity());
    /*if (connectivityResult == ConnectivityResult.none) {
      CommonUtils.validatorDialogBox(context, CommonUtils.NO_NETWORK_CONNECTED);
    } else {*/
    // get country
    return http.get(Uri.parse("https://choohoo.space/consolm/api/cities?state_province_id=$selectedState")).then((http.Response response) {
      print(response.body);
      if (response.statusCode == 200) {
        // save Shared Preferences data on success
        setState(() {
          arrayCityValue.clear();
          arrayCityValues.clear();
          arrayCityKeys.clear();
          var countryArray = ((json.decode(response.body))['cities']);
          for (int i = 0; i < countryArray.length; i++) {
            arrayCityValue.add(DropdownMenuItem(child: Text(countryArray[i]['title']), value: countryArray[i]['title'].toString()));
            arrayCityValues.add(countryArray[i]['title']);
            arrayCityKeys.add(countryArray[i]['id'].toString());
          }
        });
      }
    }).catchError((error) {
      print(error.toString());
    });
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBarBuy(),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Color.fromRGBO(112, 112, 112, 1),
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                  width: double.infinity,
                  child: Container(
                    child: Column(children: <Widget>[
                      SizedBox(height: 20),
                      AutoSizeText(
                        Localization.stLocalized("contactUs").toUpperCase(),
                        style: CTheme.textRegular16DarkGrey(),
                        textAlign: Localization.textAlignLeft(),
                      ),
                      // SizedBox(height: 20),
                      // Container(
                      //     padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      //     child: Center(
                      //       child: RichText(
                      //         text: TextSpan(
                      //             text: Localization.stLocalized("contactUsNote"),
                      //             style: CTheme.textLight16Black(),
                      //             children: <TextSpan>[
                      //               TextSpan(
                      //                   text: Localization.stLocalized(
                      //                       "emailAddressContact"),
                      //                   style: TextStyle(
                      //                       fontFamily: CTheme.defaultFont(),
                      //                       fontSize: 16,
                      //                       color: Colors.black,
                      //                       fontStyle: FontStyle.normal,
                      //                       decoration: TextDecoration.underline,
                      //                       fontWeight: FontWeight.w200))
                      //             ]),
                      //       ),
                      //     )),
                      // _photoOrVideoContainer()
                      _formContainer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 70),
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
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ContactUsMessagePage()),
                              );
                            },
                          ),
                        ),
                      ),
                    ]),
                  )),
            ),
    );
  }

  String _valueEnquiry;

  Widget _formContainer() {
    return Column(
      children: <Widget>[
        Form(
          //key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
          height: 50,
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Color.fromRGBO(70, 69, 69, 1), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor: Color.fromRGBO(70, 69, 69, 1)),
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white,
                      ),
                    ),
                    underline: Container(),
                    iconEnabledColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    hint: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enquiry',
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 16, color: Colors.white),
                      ),
                    ),
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                        value: "1",
                        child: Row(
                          children: <Widget>[
                            Text(
                              "1.	",
                              style: TextStyle(color: Colors.white),
                            ),
                            Expanded(
                              child: Text(
                                "General Enquiries",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: "2",
                        child: Row(
                          children: <Widget>[
                            Text(
                              "2.	",
                              style: TextStyle(color: Colors.white),
                            ),
                            Expanded(
                              child: Text(
                                "Support",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: "3",
                        child: Row(
                          children: <Widget>[
                            Text(
                              "3.	",
                              style: TextStyle(color: Colors.white),
                            ),
                            Expanded(
                              child: Text(
                                "Refunds",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: "4",
                        child: Row(
                          children: <Widget>[
                            Text(
                              "4.	",
                              style: TextStyle(color: Colors.white),
                            ),
                            Expanded(
                              child: Text(
                                "Artist",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: "5",
                        child: Row(
                          children: <Widget>[
                            Text(
                              "5.	",
                              style: TextStyle(color: Colors.white),
                            ),
                            Expanded(
                              child: Text(
                                "Public Benefit",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: "6",
                        child: Row(
                          children: <Widget>[
                            Text(
                              "6.	",
                              style: TextStyle(color: Colors.white),
                            ),
                            Expanded(
                              child: Text(
                                "Partner",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: "7",
                        child: Row(
                          children: <Widget>[
                            Text(
                              "7.	",
                              style: TextStyle(color: Colors.white),
                            ),
                            Expanded(
                              child: Text(
                                "Other",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _valueEnquiry = value;
                      });
                    },
                    value: _valueEnquiry,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Form(
//                    key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
                  child: Container(
                    height: 175,
                    child: TextFormField(
                      maxLines: 10,
                      style: TextStyle(color: Colors.grey[800]),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'Added Info',
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
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
