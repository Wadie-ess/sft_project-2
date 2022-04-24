// ignore_for_file: deprecated_member_use

//import 'package:timezone/data/latest.dart' as tz;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'routes/loadingScreen/loading_screen.dart';
import 'routes/locationPermission/location_permission_page.dart';
import 'routes/login/login_page.dart';
import 'routes/main/choose_hunt_page.dart';
import 'routes/main/main_page.dart';
import 'routes/main/my_home_page.dart';
import 'routes/realWorldHunt/real_hunt_detail_page.dart';
import 'routes/splashScreen/splash_screen.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  //tz.initializeTimeZones();
  await WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        home: Sizer(
          builder: (context, orientation, deviceType) =>  LoadingScreen()),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale("af"),
        Locale("am"),
        Locale("ar"),
        Locale("az"),
        Locale("be"),
        Locale("bg"),
        Locale("bn"),
        Locale("bs"),
        Locale("ca"),
        Locale("cs"),
        Locale("da"),
        Locale("de"),
        Locale("el"),
        Locale("en"),
        Locale("es"),
        Locale("et"),
        Locale("fa"),
        Locale("fi"),
        Locale("fr"),
        Locale("gl"),
        Locale("ha"),
        Locale("he"),
        Locale("hi"),
        Locale("hr"),
        Locale("hu"),
        Locale("hy"),
        Locale("id"),
        Locale("is"),
        Locale("it"),
        Locale("ja"),
        Locale("ka"),
        Locale("kk"),
        Locale("km"),
        Locale("ko"),
        Locale("ku"),
        Locale("ky"),
        Locale("lt"),
        Locale("lv"),
        Locale("mk"),
        Locale("ml"),
        Locale("mn"),
        Locale("ms"),
        Locale("nb"),
        Locale("nl"),
        Locale("nn"),
        Locale("no"),
        Locale("pl"),
        Locale("ps"),
        Locale("pt"),
        Locale("ro"),
        Locale("ru"),
        Locale("sd"),
        Locale("sk"),
        Locale("sl"),
        Locale("so"),
        Locale("sq"),
        Locale("sr"),
        Locale("sv"),
        Locale("ta"),
        Locale("tg"),
        Locale("th"),
        Locale("tk"),
        Locale("tr"),
        Locale("tt"),
        Locale("uk"),
        Locale("ug"),
        Locale("ur"),
        Locale("uz"),
        Locale("vi"),
        Locale("zh")
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'Choohoo',
      routes: <String, WidgetBuilder>{
        // define the routes
        'LOCATION_PEMISSION_PAGE': (BuildContext context) => new LocationPermissionPage(),
        'MAIN_PAGE': (BuildContext context) => new MainPage(),
        'LOGIN_PAGE': (BuildContext context) => new LoginPage(),
        'CHOOSE_HUNT_PAGE': (BuildContext context) => new ChooseHuntPage(),
        'REAL_HUNT_PAGE': (BuildContext context) => new RealHuntDetailPage(),
        'HOME_PAGE': (BuildContext context) => new MyHomePage(),
      },
      home: LoadingScreen(),
      color: Colors.black,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  // MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _count = 0;
  String imageAddress = "assets/images/placeholder/black_adidas.png";

  int keyValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(seconds: 20),
            reverseDuration: const Duration(seconds: 20),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(child: child, scale: animation);
            },
            child: Container(
              key: ValueKey<int>(_count),
              child: Image.asset(
                imageAddress,
              ),
            ),
          ),
          RaisedButton(
            child: const AutoSizeText('Increment'),
            onPressed: () {
              setState(() {
                imageAddress == "assets/images/placeholder/red_adidas.png"
                    ? imageAddress = "assets/images/placeholder/black_adidas.png"
                    : imageAddress = "assets/images/placeholder/red_adidas.png";
              });
            },
          ),
        ],
      ),
    );
  }
}
