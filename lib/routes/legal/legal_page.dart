import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:world/utils/widgets/logo.dart';

import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/AppBarSignup.dart';
import '../../utils/CustomDrawer.dart';
import 'custom_bottom_bar_legal.dart';

class LegalPage extends StatefulWidget {
  final bool openFromSignUp;
  final ValueChanged<bool> agreed;

  const LegalPage({Key key, this.openFromSignUp, this.agreed})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return LegalPageState();
  }
}

class LegalPageState extends State<LegalPage> {
  get scaffoldKey => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: Colors.white,
        bottomNavigationBar: CustomBottomBarLegal(
          // agreed: widget.openFromSignUp ?? false ? widget.agreed : (){},
          agreed: (bool) {},
        ),
        appBar: widget.openFromSignUp ?? false ? AppBarSignup() : AppBarBuy(),
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      color: Colors.black,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: Get.height * 0.025,
                              bottom: Get.height * 0.025),
                          child: SvgPicture.asset(
                            "assets/onboarding/logo-onboarding.svg",
                            width: Get.width * 0.35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // child: Column(
                      //   children: <Widget>[
                      //     Padding(
                      //       padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      //       child: Container(
                      //         height: 80,
                      //         width: 180,
                      //         decoration: BoxDecoration(
                      //           image: DecorationImage(
                      //             image: AssetImage('assets/splash/chohoo_img.png'),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                      //       child: Text("it's for yoo hoo",
                      //           style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300)),
                      //     ),
                      //   ],
                      // )
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 10),
                      child: AutoSizeText(
                        Localization.stLocalized("legal").toUpperCase(),
                        style: CTheme.textLight18Black(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //SizedBox(height: 20),
                    // _photoOrVideoContainer(),
                    Container(
                      margin: EdgeInsets.only(
                          left: 16, right: 16, top: 20, bottom: 20),
                      child: Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            Expanded(
                                child: Text(
                              Localization.stLocalized("legalMessage"),
                              style: CTheme.textLight11Black(),
                            )),
                          ])
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }

  _photoOrVideoContainer() {
    return Container(
      height: 160,
      padding: EdgeInsets.only(top: 30, bottom: 30),
      margin: EdgeInsets.only(left: 16, right: 16, top: 15),
      child: Center(
        child: Text(
          Localization.stLocalized("photoVideo"),
          style: CTheme.textRegular16LightGrey(),
        ),
      ),
      decoration: BoxDecoration(
        color: CColor.appWhite,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border(
            bottom: BorderSide(color: CColor.appGreyLight),
            top: BorderSide(color: CColor.appGreyLight),
            right: BorderSide(color: CColor.appGreyLight),
            left: BorderSide(color: CColor.appGreyLight)),
      ),
    );
  }
}
