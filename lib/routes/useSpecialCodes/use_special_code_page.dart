import 'package:flutter/material.dart';
import '../../utils/CustomDrawer.dart';

class UseSpecialCodePage extends StatefulWidget {
  @override
  _UseSpecialCodePage createState() => _UseSpecialCodePage();
}

class _UseSpecialCodePage extends State<UseSpecialCodePage> {
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
      drawer: CustomDrawer(),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                  child: Container(
                    height: 50,
                    child: Stack(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 20, 0),
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
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text("GET RIDDLE/CLUE 1/CLUE 2 ",
                      style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Container(
                            height: 50,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => {
//                                    Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) => PrivateHuntDetailPage()
//                                      ),
//                                    )
                                  },
                                ),
                                contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                                hintText: 'USE SPECIAL CODE',
                                hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                                filled: true,
                                fillColor: Color.fromRGBO(70, 69, 69, 1),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.all(const Radius.circular(20))),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Container(
                            height: 50,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => {
//                                    Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) => PrivateHuntDetailPage()
//                                      ),
//                                    )
                                  },
                                ),
                                contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                                hintText: 'USE SUPER SPECIAL CODE',
                                hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                                filled: true,
                                fillColor: Color.fromRGBO(70, 69, 69, 1),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.all(const Radius.circular(20))),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text("Verifying...",
                            style: TextStyle(
                                fontFamily: 'Roboto', color: Color.fromRGBO(235, 244, 17, 1), fontSize: 14, fontWeight: FontWeight.w100)),
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
                            "Sorry, your Special Code/Super Special "
                            "Code has not been verified, perhaps you have entered your "
                            "Special Code/Super Special code incorrectly. Please try "
                            "again, if this persists please contact the Game Masters"
                            " by clicking here",
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
