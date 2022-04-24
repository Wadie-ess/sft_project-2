///Created by zakria khan at 26/06/2021///
///email contact@zakriakhan.com///
///fiver link :  https://www.fiverr.com/users/toptutorial270///
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:world/constants/CTheme.dart';
import 'package:world/constants/localization.dart';
import 'package:world/routes/main/main_page.dart';
import 'package:world/utils/AppBarBuy.dart';

class MessageDisplayScreen extends StatelessWidget {
  final String message;

  const MessageDisplayScreen({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarBuy(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                _messageContainer(context),
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        )
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _messageContainer(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double widgetWidth = screenWidth - 80;
    print(screenWidth);
    print(widgetWidth);
    return Center(
        child: Container(
            child: Column(children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: AutoSizeText(
                Localization.stLocalized(message),
                textAlign: TextAlign.center,
                style: CTheme.textLight16Yellow(),
              ),
            ),
          ),
        ],
      ),
    ])));
  }
}
