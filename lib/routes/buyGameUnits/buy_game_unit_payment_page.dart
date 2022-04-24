import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import 'payment_cards_detail_page.dart';

class BuyGameUnitPaymentPage extends StatefulWidget {
  final int quantity;

  const BuyGameUnitPaymentPage({Key key, this.quantity}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return BuyGameUnitPaymentState();
  }
}

class BuyGameUnitPaymentState extends State<BuyGameUnitPaymentPage> {
  DateTime currentDate = new DateTime.now();
  final dateFormatDate = new DateFormat.yMMMMd('en_US');
  final dateFormatTime = new DateFormat.Hm();
  final dateFormatWeekDay = new DateFormat('EEEE');

  String imageValue = 'assets/images/mastercardimg.png';
  String _value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: Colors.white,
        bottomNavigationBar: _paymentSecuredBotomBar(),
        appBar: AppBarBuy(),
        body: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                child: Container(
                  child: Column(children: <Widget>[
                    SizedBox(height: 20),
                    AutoSizeText(
                      Localization.stLocalized(
                        "buyGameUnitsReview",
                      ).toUpperCase(),
                      style: CTheme.textRegular16DarkGrey(),
                      textAlign: Localization.textAlignLeft(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          Localization.stLocalized("contactCustomerSupport"),
                          textAlign: TextAlign.center,
                          style: CTheme.textBold12LightGrey(),
                        ),
                      ),
                    ),
                    _clueContainer(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                                    'Game Units',
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
                                    '${widget.quantity}',
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
                                    'R',
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
                                    'N/A',
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
                                    'R',
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PaymentCardDetailPage(quantity: widget.quantity)),
                            )
                          },
                        ),
                      ),
                    ),
                  ]),
                ))));
  }

  Widget _clueContainer() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(70, 69, 69, 1),
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: Text(
                    '${dateFormatDate.format(currentDate)} ${dateFormatWeekDay.format(currentDate)} ${dateFormatTime.format(currentDate)}',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                      color: Color.fromRGBO(180, 179, 180, 1),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: IconButton(
                            icon: Image.asset('assets/images/triangle/triangle_units.png'),
                            color: Colors.black,
                            onPressed: () => {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Container(
                        child: Text(
                          "R | 50 Units Per Batch",
                          style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: <Widget>[
            //     Expanded(
            //       child: Padding(
            //         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            //         child: Text(
            //           'Game Units Number: ${UserModel().getCuurentGameUnitPrice.data.gameUnitNumber}',
            //           style: TextStyle(
            //               fontSize: 12,
            //               color: CColor.appBlackLight,
            //               fontWeight: FontWeight.w200),
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: Padding(
            //         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            //         child: Text(
            //           'GUA(Generated6digitNumber)',
            //           style: TextStyle(
            //               fontSize: 12,
            //               color: CColor.appBlackLight,
            //               fontWeight: FontWeight.w200),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Container _paymentSecuredBotomBar() {
    return Container(
      padding: EdgeInsets.only(right: 20),
      color: Color.fromRGBO(180, 179, 180, 1),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: IconButton(
              icon: Icon(Icons.lock),
              iconSize: 20,
              color: Color.fromRGBO(106, 105, 106, 1),
              onPressed: () => {},
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                'Your payment information is secure.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromRGBO(106, 105, 106, 1)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updatevalue(String value) {
    setState(() {
      _value = value;
      if (_value == "1") {
        imageValue = 'assets/images/visaimg.png';
        _value = null;
      } else if (_value == "2") {
        imageValue = 'assets/images/paypalimg.png';
        _value = null;
      } else if (_value == "3") {
        imageValue = 'assets/images/instanteftimg.png';
        _value = null;
      } else if (_value == "4") {
        imageValue = 'assets/images/bitcoinimg.png';
        _value = null;
      } else if (_value == "5") {
        imageValue = 'assets/images/mobicred.png';
        _value = null;
      } else if (_value == "6") {
        imageValue = 'assets/images/masterpassimg.png';
        _value = null;
      } else if (_value == "7") {
        imageValue = 'assets/images/scode.png';
        _value = null;
      }
    });
  }
}
