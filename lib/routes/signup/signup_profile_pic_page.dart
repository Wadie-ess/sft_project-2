// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/CColors.dart';
import 'verify_pin_page.dart';
import '../../Shared/DAL/Authentication.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/generic_ap_bar.dart';
import '../../utils/widgets/logo.dart';

class SignupProfilePicPage extends StatefulWidget {
  final FromPage sourcePage;

  const SignupProfilePicPage({Key key, this.sourcePage = FromPage.Signup}) : super(key: key);

  @override
  _SignupProfilePicPage createState() => _SignupProfilePicPage();
}

class _SignupProfilePicPage extends State<SignupProfilePicPage> {
  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;
  File takeImg;
  File uploadImg;

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
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                
                widget.sourcePage==FromPage.ProfileEdit?Container():ChoohooLogo(),
                widget.sourcePage==FromPage.ProfileEdit?Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text("PROFILE | EDIT INFO", style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 16)),
                ):Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Text("SIGN UP", style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 18)),
                ),
                
                Padding(
                  padding:  widget.sourcePage==FromPage.ProfileEdit?EdgeInsets.fromLTRB(0, 22, 0, 0):EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text("Add Profile Picture", style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 16)),
                ),
                Padding(
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
                                              backgroundColor: Colors.white,
                                              radius: 10,
                                              child: Icon(Icons.close, size: 15, color: Colors.black)),
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
                        width: 175,
                        height: 175,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white)),
                        child: uploadImg == null
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Icon(
                                        Icons.person,
                                        size: 100,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : ClipOval(
                                child: new Image.file(uploadImg, height: 175, width: 175, fit: BoxFit.cover),
                              )),
                  ),
                ),
                SizedBox(height: 30),
                Container(
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
                      bool status = await uploadImage();
                      print(status);
                      Get.to(() => VerifyPinPage(sourcePage: widget.sourcePage));
                      /*if (status) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => MainPage()),
                              );
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Failed To Upload Photo",
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_LONG);
                            }*/
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            "You can always add a profile picture later.\n\nPopup… Are you sure you want to continue\nwithout adding a profile picture?",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'Roboto', color: Color(0xFFEBF411), fontWeight: FontWeight.w300, fontSize: 16)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          side: BorderSide(color: Colors.white),
                        ),
                        color: CColor.appBlackLight,
                        padding: EdgeInsets.fromLTRB(18, 13, 18, 13),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VerifyPinPage(sourcePage: widget.sourcePage)),
                          );
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          side: BorderSide(color: Colors.white),
                        ),
                        color: CColor.appBlackLight,
                        padding: EdgeInsets.fromLTRB(18, 13, 18, 13),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VerifyPinPage(sourcePage: widget.sourcePage)),
                          );
                        },
                        child: Text(
                          'No',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> uploadImage() async {
    bool _result;
    print(uploadImg != null);
    if (uploadImg != null) {
      bool _res = await Authentication.uploadProfilePic(uploadImg);
      _result = _res;
    } else {
      Fluttertoast.showToast(msg: "Please select an image to upload", toastLength: Toast.LENGTH_LONG);
      _result = false;
    }
    return _result;
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
