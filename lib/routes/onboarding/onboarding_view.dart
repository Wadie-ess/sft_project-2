import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:world/constants/CColors.dart';
import 'package:world/routes/locationPermission/location_permission_page.dart';
import 'package:world/routes/main/my_home_page.dart';
import 'package:world/routes/onboarding/onboarding_mock_data.dart';
import 'package:world/services/location_service.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
//  final introKey = GlobalKey<IntroductionScreenState>();

  Future<void> _onIntroEnd(context) async {
    if (await LocationService().allRequirePermissionGranted()) {
      bool locationGot = await LocationService().setLocation(context);
      if (locationGot) {
        Get.off(MyHomePage(), transition: Transition.rightToLeft);

        // SharedPreferences _prefs = await SharedPreferences.getInstance();
        // String auth = _prefs.getString('token');
        // auth == null || auth == ""
        //     ? /*Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(builder: (context) => MyHomePage()),
        //       )*/
        //     Get.off(MyHomePage(), transition: Transition.rightToLeft)
        //     : /*Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(builder: (context) => MainPage()),
        //       );*/
        //     Get.off(MainPage(), transition: Transition.rightToLeft);
      }
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LocationPermissionPage(),
        ),
      );
    }
  }

  Widget logo() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.095),
        child: SvgPicture.asset(
          "assets/onboarding/logo-onboarding.svg",
          width: Get.width * 0.28,
        ),
      ),
    );
  }

  Widget _buildImage(String assetName, String title, String content, int screenNumber) {
    return Flex(
      direction: Axis.vertical,
      children: [
        SizedBox(height: Get.height * 0.225),
        Flexible(
          flex: 1,
          child: AutoSizeText(
            title,
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Color(0xff464545),
              fontSize: 18.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: Get.height * 0.026),
        Flexible(
          flex: 1,
          child: SvgPicture.asset(
            "assets/onboarding/$assetName.svg",
            width: Get.width * 0.75,
          ),
        ),
        SizedBox(height: Get.height * 0.050),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: AutoSizeText(
              content,
              style: screenNumber==1?TextStyle(
                fontFamily: 'Roboto',
                color: Color(0xff464545),
                fontSize: 17,
                fontWeight: FontWeight.bold
              ):TextStyle(
                fontFamily: 'Roboto',
                color: Color(0xff464545),
                fontSize: 15,
                
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget button({String text, bool isPassive}) {
    return Chip(
      label: AutoSizeText(
        text,
        style: TextStyle(
          fontFamily: 'Roboto',
          color: isPassive ? Color(0xff9D9B9D) : Color(0xff464545),
          fontSize: 15.sp,
        ),
      ),
      padding: EdgeInsets.only(left: Get.width * 0.02, right: Get.width * 0.02),
      backgroundColor: CColor.appWhite,
      side: BorderSide(color: isPassive ? Color(0xff9D9B9D) : Color(0xff464545), width: 1),
    );
    /*Container(
      height: Get.height * 0.045,
      width: Get.width * 0.25,
      decoration: new BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isPassive ? Color(0xff9D9B9D) : Color(0xff464545),
          width: 0.0,
        ),
        borderRadius: new BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Roboto',
            color: isPassive ? Color(0xff9D9B9D) : Color(0xff464545),
            fontSize: 15,
          ),
        ),
      ),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      //  key: introKey,
      
      globalBackgroundColor: Colors.white,
      globalHeader: logo(),
      pages: [
        PageViewModel(
          title: "",
          body: "",
          image: _buildImage(splashData[0].imageName, splashData[0].title, splashData[0].text, 1),
          decoration: PageDecoration(fullScreen: true,),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: _buildImage(splashData[1].imageName, splashData[1].title, splashData[1].text,2),
          decoration: PageDecoration(fullScreen: true),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: _buildImage(splashData[2].imageName, splashData[2].title, splashData[2].text,3 ),
          decoration: PageDecoration(fullScreen: true),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: _buildImage(splashData[3].imageName, splashData[3].title, splashData[3].text, 4),
          decoration: PageDecoration(fullScreen: true),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: _buildImage(splashData[4].imageName, splashData[4].title, splashData[4].text, 5),
          decoration: PageDecoration(fullScreen: true),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      skipOrBackFlex: 2,
      dotsFlex: 3,
      nextFlex: 2,
      showBackButton: false,
      skip: button(text: "Skip", isPassive: true),
      next: button(text: "Next", isPassive: false),
      done: button(text: "Next", isPassive: false),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.white,
        activeColor: Color(0xff9D9B9D),
        activeSize: Size(10.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xff9D9B9D),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}



/*import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../main/my_home_page.dart';
import 'onboarding_mock_data.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int itemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        onTap: () {
          setState(() {
            itemIndex = itemIndex;
            print(itemIndex);
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
          ),
          child: Stack(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: Get.height,
                  viewportFraction: 1,
                  enlargeCenterPage: false,
                  autoPlay: false,
                ),
                itemCount: 5,
                itemBuilder: (context, index, realIndex) {
                  itemIndex = index;
                  return Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: Container(
                      height: Get.height,
                      width: Get.width,
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Text(
                            splashData[index].title,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xff464545),
                              fontSize: 19,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: Get.height * 0.032),
                          SvgPicture.asset(
                            "assets/onboarding/${splashData[index].imageName}.svg",
                            width: Get.width * 0.80,
                          ),
                          SizedBox(height: Get.height * 0.06),
                          Text(
                            splashData[index].text,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xff464545),
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: Get.height * 0.06),
                        ],
                      ),
                    ),
                  );
                },
              ),
              bottomNavbar(itemIndex),
              logo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.065, bottom: Get.height * 0.065),
        child: SvgPicture.asset(
          "assets/onboarding/logo-onboarding.svg",
          width: Get.width * 0.28,
        ),
      ),
    );
  }

  Widget bottomNavbar(int index) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: Get.height * 0.10,
        width: Get.width,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: buttonNavBar(text: "Skip", index: index)),
              Expanded(child: dots(index)),
              Expanded(child: buttonNavBar(text: "Next", index: index)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonNavBar({String text, int index}) {
    return InkWell(
      onTap: () {
        if (index != 0 && index % 4 == 0) {
          Get.off(MyHomePage(), transition: Transition.rightToLeft);
        } else {
          if (text.toLowerCase() == "skip") {
            Get.off(MyHomePage(), transition: Transition.rightToLeft);
          } else {
            setState(() {
              itemIndex++;
            });
          }
        }
      },
      child: Container(
        height: Get.height * 0.055,
        width: Get.width * 0.32,
        decoration: new BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: text.toLowerCase() == "skip" ? Color(0xff9D9B9D) : Color(0xff464545),
            width: 0.0,
          ),
          borderRadius: new BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: text.toLowerCase() == "skip"
                ? TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xff9D9B9D),
                    fontSize: 15,
                  )
                : TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xff464545),
                    fontSize: 15,
                  ),
          ),
        ),
      ),
    );
  }

  Widget dots(int index) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index2) {
            return Padding(
              padding: EdgeInsets.only(
                left: 2.2,
                right: 2.2,
              ),
              child: Container(
                height: Get.height * 0.025,
                width: Get.width * 0.025,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: index2 == index ? Color(0xff9D9B9D) : Colors.white,
                  border: Border.all(
                    color: Color(0xff9D9B9D),
                    width: 1.4,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
*/