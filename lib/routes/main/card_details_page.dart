import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Shared/DAL/BuyGameUnitsData.dart';
import '../../Shared/Model/user_model.dart';
import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../buyGameUnits/payment_message_screen.dart';
import 'payment_done_page.dart';
import '../signup/signup_name_page.dart';
import '../../utils/AppBarBuy.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utils/CustomDrawer.dart';

class CardDetailPage extends StatefulWidget {
  final int quantity;

  const CardDetailPage({Key key, this.quantity}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return PaymentCardDetailState();
  }
}

class PaymentCardDetailState extends State<CardDetailPage> {
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
                        "BUY SFT | CARD DETAILS",
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
                    _cardDetails(),
                    _clueContainer(),
                    _receipt(),
                    SizedBox(height: 20),
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
                                "Pay Now (\$2,50)",
                                style: CTheme.textRegular16White(),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: CColor.appBlackLight, borderRadius: BorderRadius.all(Radius.circular(12)), border: Border.all()),
                      ),
                      onTap: () async {
                        Get.to(() => PaymentDonePage());
                        return;
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

  Padding _cardDetails() {
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
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromRGBO(70, 69, 69, 1),
                        style: BorderStyle.solid,
                        width: 0.5,
                      )),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '      Card Number XXXX XXXX',
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
                      border: Border.all(
                        color: Color.fromRGBO(70, 69, 69, 1),
                        style: BorderStyle.solid,
                        width: 0.5,
                      )),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '      First Name',
                    style: TextStyle(
                      color: Color.fromRGBO(70, 69, 69, 1),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromRGBO(70, 69, 69, 1),
                        style: BorderStyle.solid,
                        width: 0.5,
                      )),
                  child: Text(
                    '      Last Name',
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
                      border: Border.all(
                        color: Color.fromRGBO(70, 69, 69, 1),
                        style: BorderStyle.solid,
                        width: 0.5,
                      )),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '      MM / YYYY',
                    style: TextStyle(
                      color: Color.fromRGBO(70, 69, 69, 1),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 40,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color.fromRGBO(70, 69, 69, 1),
                            style: BorderStyle.solid,
                            width: 0.5,
                          )),
                      child: Text(
                        '      CVV',
                        style: TextStyle(
                          color: Color.fromRGBO(70, 69, 69, 1),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 2,
                      right: 2,
                      child: Icon(Icons.help, size: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
