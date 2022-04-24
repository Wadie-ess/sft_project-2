import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../utils/CustomDrawer.dart';

class MyPointsRealWLBPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPointsRealWLBPageState();
  }
}

class MyPointsRealWLBPageState extends State<MyPointsRealWLBPage> {
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
              AutoSizeText(
                "REAL WORLD LEADERBOARD | 2019",
                style: CTheme.textRegular16DarkGrey(),
                textAlign: Localization.textAlignLeft(),
              ),
              AutoSizeText(
                "Leaderboard is reset every year",
                style: CTheme.textItalic12LightGrey(),
                textAlign: Localization.textAlignLeft(),
              ),
              _listOfItems(),
              SizedBox(
                height: 10,
              )
            ]),
          ),
        )));
  }

  _listOfItems() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 13,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
            padding: EdgeInsets.all(3),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(180, 179, 180, 1),
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.white)),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: IconButton(
                                      icon: Icon(Icons.person),
                                      iconSize: 40,
                                      color: Colors.white,
                                      onPressed: () => {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 26, 10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${index + 1}. Karlind Govender",
                                style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 14, fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                _tableContainer()
              ],
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              //borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          );
        });
  }

  Widget _tableContainer() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  alignment: Alignment.center,
                  child: Text(
                    '1st',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '2nd',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '3rd',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '4th',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '5th',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  alignment: Alignment.center,
                  child: Text(
                    '1',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '23',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '1',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '2',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '8',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '6th',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '7th',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '8th',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '9th',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '10th',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '55',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '50',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '11',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '4',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
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
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '6',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        style: BorderStyle.solid,
                      )),
                  child: Text(
                    '  Total Points: 257',
                    style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 12),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
