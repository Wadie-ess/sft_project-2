import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:world/constants/CTheme.dart';

import 'package:world/utils/widgets/logo.dart';
import '../../constants/CColors.dart';
import '../splashScreen/splash_screen.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SplashScreen()),
            ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:
             Container(
                height: double.infinity,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      
                      backgroundColor: CColor.appYellow,
                      strokeWidth: 5,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(CColor.appGreyDark),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text("Loading",
                            style: TextStyle(
                                color: CColor.appYellow, fontSize: 16.0))),
                  ],
                )),
              ),
            
          
        );
  }
}
