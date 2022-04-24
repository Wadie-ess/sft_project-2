import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

///Created by zakria khan at 03/07/2021///
///email contact@zakriakhan.com///
///fiver link :  https://www.fiverr.com/users/toptutorial270///

class ChoohooLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: SvgPicture.asset(
          "assets/onboarding/logo-white.svg",
          width: Get.width * 0.35,
        ),
      ),
    );
    
    // Column(
    //   children: [
    //     // Padding(
        //   padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        //   child: Container(
        //     height: 80,
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
        //     style: TextStyle(
        //       fontFamily: 'Roboto',
        //       color: Colors.white,
        //       fontSize: 24,
        //       fontWeight: FontWeight.w300,
        //     ),
        //   ),
        // ),
    //   ],
    // );
  }
}
