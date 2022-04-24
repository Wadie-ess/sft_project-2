import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/widgets/stepper.dart';
import 'claim_page_1.dart';

class PhotoSentPage extends StatefulWidget {
  @override
  _PhotoSentPage createState() => _PhotoSentPage();
}

class _PhotoSentPage extends State<PhotoSentPage> {
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
                  child: Text("MY MONEY-REWARDS | SEND PHOTO",
                      textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Roboto', color: Colors.grey[800], fontSize: 16)),
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
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 5),
                  child: CircularProgressIndicator(
                    backgroundColor: Color.fromRGBO(112, 112, 112, 1),
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.grey[300],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text("Processing", style: TextStyle(fontFamily: 'Roboto', color: Colors.grey[800], fontSize: 16)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Your photo has been sent to the Choohoo Team\n\nIt might also appear on Social Media within 24hrs.\n\nSorry, your Photo has not been sent. Please try again. If sending the photo consistently fails, please try taking a different photo, if that does not work please contact the Choohoo Team by clicking here",
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
                      Get.to(() => ClaimPage());
                      return;
                    },
                  ),
                ),
                SizedBox(height: 50),
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
