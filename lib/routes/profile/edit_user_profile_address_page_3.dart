import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../Shared/Model/user_model.dart';
import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import 'view_user_profile_page.dart';
import '../../utils/CustomDrawer.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../../Shared/Model/countryModel.dart' as cModel;
import '../../utils/generic_ap_bar.dart';

import 'edit_user_profile_social_page_4.dart';

class EditUserProfileAddressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditUserProfileAddressPageState();
  }
}

class EditUserProfileAddressPageState extends State<EditUserProfileAddressPage> {
  List<cModel.State> statesOfCountry;
  List<cModel.City> cityOfStates;
  String countryValue = "Country*";
  String stateValue = "Select State/Province*";
  String cityValue = "Select City*";
  String countryCode = "+27";
  String addressHint = "Address (Optional, only if you want to)";

  List<cModel.CountryParse> countries;
  String phoneNo;

  //loading
  bool loading = true;

  //FocusNode
  FocusNode _addressFocus = FocusNode();
  FocusNode _phoneFocus = FocusNode();

  //missing or wrong fields
  bool _country = false;
  bool _city = false;
  bool _state = false;
  bool _countryCode = false;
  bool _phone = false;

  //unfocusing
  unFocusAllFields() {
    _addressFocus.unfocus();
    _phoneFocus.unfocus();
    FocusScope.of(context).unfocus();
  }

  Future<void> getCountryData() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/country.json");
    countries = cModel.countryParseFromJson(data);
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  bool isCountriesShowing = false;
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  File takeImg;
  File uploadImg;
  String pwd1, pwd2;
  List<DropdownMenuItem<String>> listOfDropdown = [];
  String selectedCountryCallingCode = "";

