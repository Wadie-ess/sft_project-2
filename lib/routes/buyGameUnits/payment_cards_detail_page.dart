import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Shared/DAL/BuyGameUnitsData.dart';
import '../../Shared/Model/buy_game_units_model.dart';
import '../../Shared/Model/user_model.dart';
import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import 'payment_message_screen.dart';
import '../../utils/AppBarBuy.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utils/CustomDrawer.dart';

class PaymentCardDetailPage extends StatefulWidget {
  final int quantity;

  const PaymentCardDetailPage({Key key, this.quantity}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return PaymentCardDetailState();
  }
}

class PaymentCardDetailState extends State<PaymentCardDetailPage> {
  Future<bool> buyGameUnits() async {
    bool _res;
    await BuyGameUnitsData.buyGameUnitsData();
    if (mounted) {
      setState(() {
        _res = true;
      });
    } else {
      setState(() {
        _res = false;
      });
    }
    return _res;
  }

  DateTime currentDate = new DateTime.now();
  final dateFormatDate = new DateFormat.yMMMMd('en_US');
  final dateFormatTime = new DateFormat.Hm();
  final dateFormatWeekDay = new DateFormat('EEEE');

  bool remeberCard = false;

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
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20,
                      ),
                      child: AutoSizeText(
                        Localization.stLocalized(
                          "gameUnitDebitCreditCard",
                        ).toUpperCase(),
                        style: CTheme.textRegular16DarkGrey(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      "assets/images/cards_logo/MasterCard.png",
                                      height: 40,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: Image.asset(
                                    "assets/images/cards_logo/mcard.png",
                                    height: 40,
                                  )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: Image.asset(
                                    "assets/images/cards_logo/visa.png",
                                    height: 45,
                                  ))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 50,
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    focusColor: CColor.appBlackLight,
                                    tristate: false,
                                    value: remeberCard,
                                    onChanged: (a) {
                                      setState(() {
                                        remeberCard = a;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        "Remember card for future use",
                                        style: CTheme.textRegular12LightGrey(),
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
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/images/locks/white_lock.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Pay Now .00)",
                                style: CTheme.textRegular16White(),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: CColor.appBlackLight, borderRadius: BorderRadius.all(Radius.circular(12)), border: Border.all()),
                      ),
                      onTap: () async {
                        bool _res = await buyGameUnits();

                        String url = UserModel().buyGameUnits.paymentUrl +
                            "&amount=${(UserModel().getCuurentGameUnitPrice.data.guSetPrice)}&quantity=${widget.quantity}";
                        print(url);
                        _res == true
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentMessagePage(
                                          url: url,
                                        )))
                            : Fluttertoast.showToast(msg: "Please Login again to Proceed", toastLength: Toast.LENGTH_LONG);
                      },
                    )
                  ]),
                ))));
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
                          style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 15),
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
}
