import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/CustomDrawer.dart';
import '../../utils/generic_ap_bar.dart';
import '../../utils/widgets/AppText.dart';
import 'payment_done_page.dart';
import 'payment_method_page.dart';

// TODO: Link to SFT and POD details page
class SftPodDetails extends StatelessWidget {
  final String name;
  final dataKey = new GlobalKey();

  SftPodDetails({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context: context),
      backgroundColor: Colors.black,
      appBar: GenericAppBar(
        showMenu: true,
        showBackButton: true,
        showLoginButton: false,
        showRegButton: false,
        name: "Name/NickName",
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.only(bottom: 80),
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                    height: 70,
                    width: 180,
                    child: SvgPicture.asset('assets/onboarding/logo-white.svg'),
                      
                    
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                //   child: Container(
                //     height: 70,
                //     width: 180,
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: AssetImage('assets/splash/chohoo_img.png'),
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                //   child: Text("it's for yoo hoo",
                //       textAlign: TextAlign.center,
                //       style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300)),
                // ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0, top: 36, right: 30),
                  child: Text("SFT POD DETAILS",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xFFB4B3B4),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      )),
                ),
                SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Box(aspectRatio: 1, text: "Image/Video/GIF/Music"),
                ),
                _buttons(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Box(aspectRatio: 343.0 / 193.0, text: "Image/Video/GIF/Music"),
                ),
                _buttons(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Box(aspectRatio: 343.0 / 610.0, text: "Image/Video/GIF/Music"),
                ),
                _buttons(),
                _extraText2("SFT Name: this line should not be more than 2 lines here\nBy Artist Name", Colors.white, FontWeight.w500),
                _extraText2(
                    "Specification: 4K Resolution\n\nAbout SFT: any details if any lorem Ipsum nulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id. Nulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id.\n\nNulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id.",
                    Colors.white,
                    FontWeight.w300),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Box(aspectRatio: 343.0 / 193.0, text: "Artist Image", shareButton: true),
                ),
                _extraText(
                    "About Artist: Lorem Ipsum nulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id. Nulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id.\n\nNulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id."),
                SizedBox(height: 8),
                _buttons(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        text: "SFT Price: ",
                        style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300),
                        children: [
                          TextSpan(
                            text: "\$2,50",
                            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: "\nYour Money Reward \nOpportunity: ",
                            style: TextStyle(color: Color(0xffEBF411), fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                          TextSpan(
                            text: "\$3500,00\n",
                            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: "(not split/split in 1/2/3)",
                            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                _extraText2("Money-Rewards increasee in value as more people purchase SFTs per pod, this includes the public benefit.",
                    Colors.white, FontWeight.w100,
                    fontSize: 12.0),
                SizedBox(height: 12),
                _extraText2(
                    "City, Location/International\nStarted: Date | Time\nSFT Number:\nQuantity of SFTs Sold in this Pod:\nPublic Benefit: \$120,00 | NGO/Initiative Name\nPod Number:\nSFT Pod Close: Date | Time (closed/open)",
                    Colors.white,
                    FontWeight.w300,
                    fontSize: 14.0),
                SizedBox(height: 12),
                _extraText2(
                    "SFT Pods run for 2 weeks from start date. Twice a month, beginning on the first and second Tuesday of every month, at 14:00 South Africa Time (GMT+2), and closing at 16:00 on each prior Monday respectively.",
                    Colors.white,
                    FontWeight.w100,
                    fontSize: 12.0),
                SizedBox(height: 12),
                _buttons(),
                _extraText2("Public Benefit Name: NGO/Initiative line should not be more than 2 lines here", Colors.white, FontWeight.w500),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Box(aspectRatio: 343.0 / 193.0, text: "Public Benefit Image", shareButton: true),
                ),
                _extraText(
                    """About Public Benefit: Lorem Ipsum nulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id. Nulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id.\n\nNulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id."""),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buttons() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 8, 30, 20),
      child: Row(
        children: [
          Expanded(
            child: DottedLine(
              dashColor: Colors.transparent,
            ),
          ),
          InkWell(
            onTap: () => Get.to(() => PaymentDonePage()),
            child: Chip(
              label: Text(' USE CODE '),
              padding: EdgeInsets.only(left: 10, right: 10),
              backgroundColor: Color(0xFF03F832),
              side: BorderSide(color: Colors.black, width: 1),
            ),
          ),
          Container(
            width: 10,
            child: DottedLine(
              dashColor: Colors.transparent,
              dashGapLength: 2,
            ),
          ),
          InkWell(
            onTap: () => Get.to(() => PaymentMethodPage()),
            child: Chip(
              padding: EdgeInsets.only(left: 10, right: 10),
              label: Text('  BUY SFT  '),
              backgroundColor: Color(0xFFEBF411),
              side: BorderSide(color: Colors.black, width: 1),
            ),
          ),
          Expanded(
            child: DottedLine(
              dashColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _extraText(String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _extraText2(String text, Color color, FontWeight fe, {double fontSize = 14}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontFamily: 'Roboto',
                fontSize: fontSize,
                fontWeight: fe,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
