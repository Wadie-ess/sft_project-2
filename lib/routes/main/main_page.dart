import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../foundit/found_it_page.dart';
import '../howToPlay/how_to_play.dart';
import '../../utils/AppBarMain.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/HandleNavigation.dart';
import '../../Shared/DAL/PlayerData.dart';
import 'choose_hunt_page.dart';

class MainPage extends StatefulWidget with WidgetsBindingObserver {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    getPlayerData();
  }

  Future<void> getPlayerData() async {
    await PlayerData.getUserData();
    if (mounted) {
      setState(() {});
    }
  }

  void _onRefresh() async {
    // monitor network fetch
    await getPlayerData();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    dosomething();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarMain(
        main: true,
      ),
      drawer: CustomDrawer(context: context),
      body: SmartRefresher(
        enablePullDown: true,
        header: WaterDropHeader(
          waterDropColor: Colors.amber,
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Container(
                      height: 80,
                      width: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/splash/chohoo_img.png'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text("if yoo find it,\nit's for yoo hoo",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300)),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text(
                        "Crack the Riddle\n"
                        "Hunt in the Real World\n"
                        "or the Digital World,\n"
                        " with your friends\n"
                        "or by yourself",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 18, fontWeight: FontWeight.w100)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: Text(
                      "It’s a mystery game,\nA global scavenger hunt to find the Choohoo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 18, fontWeight: FontWeight.w100),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      "Think yoo can find it?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontWeight: FontWeight.w300, fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Text(
                      "Great prizes… climb the leaderboard",
                      style: TextStyle(
                          fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 18, fontWeight: FontWeight.w100),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0), side: BorderSide(color: Colors.white)),
                              color: Color.fromRGBO(70, 69, 69, 1),
                              textColor: Colors.white,
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              onPressed: () {
                                Get.to(() => ChooseHuntPage(), transition: Transition.rightToLeft);
                                /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChooseHuntPage()),
                                );*/
                              },
                              child: Align(
                                child: Text(
                                  "CHOOSE HUNT OPTIONS & CRACK RIDDLE",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0), side: BorderSide(color: Colors.white)),
                              color: Color.fromRGBO(70, 69, 69, 1),
                              textColor: Colors.white,
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => FoundItPage()),
                                );
                              },
                              child: Text(
                                "FOUND IT? SEND SECRET NUMBER",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0), side: BorderSide(color: Colors.white)),
                              color: Color.fromRGBO(70, 69, 69, 1),
                              textColor: Colors.white,
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => HowToPlayPage()));
                              },
                              child: Text(
                                "HOW TO PLAY",
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 70, 15, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: 164,
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                              color: Colors.white,
                            ),
                            height: 40,
                            width: 345,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                              child: Text(
                                "Heading",
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ),
                          Container(
                            height: 121,
                            width: 345,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(19), bottomRight: Radius.circular(19)),
                              color: Colors.grey,
                            ),
                            child: Center(
                              child: Text('Photo/Image/Video'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing'
                            ' elit. Integer purus sapien, dapibus sed feugiat'
                            ' in, accumsan sed sapien. Maecenas semper risus'
                            ' ac aliquet egestas. Donec lacinia augue at '
                            'interdum vehicula. Aliquam ac purus at ex'
                            ' iaculis sagittis. Cras ut augue laoreet, '
                            'euismod nulla ut, rhoncus sem\n\nNulla luctus'
                            ' vel magna quis lobortis. Vivamus pulvinar '
                            'risus mauris, non semper velit faucibus id.',
                            style: TextStyle(
                                color: Color.fromRGBO(180, 179, 180, 1), fontFamily: 'Roboto', fontSize: 16, fontWeight: FontWeight.w100),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: 164,
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                              color: Colors.white,
                            ),
                            height: 40,
                            width: 345,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                              child: Text(
                                "Heading",
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ),
                          Container(
                            height: 121,
                            width: 345,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(19), bottomRight: Radius.circular(19)),
                              color: Colors.grey,
                            ),
                            child: Center(
                              child: Text('Photo/Image/Video'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing'
                            ' elit. Integer purus sapien, dapibus sed feugiat'
                            ' in, accumsan sed sapien. Maecenas semper risus'
                            ' ac aliquet egestas. Donec lacinia augue at '
                            'interdum vehicula. Aliquam ac purus at ex'
                            ' iaculis sagittis. Cras ut augue laoreet, '
                            'euismod nulla ut, rhoncus sem\n\nNulla luctus'
                            ' vel magna quis lobortis. Vivamus pulvinar '
                            'risus mauris, non semper velit faucibus id.',
                            style: TextStyle(
                                color: Color.fromRGBO(180, 179, 180, 1), fontFamily: 'Roboto', fontSize: 16, fontWeight: FontWeight.w100),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

//      child: Center(
//        child: Row(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//
//         Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//
//            Row(
//              children: <Widget>[
//                Container(
//
//                  height: 155,
//                  width: 180,
//                  padding:EdgeInsets.fromLTRB(0, 30, 0, 0),
//                  decoration: BoxDecoration(
//                    image: DecorationImage(
//                      image: AssetImage('assets/splash/splash_icon.png'),
//
//                    )
//                ),
//                ),
//              ],
//            ),
//
//          ],
//
//        ),
//        ],
//        ),
//      ),
//        color: Colors.black,
          ),
        ),
      ),
    );
  }

  void dosomething() {
    debugPrint('dosomething Called');
    HandleNavigation.appExitCheck = true;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      HandleNavigation.appExitCheck = true;
    }
  }
}
