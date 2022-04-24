import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../profile/view_user_profile_page.dart';
import '../../utils/AppBarMain.dart';
import '../../utils/CustomDrawer.dart';
import 'package:flutter/material.dart';

import 'found_it_photo_sent_page.dart';

class FoundItSubImagePage extends StatefulWidget {
  @override
  _FoundItSubImagePage createState() => _FoundItSubImagePage();
}

class _FoundItSubImagePage extends State<FoundItSubImagePage> {
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
      bottomNavigationBar: Container(
        color: Color.fromRGBO(45, 45, 45, 1),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: IconButton(
                icon: Image.asset('assets/images/sendphotoiconbtn.png'),
                iconSize: 210,
                color: Colors.white,
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoundItPhotoSentPage()),
                  )
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      drawer: CustomDrawer(context: context),
      appBar: AppBarMain(scaffoldKey: scaffoldKey),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/splash/chohoo_img.png'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text("      if yoo find it,\n   it's for yoo hoo   ",
                      style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 16, fontWeight: FontWeight.w100)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text("UPLOAD YOUR CHOOHOO PHOTO",
                      style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 18)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            "Submit a photo of you and/or your friends"
                            " with the Choohoo somewhere in the picture eg. "
                            "Someone could hold the Choohoo etc.",
                            style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 14)),
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
                          color: Colors.white,
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
                      child: Text("Step 1. TAKE PHOTO", style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 18)),
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
                            decoration: BoxDecoration(color: Color.fromRGBO(70, 69, 69, 1), borderRadius: BorderRadius.circular(20)),
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
                                    'Step 2. UPLOAD PHOTO',
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
                            "Great! x1 Photo has been uploaded Sorry,"
                            " Photo has not been uploaded, please try again",
                            style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 14)),
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