  @override
  void initState() {
    super.initState();
    getCountryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        drawer: CustomDrawer(context: context),
        appBar: GenericAppBar(
          showMenu: true,
          showBackButton: true,
          showLoginButton: false,
          showRegButton: false,
        ),
        body: loading
            ? Center(
                child: CircularProgressIndicator(
                color: CColor.appYellow,
              ))
            : SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 50),
                child: Container(
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        AutoSizeText(
                          Localization.stLocalized("profileEdit").toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: CTheme.defaultFont(),
                            color: Color.fromRGBO(180, 179, 180, 1),
                          ),
                          textAlign: Localization.textAlignLeft(),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        //   child: _profileImage(),
                        // ),
                        SizedBox(height: 15),
                        _profileEditFields(context: context),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 60),
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
                                Get.to(() => EditUserProfileSocialPage());
                              },
                            ),
                          ),
                        ),
                      ],
                    ))));
  }

  // _profileImage() {
  //   return GestureDetector(
  //     onTap: () {
  //       showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return AlertDialog(
  //               titlePadding: EdgeInsets.all(0),
  //               //Title of the dialog
  //               title: Container(
  //                   height: MediaQuery.of(context).size.height * 0.06,
  //                   decoration: BoxDecoration(
  //                     color: Color.fromRGBO(112, 112, 112, 1),
  //                   ),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Container(
  //                         margin: EdgeInsets.only(
  //                             left: MediaQuery.of(context).size.width * 0.03),
  //                         child: Text("Select from",
  //                             style: GoogleFonts.roboto(
  //                               textStyle: TextStyle(
  //                                   fontSize: 20, color: Colors.white),
  //                             )),
  //                       ),
  //                       GestureDetector(
  //                         onTap: () {
  //                           Navigator.pop(context);
  //                         },
  //                         child: Container(
  //                           margin: EdgeInsets.only(
  //                               right:
  //                                   MediaQuery.of(context).size.width * 0.03),
  //                           child: CircleAvatar(
  //                               backgroundColor: Colors.white,
  //                               radius: 10,
  //                               child: Icon(Icons.close,
  //                                   size: 15, color: Colors.black)),
  //                         ),
  //                       )
  //                     ],
  //                   )),
  //               //content of the dialog
  //               content: Container(
  //                 height: MediaQuery.of(context).size.height * 0.2,
  //                 width: MediaQuery.of(context).size.width,
  //                 child: Form(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       SizedBox(
  //                         height: MediaQuery.of(context).size.height * 0.03,
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           GestureDetector(
  //                             onTap: () {
  //                               Navigator.pop(context);
  //                               openGallery();
  //                             },
  //                             child: Container(
  //                               height:
  //                                   MediaQuery.of(context).size.height * 0.13,
  //                               width:
  //                                   MediaQuery.of(context).size.height * 0.13,
  //                               decoration: BoxDecoration(
  //                                   color: Color(0xFFEFEFEF),
  //                                   borderRadius: BorderRadius.circular(
  //                                       MediaQuery.of(context).size.height *
  //                                           0.08)),
  //                               child: Icon(
  //                                 Icons.photo,
  //                                 size:
  //                                     MediaQuery.of(context).size.height * 0.08,
  //                                 color: Color.fromRGBO(112, 112, 112, 1),
  //                               ),
  //                             ),
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               Navigator.pop(context);
  //                               openCamera();
  //                             },
  //                             child: Container(
  //                               height:
  //                                   MediaQuery.of(context).size.height * 0.13,
  //                               width:
  //                                   MediaQuery.of(context).size.height * 0.13,
  //                               decoration: BoxDecoration(
  //                                   color: Color(0xFFEFEFEF),
  //                                   borderRadius: BorderRadius.circular(
  //                                       MediaQuery.of(context).size.height *
  //                                           0.08)),
  //                               child: Icon(
  //                                 Icons.camera_alt,
  //                                 size:
  //                                     MediaQuery.of(context).size.height * 0.07,
  //                                 color: Color.fromRGBO(112, 112, 112, 1),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             );
  //           });
  //     },
  //     child: Container(
  //         width: 135,
  //         height: 135,
  //         decoration: BoxDecoration(
  //             color: Color.fromRGBO(70, 69, 69, 1),
  //             borderRadius: BorderRadius.circular(100),
  //             border: Border.all(color: Colors.white)),
  //         child: uploadImg == null
  //             ? Center(
  //                 child: Column(
  //                   children: <Widget>[
  //                     Expanded(
  //                       child: Padding(
  //                         padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
  //                         child: Icon(
  //                           Icons.person,
  //                           size: 80,
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                     ),
  //                     Expanded(
  //                       child: Padding(
  //                         padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
  //                         child: Icon(
  //                           Icons.add,
  //                           size: 30,
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             : ClipOval(
  //                 child: new Image.file(uploadImg,
  //                     height: 135, width: 135, fit: BoxFit.cover),
  //               )),
  //   );
  // }

  _profileEditFields({BuildContext context}) {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          margin: const EdgeInsets.fromLTRB(16, 15, 16, 0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(70, 69, 69, 1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _country ? Colors.yellow : Colors.white,
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
                  labelText: "Search a country",
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
                contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
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
                margin: const EdgeInsets.fromLTRB(16, 15, 16, 0),
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
                      labelText: "Search a state",
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
                margin: const EdgeInsets.fromLTRB(16, 15, 16, 0),
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
                      labelText: "Search a city",
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
          padding: const EdgeInsets.fromLTRB(16, 15, 16, 0),
          child: Row(
            children: <Widget>[
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(70, 69, 69, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(0)),
                    border: Border.all(color: _countryCode ? Colors.yellow : Colors.white)),
                child: SizedBox(
                  width: 80,
                  height: 50,
                  child: CountryCodePicker(
                    onChanged: (val) {
                      setState(() {
                        _countryCode = false;
                        countryCode = val.toString();
                        print(countryCode);
                      });
                    },
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: 'ZA',
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 16,
                    ),
                    textOverflow: TextOverflow.visible,
                    hideSearch: false,
                    showDropDownButton: false,
                    showFlag: true,
                    showFlagMain: false,
                    showOnlyCountryWhenClosed: false,
                    backgroundColor: Colors.white,
                    // flag can be styled with BoxDecoration's `borderRadius` and `shape` fields
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(20)),
                      border: Border.all(color: _phone ? Colors.yellow : Colors.white, width: 1, style: BorderStyle.solid),
                      color: Color.fromRGBO(70, 69, 69, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                      child: TextFormField(
                        focusNode: _phoneFocus,
                        maxLength: 11,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        onChanged: (value) {
                          if (value.length < 12) {
                            setState(() {
                              _phone = false;
                              phoneNo = value;
                              print(countryCode + phoneNo);
                            });
                            String combinedPhoneNo = countryCode + '-' + phoneNo;
                            UserModel().mobileNo = combinedPhoneNo;
                          }
                        },
                        onFieldSubmitted: (val) {
                          FocusScope.of(context).unfocus();
                        },
                        onEditingComplete: () {},
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          hintText: 'Mobile Number*',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                          filled: true,
                          counterText: "",
                          fillColor: Color.fromRGBO(70, 69, 69, 1),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(70, 69, 69, 1),
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(70, 69, 69, 1),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(const Radius.circular(20))),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Form(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    child: TextFormField(
                      focusNode: _addressFocus,
                      onChanged: (value) {
                        UserModel().address = value;
                      },
                      onEditingComplete: () {
                        // _createPassFocus.requestFocus();
                      },
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).unfocus();
                      },
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      minLines: 1,
                      maxLines: 50,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'Address (Optional, only if you want to)',
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

  // openGallery() async {
  //   final rawImg = await ImagePicker()
  //       .getImage(source: ImageSource.gallery, imageQuality: 30);
  //   if (rawImg != null) {
  //     File cropped = await ImageCropper.cropImage(
  //       sourcePath: rawImg.path,
  //       aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
  //     );
  //     if (cropped != null)
  //       setState(() {
  //         uploadImg = cropped;
  //       });
  //     Authentication.uploadProfilePic(uploadImg);
  //   } else {
  //     setState(() {
  //       uploadImg = null;
  //     });
  //   }
  // }
  //
  // void _showpasswordtoggle2() {
  //   setState(() {
  //     _obscureText2 = !_obscureText2;
  //   });
  // }
  //
  // openCamera() async {
  //   final rawImg = await ImagePicker()
  //       .getImage(source: ImageSource.camera, imageQuality: 30);
  //   if (rawImg != null) {
  //     File cropped = await ImageCropper.cropImage(
  //       sourcePath: rawImg.path,
  //       aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
  //     );
  //     if (cropped != null)
  //       setState(() {
  //         uploadImg = cropped;
  //       });
  //     Authentication.uploadProfilePic(uploadImg);
  //   } else {
  //     setState(() {
  //       uploadImg = null;
  //     });
  //   }
  // }
}
