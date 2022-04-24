import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Shared/Model/countryModel.dart' as cModel;
import '../../Shared/Model/user_model.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/generic_ap_bar.dart';
import 'edit_user_profile_passowrd_page_2.dart';

class EditUserProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditUserProfilePageState();
  }
}

class EditUserProfilePageState extends State<EditUserProfilePage> {
  List<cModel.State> statesOfCountry;
  List<cModel.City> cityOfStates;

  List<cModel.CountryParse> countries;
  final GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  String countryCode = "+39";
  String phoneNo;
  File takeImg;
  File uploadImg;
  String pwd1, pwd2;
  List<DropdownMenuItem<String>> listOfDropdown = [];
  String selectedCountryCallingCode = "";

  //Focus Node
  FocusNode _nameFocus = FocusNode();
  FocusNode _surNameFocus = FocusNode();
  FocusNode _nickNameFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _addressFocus = FocusNode();
  FocusNode _createPassFocus = FocusNode();

  TextEditingController _firstName = TextEditingController();
  TextEditingController _surname = TextEditingController();
  TextEditingController _nickName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _address = TextEditingController();

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
                          onPressed: () {
                            Get.to(() => EditUserProfilePasswordPage());
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
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      controller: _firstName,
                      focusNode: _nameFocus,
                      onChanged: (value) => UserModel().name = value,
                      onEditingComplete: () {
                        _surNameFocus.requestFocus();
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
                      controller: _surname,
                      focusNode: _surNameFocus,
                      onChanged: (value) => UserModel().surname = value,
                      onEditingComplete: () {
                        _nickNameFocus.requestFocus();
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
                      controller: _nickName,
                      focusNode: _nickNameFocus,
                      onChanged: (value) => UserModel().nickName = value,
                      onEditingComplete: () {
                        _emailFocus.requestFocus();
                      },
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'Nickname or Alias (optional)',
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
                      controller: _email,
                      focusNode: _emailFocus,
                      onChanged: (value) => UserModel().email = value,
                      onEditingComplete: () {
                        _addressFocus.requestFocus();
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
                      controller: _address,
                      focusNode: _addressFocus,
                      onChanged: (value) {
                        UserModel().address = value;
                      },
                      onEditingComplete: () {
                        _createPassFocus.requestFocus();
                      },
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'Enter email again to confirm*',
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
