import 'package:flutter/material.dart';
import '../profile/view_user_profile_page.dart';

import '../../utils/AppBarMain.dart';
import '../../utils/CustomBottomBar.dart';
import '../../utils/CustomDrawer.dart';

class GetRiddleCluePage extends StatefulWidget {
  @override
  _GetRiddleCluePage createState() => _GetRiddleCluePage();
}

class _GetRiddleCluePage extends State<GetRiddleCluePage> {
  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;
  String imageAddress = "assets/images/placeholder/black_adidas.png";

  int keyValue = 0;

  @override
  void initState() {
    super.initState();
    swapLogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(),
      backgroundColor: Colors.white,
      drawer: CustomDrawer(context: context),
      appBar: AppBarMain(scaffoldKey: scaffoldKey),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.black,
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
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/placeholder/red_head.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                height: 80.0,
                                width: 80.0,
                              ),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder: (Widget child, Animation<double> animation) {
                                return ScaleTransition(child: child, scale: animation);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  height: 80.0,
                                  width: 80.0,
                                  key: ValueKey<int>(keyValue),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                      image: AssetImage(imageAddress),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Container(
                                  child: Text(
                                    'Hunt name goes here plea\nDW1.  |  SH/NSH',
                                    style: TextStyle(color: Color.fromRGBO(180, 179, 180, 1), fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Stack(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/keyicon.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Text(
                                'CLUE 2',
                                style: TextStyle(fontSize: 17, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing'
                          ' elit. Ut ornare pulvinar odio at fermentum.'
                          ' Donec id lectus in tellus venenatis pharetra '
                          'nec ut magna. Aliquam fermentum sem accumsan,'
                          ' interdum urna vel, facilisis arcu. Phasellus '
                          'efficitur dictum nisi, vel bibendum purus'
                          ' placerat et. Pellentesque porttitor dolor'
                          ' quis purus tristique, vel pretium ex accumsan.'
                          ' Nulla et ultrices lacus. Integer scelerisque'
                          ' est in nulla cursus scelerisque. Nunc bibendum'
                          ' nulla varius erat mattis, nec ultrices nisi '
                          'mollis. Nulla feugiat nulla vel semper lobortis.',
                          style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Roboto', fontWeight: FontWeight.w100),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 160,
                    width: 340,
                    decoration: BoxDecoration(color: Color.fromRGBO(70, 69, 69, 1), borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          'PHOTO OR VIDEO OR AUDIO GOES HERE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          'CLUE 1',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing'
                          ' elit. Ut ornare pulvinar odio at fermentum.'
                          ' Donec id lectus in tellus venenatis pharetra '
                          'nec ut magna. Aliquam fermentum sem accumsan,'
                          ' interdum urna vel, facilisis arcu. Phasellus '
                          'efficitur dictum nisi, vel bibendum purus'
                          ' placerat et. Pellentesque porttitor dolor'
                          ' quis purus tristique, vel pretium ex accumsan.'
                          ' Nulla et ultrices lacus. Integer scelerisque'
                          ' est in nulla cursus scelerisque. Nunc bibendum'
                          ' nulla varius erat mattis, nec ultrices nisi '
                          'mollis. Nulla feugiat nulla vel semper lobortis.',
                          style: TextStyle(fontSize: 18, fontFamily: 'Roboto', fontWeight: FontWeight.w100),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 160,
                    width: 340,
                    decoration: BoxDecoration(color: Color.fromRGBO(70, 69, 69, 1), borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        'PHOTO OR VIDEO OR AUDIO GOES HERE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          'RIDDLE',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing'
                          ' elit. Ut ornare pulvinar odio at fermentum.'
                          ' Donec id lectus in tellus venenatis pharetra '
                          'nec ut magna. Aliquam fermentum sem accumsan,'
                          ' interdum urna vel, facilisis arcu. Phasellus '
                          'efficitur dictum nisi, vel bibendum purus'
                          ' placerat et. Pellentesque porttitor dolor'
                          ' quis purus tristique, vel pretium ex accumsan.'
                          ' Nulla et ultrices lacus. Integer scelerisque'
                          ' est in nulla cursus scelerisque. Nunc bibendum'
                          ' nulla varius erat mattis, nec ultrices nisi '
                          'mollis. Nulla feugiat nulla vel semper lobortis.',
                          style: TextStyle(fontSize: 18, fontFamily: 'Roboto', fontWeight: FontWeight.w100),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 30),
                  child: Container(
                    alignment: Alignment.center,
                    height: 160,
                    width: 340,
                    decoration: BoxDecoration(color: Color.fromRGBO(70, 69, 69, 1), borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        'PHOTO OR VIDEO OR AUDIO GOES HERE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  swapLogs() {
    int time = 1;
    new Future.delayed(Duration(seconds: time), () {
      setState(() {
        keyValue = 1;
        imageAddress == "assets/images/placeholder/red_adidas.png"
            ? imageAddress = "assets/images/placeholder/black_adidas.png"
            : imageAddress = "assets/images/placeholder/red_adidas.png";
      });
      swapLogs();
    });
  }
}
