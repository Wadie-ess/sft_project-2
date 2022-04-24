import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/CColors.dart';
import 'photo_sent_page.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import 'package:flutter/material.dart';
import '../../utils/widgets/stepper.dart';

class TakePhotoPage extends StatefulWidget {
  @override
  _TakePhotoPage createState() => _TakePhotoPage();
}

class _TakePhotoPage extends State<TakePhotoPage> {
  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;
  File takeImg;
  File uploadImg;

  @override
  void initState() {
    super.initState();
  }

  Widget _sendPhotoBotomBar() {
    return InkWell(
      onTap: () => Get.to(() => PhotoSentPage()),
      child: Container(
        color: Color.fromRGBO(45, 45, 45, 1),
        height: 60,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'c.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xffb4b3b4), fontSize: 16),
              ),
              Text(
                'SEND YOUR PHOTO  ',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Icon(Icons.arrow_forward, size: 22, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _sendPhotoBotomBar(),
      backgroundColor: Colors.white,
      drawer: CustomDrawer(context: context),
      appBar: AppBarBuy(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 30, 16, 0),
                  child: Text(
                    "MY MONEY-REWARDS | SEND PHOTO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.grey[800],
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: AppStepper(active: 1),
                ),
                SizedBox(height: 30),
                Text(
                  "STEP 1",
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
                          "Congratulations! In order to receive your Money-Reward, first send us a happy and fun photo of yourself in any setting, then provide us the details required in Step 2.",
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
                GestureDetector(
                  onTap: () => openCamera(),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 15, 0),
                      child: /*takeImg==null?*/ IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                          size: 45,
                        ),
                        onPressed: () => openCamera(),
                      ) /*:new Image.file(takeImg,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover)*/
                      ,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text("a. TAKE PHOTO", style: TextStyle(fontFamily: 'Roboto', color: Colors.grey[800], fontSize: 18)),
                    ),
                  ]),
                ),
                GestureDetector(
                  onTap: () => openGallery(),
                  child: uploadImg == null
                      ? Padding(
                          padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 160,
                            width: 345,
                            decoration: BoxDecoration(color: CColor.appBlackLight, borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.add_circle,
                                      color: Colors.white,
                                    ),
                                    iconSize: 50,
                                    onPressed: () => openGallery(),
                                  ),
                                  Text(
                                    'b. UPLOAD PHOTO',
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: new Image.file(uploadImg, height: 150, width: MediaQuery.of(context).size.width, fit: BoxFit.fitWidth),
                          ),
                        ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            "Great! x1 Photo has been uploaded"
                            "\nSorry, Photo has not been uploaded, please try again",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'Roboto', color: Colors.grey[800], fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  openGallery() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      uploadImg = File(pickedFile.path);
    });
  }

  openCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      takeImg = File(pickedFile.path);
    });
  }
}
