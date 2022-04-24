import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/CColors.dart';
import '../foundit/found_it_photo_sent_page.dart';
import '../foundit/second_answer_page.dart';
import '../main/my_home_page.dart';
import 'claim_page_1.dart';
import 'my_money_gift_rewards.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/AppBarMain.dart';
import '../../utils/CustomDrawer.dart';
import 'package:flutter/material.dart';
import '../../utils/widgets/stepper.dart';

class ThanksPage extends StatefulWidget {
  @override
  _ThanksPage createState() => _ThanksPage();
}

class _ThanksPage extends State<ThanksPage> {
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
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text("MY MONEY-REWARDS | STATUS", style: TextStyle(fontFamily: 'Roboto', color: Colors.grey[800], fontSize: 16)),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: AppStepper(active: 3),
                ),
                SizedBox(height: 30),
                Text(
                  "STEP 3",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Thanks!\n\nMoney-Reward claimed by you on:\nDate | Time\n\nMoney-Reward sent by Choohoo to you on:\nDate | Time / Not Sent Yet",
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
                      Get.to(() => MyMoneyGiftRewards());
                      return;
                    },
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
