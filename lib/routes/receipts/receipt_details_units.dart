import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../utils/CustomDrawer.dart';

class ReceiptDetailsUnits extends StatefulWidget {
  final bool fromPromo;

  const ReceiptDetailsUnits({Key key, this.fromPromo = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ReceiptDetailsUnitsState();
  }
}

class ReceiptDetailsUnitsState extends State<ReceiptDetailsUnits> {
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
                  widget.fromPromo ? "USED PROMO CODES DETAILS" : Localization.stLocalized("receiptDetails").toUpperCase(),
                  style: CTheme.textRegular16Black(),
                  textAlign: Localization.textAlignLeft(),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "SFT Name",
                      style: CTheme.textRegular16Black(),
                    ),
                    Text(
                      widget.fromPromo ? "Promo Code Number" : Localization.stLocalized("recieptNumber"),
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
                SizedBox(height: 20),
                Row(children: <Widget>[
                  Text(
                    "SFT Price:",
                    style: CTheme.textLight14Black(),
                  ),
                  Expanded(
                    child: Text(
                      "",
                      style: CTheme.textLight14Black(),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Text(
                    "Artist Name:",
                    style: CTheme.textLight14Black(),
                  ),
                  Expanded(
                    child: Text(
                      "",
                      style: CTheme.textLight14Black(),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Text(
                    "SFT Number:",
                    style: CTheme.textLight14Black(),
                  ),
                  Expanded(
                    child: Text(
                      "",
                      style: CTheme.textLight14Black(),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Text(
                    "Pod Number:",
                    style: CTheme.textLight14Black(),
                  ),
                  Expanded(
                    child: Text(
                      "",
                      style: CTheme.textLight14Black(),
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
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
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          Localization.stLocalized("receiptMailed"),
                          style: CTheme.textLight14Black(),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 20),
                    child: Container(
                      height: 80,
                      width: 80,
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF9b9d9d)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "SFT Image",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
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
                    'SFT',
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
                    '\$2,12',
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
                    '\$0,38',
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
                        fontWeight: FontWeight.bold,
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
                    '\$2.50',
                    style: TextStyle(
                      color: Color.fromRGBO(70, 69, 69, 1),
                      fontWeight: FontWeight.bold,
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
}
