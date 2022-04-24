import 'package:flutter/material.dart';

import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';

class PaymentDonePage extends StatefulWidget {
  final int quantity;

  const PaymentDonePage({Key key, this.quantity}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return PaymentCardDetailState();
  }
}

class PaymentCardDetailState extends State<PaymentDonePage> {
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
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 5),
                      child: CircularProgressIndicator(
                        backgroundColor: Color.fromRGBO(112, 112, 112, 1),
                        strokeWidth: 5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.grey[300],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text("Processing", style: TextStyle(fontFamily: 'Roboto', color: Colors.grey[800], fontSize: 16)),
                    ),
                    SizedBox(height: 30),
                    Icon(Icons.lock, size: 70, color: Colors.grey[700]),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                      child: Text(
                        "You have successfully purchased/used your Special Code Number/\nSuper Special Code Number/\nPromo Code Number\nFor\nSFT Number:\n\nPod Number:\n\nA link to get your SFT has been sent to you. Check your\nin-app notifications menu\nand your email.\n\nYour payment has been unsuccessful. Please contact your bank.\n\nDisplay relevant error or unsuccessful message pending payment option chosen.",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.grey[800],
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30),
                  ]),
                ))));
  }
}
