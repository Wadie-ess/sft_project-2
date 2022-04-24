import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:world/constants/CColors.dart';
import 'package:world/routes/onboarding/onboarding_view.dart';
import '../../Shared/DAL/Authentication.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  VideoPlayerController _controller;
  bool isInitVideoController = false;
  bool isClickedFinish = false;

  @override
  void initState() {
    super.initState();
    //Authentication.getAllSecurityQuestion();

    SystemChrome.setPreferredOrientations([
      //  DeviceOrientation.portraitDown,
      //  DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset('assets/videos/ChoohooPortraitSml.mp4')
      ..initialize().then(
        (_) {
          setState(() {
            isInitVideoController = true;
          });
          _controller.play();
          Timer(Duration(milliseconds: 30400), () {
            if (!isClickedFinish) {
              changeScreen();
            }
          });
        },
      );
  }

  @override
  void dispose() {
    isInitVideoController = false;
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(60, 0, 0, 0),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait ? portraitBuilder() : landscapeBuilder();
          },
        ),
      ),
    );
  }

  Widget portraitBuilder() {
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: isInitVideoController ? VideoPlayer(_controller) : SizedBox(),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80,
            child: Center(
              child: GestureDetector(
                onTap: () => changeScreen(),
                child: 
                Chip(
                      label: Text('Skip Intro...', style: TextStyle(color: Colors.white)),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      backgroundColor: CColor.appBlackLight,
                      side: BorderSide(color: Colors.white, width: 1),
                    ),
                
              ),
            ),
            color: Color(0xff464545),
          ),
        ),
      ],
    );
  }

  Widget landscapeBuilder() {
    return Stack(
      children: [
        Align(
            alignment: Alignment.bottomCenter,
            child:
                Container(margin: EdgeInsets.only(top: 40), child: Image.asset("assets/images/splash_bg_new.jpg", fit: BoxFit.fitWidth))),
        Center(
          child: /*Image.asset('assets/splash/splash_icon.png')*/
              AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: isInitVideoController ? VideoPlayer(_controller) : SizedBox(),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: new GestureDetector(
            onTap: () => changeScreen(),
            child: 
            Chip(
                      label: Text('Skip Intro...', style: TextStyle(color: Colors.white)),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      backgroundColor: CColor.appBlackLight,
                      side: BorderSide(color: Colors.white, width: 1),
                    ),
            
          ),
        )
      ],
    );
  }

  void changeScreen() async {
    isClickedFinish = true;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    Get.off(OnBoardingPage(), transition: Transition.rightToLeft);
  }
}
