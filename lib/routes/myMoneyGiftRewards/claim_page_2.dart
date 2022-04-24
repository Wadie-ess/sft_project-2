import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/CColors.dart';
import '../foundit/found_it_photo_sent_page.dart';
import '../foundit/second_answer_page.dart';
import '../main/my_home_page.dart';
import 'claim_page_1.dart';
import 'thanks_page.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/AppBarMain.dart';
import '../../utils/CustomDrawer.dart';
import 'package:flutter/material.dart';
import '../../utils/widgets/stepper.dart';

class ClaimPage2 extends StatefulWidget {
  @override
  _ClaimPage2 createState() => _ClaimPage2();
}

class _ClaimPage2 extends State<ClaimPage2> {
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
                  child: Text("MY MONEY-REWARDS | CLAIM",
                      textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Roboto', color: Colors.grey[800], fontSize: 16)),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: AppStepper(active: 2),
                ),
                SizedBox(height: 30),
                Text(
                  "STEP 2",
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
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Thank you for claiming\nYour Money-Reward.\n\nYou will receive a notification when your Money-Reward has been sent.\n\nThis will take approximately\n1.5 weeks.\n\nCheck your\nin-app notifications menu\n\nand your email.\n\nDisplay relevant error or unsuccessful message pending fields not filled.",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.grey[800],
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.center,
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
                      Get.to(() => ThanksPage());
                      return;
                    },
                  ),
                ),
                SizedBox(height: 70),
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
