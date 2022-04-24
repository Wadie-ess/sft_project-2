import 'dart:convert';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../Shared/DAL/Authentication.dart';
import '../../Shared/Model/security_question_model.dart';
import '../../Shared/Model/user_model.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import 'edit_user_profile_address_page_3.dart';
import 'view_user_profile_page.dart';
import '../signup/country_state_city_picker_custom.dart';
import '../signup/signup_welcome_page.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CommonUtils.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/CustomRadio.dart';
import '../../utils/city_country_picker/country_picker.dart' as countryPicker;
import "package:http/http.dart" as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../../Shared/Model/countryModel.dart' as cModel;
import '../../utils/generic_ap_bar.dart';

class EditUserProfilePasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditUserProfilePasswordPageState();
  }
}

class EditUserProfilePasswordPageState extends State<EditUserProfilePasswordPage> {
  List<cModel.State> statesOfCountry;
  List<cModel.City> cityOfStates;
  String countryValue = "Select Country*";
  String stateValue = "Select State / Province";
  String cityValue = "Select City";
  bool isCountriesShowing = false;
  List<cModel.CountryParse> countries;
  final GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  String countryCode = "+39";
  String phoneNo;
  String _valueSQ;
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  String _valueDOB = "Date Of Birth dd/mm/yy*";
  DateTime _valueinDTO;
  File takeImg;
  File uploadImg;
  String pwd1, pwd2;
  List<DropdownMenuItem<String>> listOfDropdown = [];
  String selectedCountryCallingCode = "";

  //Focus Node
  FocusNode _createPassFocus = FocusNode();
  FocusNode _confirmPassFocus = FocusNode();

  //focus nodes
  FocusNode _sQfocus = FocusNode();

  //missing / wrong fields
  bool _passNotMatch = false;
  bool _sQ = false;
  bool _sqAnswer = false;

  //unfocusing
  unFocusAllFields() {
    _createPassFocus.unfocus();
    _confirmPassFocus.unfocus();
    _sQfocus.unfocus();
  }

