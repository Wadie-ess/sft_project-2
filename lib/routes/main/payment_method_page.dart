import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Shared/DAL/BuyGameUnitsData.dart';
import '../../Shared/Model/buy_game_units_model.dart';
import '../../Shared/Model/user_model.dart';
import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../buyGameUnits/payment_message_screen.dart';
import 'card_details_page.dart';
import '../signup/signup_name_page.dart';
import '../../utils/AppBarBuy.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utils/CustomDrawer.dart';

class PaymentMethodPage extends StatefulWidget {
  final int quantity;

  const PaymentMethodPage({Key key, this.quantity}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return PaymentCardDetailState();
  }
}

class PaymentCardDetailState extends State<PaymentMethodPage> {
  int counter = 0;
  String payment = "";
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
                        "BUY SFT",
                        style: CTheme.textRegular16DarkGrey(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    _clueContainer(),
                    _receipt(),
                    SizedBox(height: 20),
                    _quantity(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20,
                        top: 20,
                      ),
                      child: AutoSizeText(
                        "PAYMENT METHODS",
                        style: CTheme.textRegular16DarkGrey(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 12),
                    _methods(),
                    SizedBox(height: 20),
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
                          onPressed: () async {
                            Get.to(() => CardDetailPage());
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                  ]),
                ))));
  }

  _methods() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _singlePayment("assets/images/mastercardimg.png", "**** **** **** 1234"),
          Container(
            height: 40,
            width: double.maxFinite,
            color: CColor.appBlackLight,
            padding: EdgeInsets.fromLTRB(13, 12, 12, 12),
            child: Text(
              "Other Payment Options",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          _singlePayment("assets/images/visaimg.png", "Credit or Debit Card"),
          Container(height: 1, width: double.maxFinite, color: Colors.grey),
          _singlePayment("assets/images/paypalimg.png", "PayPal"),
          Container(height: 1, width: double.maxFinite, color: Colors.grey),
          _singlePayment("assets/images/instanteftimg.png", "InstaEFT"),
          Container(height: 1, width: double.maxFinite, color: Colors.grey),
          _singlePayment("assets/images/bitcoinimg.png", "BitCoin"),
          Container(height: 1, width: double.maxFinite, color: Colors.grey),
          _singlePayment("assets/images/mobicred.png", "Mobicred"),
          Container(height: 1, width: double.maxFinite, color: Colors.grey),
          _singlePayment("assets/images/masterpassimg.png", "MasterPass"),
          Container(height: 1, width: double.maxFinite, color: Colors.grey),
          _singlePayment("assets/images/scode.png", "Scode"),
        ],
      ),
    );
  }

  _singlePayment(String image, String paymentName) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(image, height: 65),
          ),
          // subtitle: Text(paymentName),
          leading: Radio(
            value: paymentName,
            groupValue: payment,
            onChanged: (value) {
              setState(() {
                payment = value;
              });
            },
            activeColor: Colors.grey[800],
          ),
        ),
      ],
    );
  }

  Padding _receipt() {
    return Padding(
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
                    '\$2,50',
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

  Widget _quantity() {
    return Center(
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

  Widget _clueContainer() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: Text(
                    '${dateFormatDate.format(currentDate)} ${dateFormatWeekDay.format(currentDate)} ${dateFormatTime.format(currentDate)}',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                      color: Color.fromRGBO(180, 179, 180, 1),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey[800]),
                  ),
                  child: Center(
                    child: Text(
                      "Thumbnail Image",
                      style: TextStyle(
                        color: CColor.appBlackLight,
                        fontFamily: 'Roboto',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "SFT Price: ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: CColor.appBlackLight,
                                ),
                              ),
                              TextSpan(
                                text: '\$2,50',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto',
                                  color: CColor.appBlackLight,
                                ),
                              ),
                              TextSpan(
                                text: '\n\nSFT Name:',
                                style: TextStyle(
                                  color: CColor.appBlackLight,
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: 'The name should not be more than 2 lines ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto',
                                  color: CColor.appBlackLight,
                                ),
                              ),
                              TextSpan(
                                text: '\nArtist Name:\nSFT Number:\nPod Number:',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  color: CColor.appBlackLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
