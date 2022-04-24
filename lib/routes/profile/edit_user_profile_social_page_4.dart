import 'package:auto_size_text/auto_size_text.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Shared/Model/user_model.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../legal/legal_page.dart';
import 'view_user_profile_page.dart';
import '../signup/signup_profile_pic_page.dart';
import '../signup/verify_pin_page.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/CustomRadio.dart';
import '../../Shared/Model/countryModel.dart' as cModel;
import '../../utils/generic_ap_bar.dart';
import 'package:sizer/sizer.dart';

class EditUserProfileSocialPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditUserProfileSocialPageState();
  }
}

class EditUserProfileSocialPageState extends State<EditUserProfileSocialPage> {
  bool agreement = false;
  bool isCountriesShowing = false;
  List<cModel.CountryParse> countries;
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  FocusNode _fbFocus = FocusNode();
  FocusNode _twFocus = FocusNode();
  FocusNode _igFocus = FocusNode();
  FocusNode _tiktokFocus = FocusNode();

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
                    // SizedBox(height: 15),
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
                          onPressed: () async {
                            Get.to(() => SignupProfilePicPage(sourcePage: FromPage.ProfileEdit));
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
        Container(
          child: CustomRadio(),
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
                      focusNode: _fbFocus,
                      onEditingComplete: () {
                        _twFocus.requestFocus();
                      },
                      onChanged: (value) => UserModel().facebookHandler = value,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'Facebook Handle @Name',
                        
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white),
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
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      focusNode: _twFocus,
                      onEditingComplete: () {
                        _igFocus.requestFocus();
                      },
                      onChanged: (value) => UserModel().twitterHandler = value,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'Twitter Handle @Name',
                        hintStyle: TextStyle(
                           fontSize: 14.sp,
                          color: Colors.white),
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
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      focusNode: _igFocus,
                      onEditingComplete: () {
                        _tiktokFocus.requestFocus();
                      },
                      onChanged: (value) => UserModel().instaHandler = value,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'Instagram Handle @Name',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white),
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
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      focusNode: _tiktokFocus,
                      onChanged: (value) => UserModel().tiktokHandler = value,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                        hintText: 'TikTok Handle @Name',
                        hintStyle: TextStyle(
                           fontSize: 14.sp,
                          color: Colors.white),
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
          padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(70, 69, 69, 1), borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.white)),
                child: Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Color.fromRGBO(70, 69, 69, 1),
                  ),
                  child: Checkbox(
                      activeColor: Color.fromRGBO(70, 69, 69, 1),
                      checkColor: Colors.white,
                      value: agreement,
                      onChanged: (bool value) {
                        if (value == true) {
                          setState(() {
                            agreement = value;
                          });
                        } else {
                          setState(() {
                            agreement = value;
                          });
                        }
                      }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                    child: InkWell(
                      onTap: () {
                        if (!agreement) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LegalPage(
                                        openFromSignUp: false,
                                        agreed: (v) {
                                          setState(() {
                                            agreement = v;
                                          });
                                          Navigator.pop(context);
                                        },
                                      )));
                        } else {
                          setState(() {
                            agreement = false;
                          });
                        }
                      },
                      child: AutoSizeText(
                        'By Signing Up you agree to our Terms,' + '\nPrivacy Policy and End User License Agreement',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xFF9D9B9D),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
