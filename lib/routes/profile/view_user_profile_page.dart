import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../appPromoCode/app_promo_code.dart';
import '../codes/code_page.dart';
import '../myMoneyGiftRewards/my_money_gift_rewards.dart';
import '../mySFTs/my_sfts.dart';
import 'edit_user_profile_page_1.dart';
import 'update_password_page.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';

var scaffoldKey = new GlobalKey<ScaffoldState>();

class ViewUserProfilePage extends StatefulWidget {
  @override
  State<ViewUserProfilePage> createState() => _ViewUserProfilePageState();
}

class _ViewUserProfilePageState extends State<ViewUserProfilePage> {
  File takeImg;
  File uploadImg;
  //GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.black,
      appBar: AppBarBuy(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 50),
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              AutoSizeText(
                "PROFILE",
                style: CTheme.textRegular16LightGrey(),
                textAlign: Localization.textAlignLeft(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: _profileImage(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: _profileDetails(context),
              ),
              _buttons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttons(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 4),
            child: Container(
              height: 50,
              child: FlatButton(
                child: AutoSizeText(
                  Localization.stLocalized("editInfo"),
                  style: CTheme.textRegular16White(),
                  textAlign: TextAlign.center,
                  minFontSize: 12,
                ),
                onPressed: () {
                  Get.to(() => EditUserProfilePage());
                },
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(70, 69, 69, 1), borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.white)),
              padding: EdgeInsets.all(8),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 4),
            child: Container(
              height: 50,
              child: FlatButton(
                child: AutoSizeText(
                  Localization.stLocalized("changePassword"),
                  style: CTheme.textRegular16White(),
                  textAlign: TextAlign.center,
                  minFontSize: 12,
                ),
                onPressed: () {
                  Get.to(() => UpdatePasswordPage());
                },
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(70, 69, 69, 1), borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.white)),
              padding: EdgeInsets.all(8),
            ),
          ),
        ],
      ),
    );
  }

  _profileImage() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  titlePadding: EdgeInsets.all(0),
                  //Title of the dialog
                  title: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(112, 112, 112, 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
                            child: Text("Select from",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(fontSize: 20, color: Colors.white),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03),
                              child: CircleAvatar(
                                  backgroundColor: Colors.white, radius: 10, child: Icon(Icons.close, size: 15, color: Colors.black)),
                            ),
                          )
                        ],
                      )),
                  //content of the dialog
                  content: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  openGallery();
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.13,
                                  width: MediaQuery.of(context).size.height * 0.13,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFEFEFEF),
                                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.08)),
                                  child: Icon(
                                    Icons.photo,
                                    size: MediaQuery.of(context).size.height * 0.08,
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  openCamera();
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.13,
                                  width: MediaQuery.of(context).size.height * 0.13,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFEFEFEF),
                                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.08)),
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: MediaQuery.of(context).size.height * 0.07,
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: Color.fromRGBO(70, 69, 69, 1), borderRadius: BorderRadius.circular(100), border: Border.all(color: Colors.white)),
            child: uploadImg == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Icon(
                            Icons.person,
                            size: 69,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 23,
                          ),
                        ),
                      ],
                    ),
                  )
                : ClipOval(
                    child: new Image.file(uploadImg, height: 100, width: 100, fit: BoxFit.cover),
                  )),
      ),
    );
    // return Container(
    //     width: 135,
    //     height: 135,
    //     decoration: BoxDecoration(
    //         color: Color.fromRGBO(70, 69, 69, 1),
    //         borderRadius: BorderRadius.circular(100),
    //         border: Border.all(color: Colors.white)),
    //     child: Center(
    //       child: Padding(
    //           padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    //           child: UserModel().playerModel?.data?.photo == "" ||
    //                   UserModel().playerModel?.data?.photo == null
    //               ? IconButton(
    //                   icon: Column(
    //                     mainAxisSize: MainAxisSize.min,
    //                     children: [
    //                       Icon(Icons.person, size: 75),
    //                       Icon(Icons.add, size: 24),
    //                     ],
    //                   ),
    //                   iconSize: 100,
    //                   color: Colors.white,
    //                   onPressed: () => {},
    //                 )
    //               : CircleAvatar(
    //                   radius: 75,
    //                   backgroundImage: NetworkImage("${Endpoints.baseUrl}" +
    //                       UserModel().playerModel.data.photo.replaceFirst(".", "")),
    //                 )),
    //     ));
  }

  _profileDetails(BuildContext context) {
    return Column(
      children: <Widget>[
        _profileDataRow(title: "Choohoo ID:", value: ""),
        SizedBox(height: 20),
        _profileDataRow(title: "My Money-Rewards:", value: "", function: () => Get.to(() => MyMoneyGiftRewards())),
        _profileDataRow(title: "My SFTs:", value: "", function: () => Get.to(() => MySFTsPage())),
        _profileDataRow(title: "Special Codes Available:", value: "", function: () => Get.to(() => CodePage())),
        _profileDataRow(title: "Super Special Codes Available:", value: "", function: () => Get.to(() => CodePage())),
        _profileDataRow(title: "Promo Codes:", value: "", function: () => Get.to(() => AppPromoCodePage())),
        SizedBox(height: 20),
        _profileDataRow(title: "Name:", value: ""),
        _profileDataRow(title: "Surname:", value: ""),
        _profileDataRow(title: "Nickname/Alias:", value: ""),
        _profileDataRow(title: "Email:", value: ""),
        _profileDataRow(title: "Mobile Number:", value: ""),
        _profileDataRow(title: "Country:", value: ""),
        _profileDataRow(title: "City:", value: ""),
        _profileDataRow(title: "Date of Birth:", value: ""),
        _profileDataRow(title: "Gender:", value: ""),
        _profileDataRow(title: "Address:", value: ""),
        _profileDataRow(title: "Facebook Handle:", value: ""),
        _profileDataRow(title: "Twitter Handle:", value: ""),
        _profileDataRow(title: "Instagram Handle:", value: ""),
        _profileDataRow(title: "Tiktok Handle:", value: ""),
        //TODO code comment
        /*_profileDataRow(
            title: "mobileNumber",
            value: UserModel().playerModel?.data?.mobileNo?.split('-')?.first?.contains('+')
                ? UserModel().playerModel?.data?.mobileNo?.replaceFirst('-', '')
                : '+' + UserModel().playerModel?.data?.mobileNo?.replaceFirst('-', '')),*/
        /*_profileDataRow(title: "country", value: UserModel().playerModel?.data?.country),
        _profileDataRow(title: "city", value: UserModel().playerModel?.data?.city),
        _profileDataRow(
            title: "dateOfBirth",
            value: UserModel().playerModel?.data?.dob.toString().split(' ').first),
        _profileDataRow(title: "gender", value: UserModel().playerModel?.data?.gender),*/
      ],
    );
  }

  _profileDataRow({String title, String value, Function function}) {
    return Container(
      padding: EdgeInsets.only(top: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: function,
              child: AutoSizeText(
                title,
                style: CTheme.textRegular16White(),
                textAlign: Localization.textAlignLeft(),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: AutoSizeText(
              value,
              style: CTheme.textRegular16White(),
              textAlign: Localization.textAlignLeft(),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }

  openGallery() async {
    final rawImg = await ImagePicker().getImage(source: ImageSource.gallery, imageQuality: 30);
    if (rawImg != null) {
      File cropped = await ImageCropper.cropImage(
        sourcePath: rawImg.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      );
      if (cropped != null)
        setState(() {
          uploadImg = cropped;
        });
      // Authentication.uploadProfilePic(uploadImg);
    } else {
      setState(() {
        uploadImg = null;
      });
    }
  }

  openCamera() async {
    final rawImg = await ImagePicker().getImage(source: ImageSource.camera, imageQuality: 30);
    if (rawImg != null) {
      File cropped = await ImageCropper.cropImage(
        sourcePath: rawImg.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      );
      if (cropped != null)
        setState(() {
          uploadImg = cropped;
        });
      // Authentication.uploadProfilePic(uploadImg);
    } else {
      setState(() {
        uploadImg = null;
      });
    }
  }
}
