import 'package:flutter/material.dart';
import '../profile/view_user_profile_page.dart';
import '../../utils/AppBarMain.dart';
import '../../utils/CustomBottomBar.dart';
import '../../utils/CustomDrawer.dart';

class FoundItPhotoSentPage extends StatefulWidget {
  @override
  _FoundItPhotoSentPage createState() => _FoundItPhotoSentPage();
}

class _FoundItPhotoSentPage extends State<FoundItPhotoSentPage> {
  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(),
      backgroundColor: Colors.black,
      drawer: CustomDrawer(context: context),
      appBar: AppBarMain(scaffoldKey: scaffoldKey),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/splash/chohoo_img.png'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text("      if yoo find it,\n   it's for yoo hoo   ",
                      style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 16, fontWeight: FontWeight.w100)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 5),
                  child: CircularProgressIndicator(
                    backgroundColor: Color.fromRGBO(112, 112, 112, 1),
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(235, 244, 17, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text("Processing", style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(235, 244, 17, 1), fontSize: 16)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text("Photo has been sent to the Game Masters!",
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Color.fromRGBO(235, 244, 17, 1), fontSize: 14, fontWeight: FontWeight.w100)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text("It might also appear on Social Media within 24hrs.",
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 14, fontWeight: FontWeight.w100)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            "Sorry, your Photo has not been sent. Please try "
                            "again. If sending the photo consistently "
                            "fails, please contact the Game Masters by "
                            "clicking here",
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 14, fontWeight: FontWeight.w100)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
