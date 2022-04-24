import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../utils/CustomDrawer.dart';

class ReceiptDetailsClueTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReceiptDetailsClueTwoState();
  }
}

class ReceiptDetailsClueTwoState extends State<ReceiptDetailsClueTwo> {
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
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(children: <Widget>[
                SizedBox(height: 20),
                AutoSizeText(
                  Localization.stLocalized("receiptDetails").toUpperCase(),
                  style: CTheme.textRegular16Black(),
                  textAlign: Localization.textAlignLeft(),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      Localization.stLocalized("clueTwoPurchased"),
                      style: CTheme.textRegular16Black(),
                    ),
                    Text(
                      Localization.stLocalized("recieptNumber"),
                      style: CTheme.textRegular12Black(),
                    ),
                  ],
                ),
                Row(children: <Widget>[
                  Text(
                    Localization.stLocalized("dateTimePurchased"),
                    style: CTheme.textLight14Black(),
                  ),
                ]),
                SizedBox(height: 10),
                Row(children: <Widget>[
                  Text(
                    Localization.stLocalized("riddleNumber"),
                    style: CTheme.textLight14Black(),
                  ),
                  Text(
                    Localization.stLocalized("unitDummy"),
                    style: CTheme.textLight14Black(),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        Localization.stLocalized("receiptPersonalDetail"),
                        style: CTheme.textLight14Black(),
                      ),
                    ],
                  ),
                ),
                _unitDetailsTable(),
                _informationContainer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[Expanded(child: Center(child: Text(Localization.stLocalized("receiptMailed"))))],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 20.0),
                  child: Center(
                    child: Image.asset("assets/images/triangle/triangle_clue_two.png"),
                  ),
                )
              ]),
            ),
          ),
        ));
  }

  _unitDetailsTable() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(157, 155, 157, 0.2),
                      border: Border.all(
                        color: Color.fromRGBO(70, 69, 69, 1),
                        style: BorderStyle.solid,
                      )),
                  alignment: Alignment.center,
                  child: Text(
                    'Item',
                    style: TextStyle(
                      color: Color.fromRGBO(70, 69, 69, 1),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(157, 155, 157, 0.2),
                      border: Border.all(
                        color: Color.fromRGBO(70, 69, 69, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    'Quantity',
                    style: TextStyle(
                      color: Color.fromRGBO(70, 69, 69, 1),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(157, 155, 157, 0.2),
                      border: Border.all(
                        color: Color.fromRGBO(70, 69, 69, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    'Price',
                    style: TextStyle(
                      color: Color.fromRGBO(70, 69, 69, 1),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromRGBO(70, 69, 69, 1),
                        style: BorderStyle.solid,
                      )),
                  alignment: Alignment.center,
                  child: Text(
                    'Riddle',
                    style: TextStyle(
                      color: Color.fromRGBO(70, 69, 69, 1),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromRGBO(70, 69, 69, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Color.fromRGBO(70, 69, 69, 1),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromRGBO(70, 69, 69, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    'R50.00',
                    style: TextStyle(
                      color: Color.fromRGBO(70, 69, 69, 1),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            style: BorderStyle.solid,
                          ),
                          bottom: BorderSide(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            style: BorderStyle.solid,
                          ),
                          left: BorderSide(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            style: BorderStyle.solid,
                          ),
                          right: BorderSide.none)),
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Color.fromRGBO(70, 69, 69, 1),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            style: BorderStyle.solid,
                          ),
                          bottom: BorderSide(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            style: BorderStyle.solid,
                          ),
                          right: BorderSide(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            style: BorderStyle.solid,
                          ),
                          left: BorderSide.none)),
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      'VAT',
                      style: TextStyle(
                        color: Color.fromRGBO(70, 69, 69, 1),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromRGBO(70, 69, 69, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    'R?????',
                    style: TextStyle(
                      color: Color.fromRGBO(70, 69, 69, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            style: BorderStyle.solid,
                          ),
                          bottom: BorderSide(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            style: BorderStyle.solid,
                          ),
                          left: BorderSide(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            style: BorderStyle.solid,
                          ),
                          right: BorderSide.none)),
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Color.fromRGBO(70, 69, 69, 1),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            style: BorderStyle.solid,
                          ),
                          bottom: BorderSide(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            style: BorderStyle.solid,
                          ),
                          right: BorderSide(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            style: BorderStyle.solid,
                          ),
                          left: BorderSide.none)),
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      'Total',
                      style: TextStyle(
                        color: Color.fromRGBO(70, 69, 69, 1),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromRGBO(70, 69, 69, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    'R50.00',
                    style: TextStyle(
                      color: Color.fromRGBO(70, 69, 69, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _informationContainer() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(70, 69, 69, 1),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              Localization.stLocalized("dummyTextDetail"),
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w100),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              Localization.stLocalized("dummyTextDetail2"),
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w100),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              Localization.stLocalized("dummyTextDetail3"),
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
