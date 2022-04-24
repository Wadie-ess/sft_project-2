import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Shared/DAL/GetCurrentGameUnitPriceData.dart';
import '../../Shared/DAL/MyGameUnitsHistoryData.dart';
import '../../Shared/DAL/MyGameUnitsQuantityData.dart';
import '../../Shared/Model/user_model.dart';
import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import '../buyGameUnits/buy_game_units_history_screen.dart';
import 'buy_game_unit_payment_page.dart';
import 'load_unit_screen.dart';

class BuyGameUnitsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BuyGameUnitsState();
  }
}

class BuyGameUnitsState extends State<BuyGameUnitsPage> {
  int counter = 0;
  TextEditingController _textLoadGame = new TextEditingController(text: "");

  Future<void> getMyGameUnitsQuantity() async {
    await MyGameUnitsQuantityData.myGameUnitsQuantity();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> getMyGameUnitsHistory() async {
    await MyGameUnitsHistoryData.myGameUnitsHistory();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> getCurrentGameUnitPrice() async {
    await GetCurrentGameUnitPriceData.getCurrentGameUnitPriceData();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    // getMyGameUnitsQuantity();
    // getMyGameUnitsHistory();
    // getCurrentGameUnitPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBarBuy(),
      body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              child: Container(
                child: Column(children: <Widget>[
                  SizedBox(height: 20),
                  AutoSizeText(
                    Localization.stLocalized(
                      "buyLoadGameUnits",
                    ).toUpperCase(),
                    style: CTheme.textRegular16Black(),
                    textAlign: Localization.textAlignLeft(),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, top: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              Localization.stLocalized("purcahasedDate"),
                              style: CTheme.textRegular12Black(),
                            ),
                            Text(
                                "${UserModel().myGameUnitsQuantity != null ? UserModel().myGameUnitsQuantity.data[0].gameUnitsBatchQuantity ?? '0' : ''}"),
                          ],
                        ),
                        // Row(
                        //   children: <Widget>[
                        //     Text(
                        //       Localization.stLocalized("usedData"),
                        //       style: CTheme.textRegular12Black(),
                        //     ),
                        //     Text(" 200"),
                        //   ],
                        // ),
                        // Row(
                        //   children: <Widget>[
                        //     Text(
                        //       Localization.stLocalized("Expired"),
                        //       style: CTheme.textRegular12Black(),
                        //     ),
                        //     Text(" 150"),
                        //   ],
                        // ),
                        // Row(
                        //   children: <Widget>[
                        //     Text(
                        //       Localization.stLocalized("Available"),
                        //       style: CTheme.textRegular12Black(),
                        //     ),
                        //     Text(" 50"),
                        //   ],
                        // ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
                          child: Container(
                            width: 200,
                            height: 50,
                            child: FlatButton(
                              child: Text(
                                "See your History",
                                style: CTheme.textRegular16White(),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return BuyGameUnitsHistoryScreen();
                                }));
                              },
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(70, 69, 69, 1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.white)),
                            padding: EdgeInsets.all(15),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, top: 20),
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Expanded(
                              child: Text(
                            Localization.stLocalized("valid12Months"),
                            style: CTheme.textLight16Black(),
                          )),
                        ])
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: _loadGameUnit(),
                    onTap: () {
                      if (_textLoadGame.text != "") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoadUnitMessagePage()),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Stack(
                    children: <Widget>[
                      Divider(
                        thickness: 1.0,
                        color: CColor.appGreyDark,
                      ),
                      Positioned.fill(
                          child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                  color: CColor.appWhite,
                                  child: Text(
                                    "  Or  ",
                                    style: CTheme.textLight16Black(),
                                  ))))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                    child: Text(
                      Localization.stLocalized("buyNow").toUpperCase(),
                      style: CTheme.textRegular16Black(),
                    ),
                  ),
                  _clueContainer(),
                  SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: <Widget>[
                        Text(Localization.stLocalized("quantity"), style: CTheme.textBold12LightGrey()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (counter > 0) counter--;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 16, bottom: 16, left: 30, right: 30),
                                child: Text("$counter"),
                                decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.all(Radius.circular(20))),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      counter++;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(70, 69, 69, 1),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white)),
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        iconSize: 22,
                        color: Colors.white,
                        onPressed: () => {
                          if (counter != 0)
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BuyGameUnitPaymentPage(quantity: counter)),
                              )
                            }
                          else
                            {
                              Fluttertoast.showToast(
                                  msg: "Quantity should be greater than 0 in order to proceed", toastLength: Toast.LENGTH_LONG)
                            }
                        },
                      ),
                    ),
                  ),
                ]),
              ))),
    );
  }

  Widget _loadGameUnit() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 5),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8, right: 12),
              child: TextFormField(
                controller: _textLoadGame,
                style: CTheme.textRegular14White(),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: Localization.stLocalized("loadGameUnit").toUpperCase(),
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Image.asset("assets/images/forward_white/forward_white.png"),
            )
          ],
        ),
        decoration:
            BoxDecoration(color: CColor.appGreyDark, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  Widget _clueContainer() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(70, 69, 69, 1),
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: Image.asset(
                'assets/images/triangle/triangle_units.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            /*Container(
              //padding: EdgeInsets.only(left: 20, right: 20),
              width: 150,
              height: 150,
              child: IconButton(
                icon: Image.asset(
                  'assets/images/triangle/triangle_units.png',
                  fit: BoxFit.cover,
                ),
                color: Colors.black,
                onPressed: () => {},
              ),
            ),*/
            Flexible(
              child: Container(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "R${UserModel().getCuurentGameUnitPrice != null ? UserModel().getCuurentGameUnitPrice.data.guSetPrice : ''} 50 Units Per Batch",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
