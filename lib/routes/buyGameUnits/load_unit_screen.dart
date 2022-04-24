import 'package:flutter/material.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';

class LoadUnitMessagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoadUnitMessagePageState();
  }
}

class LoadUnitMessagePageState extends State<LoadUnitMessagePage> {
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: CircularProgressIndicator(
                      backgroundColor: Color.fromRGBO(112, 112, 112, 1),
                      strokeWidth: 5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset("assets/images/locks/black_lock.png"),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 200,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Expanded(
                              child: Text(
                            Localization.stLocalized("loadPayment"),
                            style: CTheme.textLight16Black(),
                          )),
                        ])
                      ],
                    ),
                  ),
                ]),
              )),
        ));
  }
}
