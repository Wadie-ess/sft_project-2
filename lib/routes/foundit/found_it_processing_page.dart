import 'package:flutter/material.dart';
import '../profile/view_user_profile_page.dart';
import '../../utils/AppBarMain.dart';
import '../../utils/CustomDrawer.dart';
import 'found_it_sub_img_page.dart';

class FoundItProcessingPage extends StatefulWidget {
  @override
  _FoundItProcessingPage createState() => _FoundItProcessingPage();
}

class _FoundItProcessingPage extends State<FoundItProcessingPage> {
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
      bottomNavigationBar: Container(
        color: Color.fromRGBO(45, 45, 45, 1),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: IconButton(
                icon: Image.asset('assets/images/2.0x/submitbtnicon.png'),
                iconSize: 180,
                color: Colors.white,
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoundItSubImagePage()),
                  )
                },
              ),
            ),
          ],
        ),
      ),
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
                        child: Text("Validated!",
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Color.fromRGBO(235, 244, 17, 1), fontSize: 14, fontWeight: FontWeight.w100)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            "Congratulations, you are the"
                            " Winner/ came in 10th place/you found the world"
                            " but unfortunately 1st -10th places have already"
                            " been awarded and the Hunt is now closed. ",
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 14, fontWeight: FontWeight.w100)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            "See Notifications for where and how to"
                            " claim your prize. You have also been awarded "
                            "“enter points”",
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 14, fontWeight: FontWeight.w100)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            "You are now required to submit a photo of"
                            " you and/or your friends with the Choohoo somewhere"
                            " in the picture eg. Someone could hold the Choohoo"
                            " etc.",
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