  void _showPasswordToggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _showPasswordToggle2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  List<DropdownMenuItem<String>> dropDownMenuItems() {
    // print(SecurityQuestionModel().questions);
    List<DropdownMenuItem<String>> questions = [];
    for (int i = 0; i < SecurityQuestionModel().questions.length; i++) {
      questions.add(DropdownMenuItem(
        value: SecurityQuestionModel().questions[i].questionId.toString(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "${i + 1}.	",
              style: TextStyle(color: Colors.white),
            ),
            Expanded(
              child: Text(
                SecurityQuestionModel().questions[i].question,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ));
    }

    return questions;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        drawer: CustomDrawer(context: context),
        appBar: GenericAppBar(showMenu: true, showBackButton: true, showLoginButton: false, showRegButton: false),
        body: SingleChildScrollView(
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
                          onPressed: () {
                            Get.to(() => EditUserProfileAddressPage());
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
  //                         margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
  //                         child: Text("Select from",
  //                             style: GoogleFonts.roboto(
  //                               textStyle: TextStyle(fontSize: 20, color: Colors.white),
  //                             )),
  //                       ),
  //                       GestureDetector(
  //                         onTap: () {
  //                           Navigator.pop(context);
  //                         },
  //                         child: Container(
  //                           margin:
  //                               EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03),
  //                           child: CircleAvatar(
  //                               backgroundColor: Colors.white,
  //                               radius: 10,
  //                               child: Icon(Icons.close, size: 15, color: Colors.black)),
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
  //                               height: MediaQuery.of(context).size.height * 0.13,
  //                               width: MediaQuery.of(context).size.height * 0.13,
  //                               decoration: BoxDecoration(
  //                                   color: Color(0xFFEFEFEF),
  //                                   borderRadius: BorderRadius.circular(
  //                                       MediaQuery.of(context).size.height * 0.08)),
  //                               child: Icon(
  //                                 Icons.photo,
  //                                 size: MediaQuery.of(context).size.height * 0.08,
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
  //                               height: MediaQuery.of(context).size.height * 0.13,
  //                               width: MediaQuery.of(context).size.height * 0.13,
  //                               decoration: BoxDecoration(
  //                                   color: Color(0xFFEFEFEF),
  //                                   borderRadius: BorderRadius.circular(
  //                                       MediaQuery.of(context).size.height * 0.08)),
  //                               child: Icon(
  //                                 Icons.camera_alt,
  //                                 size: MediaQuery.of(context).size.height * 0.07,
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
  //                 child: new Image.file(uploadImg, height: 135, width: 135, fit: BoxFit.cover),
  //               )),
  //   );
  // }

  _profileEditFields({BuildContext context}) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Form(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      focusNode: _createPassFocus,
                      onChanged: (value) {
                        setState(() {
                          _passNotMatch = false;
                        });
                        UserModel().password = value;
                        pwd1 = value;
                      },
                      onEditingComplete: () {
                        _confirmPassFocus.requestFocus();
                      },
                      obscureText: _obscureText1,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        suffixIcon: Container(
                          width: 66,
                          child: FlatButton(
                              padding: EdgeInsets.only(right: 16),
                              splashColor: Colors.transparent,
                              onPressed: _showPasswordToggle1,
                              child: Align(
                                  child: new Text(
                                _obscureText1 ? "SHOW" : "HIDE",
                                style: TextStyle(color: Color.fromRGBO(180, 179, 180, 1)),
                              ))),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 0, 14),
                        hintText: 'Create Password*',
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
                              color: _passNotMatch ? Colors.yellow : Colors.white,
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
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Form(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      focusNode: _confirmPassFocus,
                      onChanged: (value) {
                        setState(() {
                          _passNotMatch = false;
                        });
                        pwd2 = value;
                      },
                      obscureText: _obscureText2,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        suffixIcon: Container(
                          width: 66,
                          child: FlatButton(
                              padding: EdgeInsets.only(right: 16),
                              splashColor: Colors.transparent,
                              onPressed: _showPasswordToggle2,
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: new Text(
                                    _obscureText2 ? "SHOW" : "HIDE",
                                    style: TextStyle(color: Color.fromRGBO(180, 179, 180, 1)),
                                  ))),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 0, 14),
                        hintText: 'Enter Password again*',
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
                              color: _passNotMatch ? Colors.yellow : Colors.white,
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
          padding: const EdgeInsets.fromLTRB(16, 15, 16, 0),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Color.fromRGBO(70, 69, 69, 1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: _sQ ? Colors.yellow : Colors.white)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor: Color.fromRGBO(70, 69, 69, 1)),
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    underline: Container(),
                    iconEnabledColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    hint: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Security Question*',
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 16, color: Colors.white),
                      ),
                    ),
                    isExpanded: true,
                    items: dropDownMenuItems(),
                    onChanged: (value) {
                      UserModel().securityuestionID = value;
                      setState(() {
                        _valueSQ = value;
                        _sQ = false;
                      });
                    },
                    value: _valueSQ,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
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
                        setState(() {
                          _sqAnswer = false;
                        });
                        return UserModel().securityAnswer = value;
                      },
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'Security Answer*',
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
                              color: _sqAnswer ? Colors.yellow : Colors.white,
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

  // void _showpasswordtoggle1() {
  //   setState(() {
  //     _obscureText1 = !_obscureText1;
  //   });
  // }
  //
  // openGallery() async {
  //   final rawImg = await ImagePicker().getImage(source: ImageSource.gallery, imageQuality: 30);
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
  //   final rawImg = await ImagePicker().getImage(source: ImageSource.camera, imageQuality: 30);
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
  // Future<void> getCountryData() async {
  //   String data = await DefaultAssetBundle.of(context).loadString("assets/country.json");
  //   countries = cModel.countryParseFromJson(data);
  //   WidgetsFlutterBinding.ensureInitialized();
  //   if (mounted) {
  //     setState(() {
  //       isCountriesShowing = true;
  //     });
  //   }
  // }
}
