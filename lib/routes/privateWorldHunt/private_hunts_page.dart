import 'package:flutter/material.dart';
import '../../constants/CColors.dart';
import 'private_hunt_detail_page.dart';
import '../../utils/AppBarMain.dart';
import '../../utils/CustomBottomBar.dart';
import '../../utils/CustomDrawer.dart';

class PrivateHuntsPage extends StatefulWidget {
  @override
  _PrivateHuntsPage createState() => _PrivateHuntsPage();
}

class _PrivateHuntsPage extends State<PrivateHuntsPage> {
  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _focusNode = FocusNode();
  String firstTextValue = "";
  String firstText = 'ENTER YOUR REFERENCE NUMBER';

  @override
  void initState() {
    _focusNode.addListener(() {
      print("Has focus: ${_focusNode.hasFocus}");
      if (!_focusNode.hasFocus) {
        if (firstTextValue.isEmpty) {
          setState(() {
            firstText = 'ENTER YOUR REFERENCE NUMBER';
          });
        }
        if (firstTextValue.isNotEmpty) {
          setState(() {
            firstText = '';
          });
        }
      } else {
        if (firstTextValue == '') {
          setState(() {
            firstText = 'ENTER YOUR REFERENCE NUMBER';
          });
        }
        if (firstTextValue != '') {
          setState(() {
            firstText = '';
          });
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(),
      backgroundColor: Colors.black,
      appBar: AppBarMain(),
      drawer: CustomDrawer(context: context),
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
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child:
                      Text("PRIVATE HUNTS", style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(70, 69, 69, 1),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        )),
                                    child: Stack(
                                      overflow: Overflow.clip,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            TextFormField(
                                              onChanged: (value) => {
                                                setState(() {
                                                  firstTextValue = value;
                                                  if (firstTextValue == '') {
                                                    firstText = 'ENTER YOUR REFERENCE NUMBER';
                                                  } else {
                                                    firstText = '';
                                                  }
                                                })
                                              },
                                              focusNode: _focusNode,
                                              style: TextStyle(color: Colors.white),
                                              cursorColor: Colors.white,
                                              decoration: InputDecoration(
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    Icons.arrow_forward,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () => {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => PrivateHuntDetailPage()),
                                                    )
                                                  },
                                                ),
                                                contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
                                                filled: true,
                                                fillColor: Color.fromRGBO(70, 69, 69, 1),
                                                focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide.none, borderRadius: BorderRadius.all(const Radius.circular(20))),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(18, 15, 40, 10),
                                          child: GestureDetector(
                                            onTap: () => {
                                              setState(() {
                                                _focusNode.requestFocus();
                                              })
                                            },
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    firstText,
                                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 15, 35, 0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text("Verifying...",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: CColor.appYellow,
                          fontSize: 14,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 20, 35, 0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                              "Verified!\nIf you are not taken to the Hunt"
                              " shortly,\nplease click here",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Color.fromRGBO(180, 179, 180, 1),
                                fontSize: 14,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 20, 35, 30),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                              "Sorry, your reference number is not verified, "
                              "perhaps you have entered it incorrectly. "
                              "Please try again, if this persists please "
                              "contact the Private Hunt Manager by "
                              "clicking here",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Color.fromRGBO(180, 179, 180, 1),
                                fontSize: 14,
                              )),
                        ),
                      ],
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
}
