import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/CustomRadioBuy.dart';
import '../../utils/CustomRadioBuyFalse.dart';
import '../riddleClue/get_riddle_clue_page.dart';

class BuyRiddlePage extends StatefulWidget {
  @override
  _BuyRiddlePage createState() => _BuyRiddlePage();
}

class _BuyRiddlePage extends State<BuyRiddlePage> {
  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;
  String _value;
  String imageValue = 'assets/images/mastercardimg.png';
  String imageAddress = "assets/images/placeholder/black_adidas.png";

  int keyValue = 0;

  var abc;
  DateTime currentDate = new DateTime.now();
  final dateFormatDate = new DateFormat.yMMMMd('en_US');
  final dateFormatTime = new DateFormat.Hm();
  final dateFormatWeekDay = new DateFormat('EEEE');

  @override
  void initState() {
    super.initState();
    swapLogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _paymentSecuredBotomBar(),
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBarBuy(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text("BUY RIDDLE | REVIEW",
                      style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(70, 69, 69, 1), fontSize: 18)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                      "if something appears to be missing or incorrect"
                      ",\n        please contact CUSTOMER SUPPORT",
                      style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(180, 179, 180, 1), fontSize: 12)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
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
                                  border: Border(
                                      bottom: BorderSide(color: Colors.black),
                                      top: BorderSide(color: Colors.black),
                                      right: BorderSide(color: Colors.black),
                                      left: BorderSide(color: Colors.black))),
                              child: ClipRRect(
                                child: Image.asset(imageAddress),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              )),
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
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Container(
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
                              padding: EdgeInsets.fromLTRB(0, 5, 10, 0),
                              child: Text(
                                'June${dateFormatDate.format(currentDate)} ${dateFormatWeekDay.format(currentDate)} ${dateFormatTime.format(currentDate)}',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromRGBO(180, 179, 180, 1),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              /*Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: IconButton(
                                        icon: Image.asset(
                                            'assets/images/triangle.png'),
                                        iconSize: 80,
                                        color: Colors.black,
                                        onPressed: () => {},
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(42, 5, 0, 0),
                                      child: Container(
                                        child: Text(
                                          'R',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 20),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),*/
                              Image.asset(
                                "assets/images/triangle/triangle_riddle.png",
                                scale: 1.3,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Container(
                                  child: Text(
                                    'Riddle',
                                    style: TextStyle(color: Colors.black, fontSize: 15),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Text(
                                  'Riddle Number: RWRInsertHuntNumber',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontWeight: FontWeight.w100),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text("PAYMENT METHOD", style: TextStyle(fontFamily: 'Roboto', color: Color.fromRGBO(70, 69, 69, 1), fontSize: 18)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(70, 69, 69, 1), style: BorderStyle.solid)),
                    child: Row(
                      children: <Widget>[
                        Container(alignment: Alignment.topLeft, height: 120, width: 60, child: CustomRadioBuy()),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 120,
                            child: Container(
                              height: 100,
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.scaleDown,
                                  image: AssetImage(imageValue),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          color: Color.fromRGBO(70, 69, 69, 1),
                          child: DropdownButton<String>(
                            underline: Container(
                              color: Color.fromRGBO(70, 69, 69, 1),
                            ),
                            iconEnabledColor: Colors.white,
                            iconDisabledColor: Colors.white,
                            hint: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 120,
                                child: Text(
                                  'Other Payment Opions',
                                  style: TextStyle(fontFamily: 'Roboto', fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                            isExpanded: true,
                            items: [
                              DropdownMenuItem(
                                value: "1",
                                child: Container(
                                  height: 120,
                                  decoration:
                                      BoxDecoration(border: Border.all(color: Color.fromRGBO(70, 69, 69, 1), style: BorderStyle.solid)),
                                  child: Row(
                                    children: <Widget>[
                                      Container(alignment: Alignment.topLeft, height: 120, width: 60, child: CustomRadioBuyFalse()),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          height: 120,
                                          child: Container(
                                            height: 100,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.scaleDown,
                                                image: AssetImage('assets/images/visaimg.png'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "2",
                                child: Container(
                                  height: 120,
                                  decoration:
                                      BoxDecoration(border: Border.all(color: Color.fromRGBO(70, 69, 69, 1), style: BorderStyle.solid)),
                                  child: Row(
                                    children: <Widget>[
                                      Container(alignment: Alignment.topLeft, height: 120, width: 60, child: CustomRadioBuyFalse()),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          height: 120,
                                          child: Container(
                                            height: 100,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.scaleDown,
                                                image: AssetImage('assets/images/paypalimg.png'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "3",
                                child: Container(
                                  height: 120,
                                  decoration:
                                      BoxDecoration(border: Border.all(color: Color.fromRGBO(70, 69, 69, 1), style: BorderStyle.solid)),
                                  child: Row(
                                    children: <Widget>[
                                      Container(alignment: Alignment.topLeft, height: 120, width: 60, child: CustomRadioBuyFalse()),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          height: 120,
                                          child: Container(
                                            height: 120,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.scaleDown,
                                                image: AssetImage('assets/images/instanteftimg.png'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "4",
                                child: Container(
                                  height: 120,
                                  decoration:
                                      BoxDecoration(border: Border.all(color: Color.fromRGBO(70, 69, 69, 1), style: BorderStyle.solid)),
                                  child: Row(
                                    children: <Widget>[
                                      Container(alignment: Alignment.topLeft, height: 120, width: 60, child: CustomRadioBuyFalse()),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          height: 120,
                                          child: Container(
                                            height: 120,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.scaleDown,
                                                image: AssetImage('assets/images/bitcoinimg.png'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "5",
                                child: Container(
                                  height: 120,
                                  decoration:
                                      BoxDecoration(border: Border.all(color: Color.fromRGBO(70, 69, 69, 1), style: BorderStyle.solid)),
                                  child: Row(
                                    children: <Widget>[
                                      Container(alignment: Alignment.topLeft, height: 120, width: 60, child: CustomRadioBuyFalse()),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          height: 120,
                                          child: Container(
                                            height: 120,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.scaleDown,
                                                image: AssetImage('assets/images/mobicred.png'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "6",
                                child: Container(
                                  height: 120,
                                  decoration:
                                      BoxDecoration(border: Border.all(color: Color.fromRGBO(70, 69, 69, 1), style: BorderStyle.solid)),
                                  child: Row(
                                    children: <Widget>[
                                      Container(alignment: Alignment.topLeft, height: 120, width: 60, child: CustomRadioBuyFalse()),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          height: 120,
                                          child: Container(
                                            height: 120,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.scaleDown,
                                                image: AssetImage('assets/images/masterpassimg.png'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "7",
                                child: Container(
                                  height: 120,
                                  decoration:
                                      BoxDecoration(border: Border.all(color: Color.fromRGBO(70, 69, 69, 1), style: BorderStyle.solid)),
                                  child: Row(
                                    children: <Widget>[
                                      Container(alignment: Alignment.topLeft, height: 120, width: 60, child: CustomRadioBuyFalse()),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          height: 120,
                                          child: Container(
                                            height: 70,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage('assets/images/scode.png'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              updatevalue(value);
                            },
                            value: _value,
                          ),
                        ),
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
                          MaterialPageRoute(builder: (context) => GetRiddleCluePage()),
                        )
                      },
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
