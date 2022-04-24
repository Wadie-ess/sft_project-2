import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../utils/CustomDrawer.dart';

class MyPointsTopHistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPointsTopHistoryPageState();
  }
}

class MyPointsTopHistoryPageState extends State<MyPointsTopHistoryPage> {
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
                "TOP 10 HISTORY",
                style: CTheme.textRegular16DarkGrey(),
                textAlign: Localization.textAlignLeft(),
              ),
              _searchBar(),
              _listOfItems(),
              SizedBox(
                height: 10,
              )
            ]),
          ),
        )));
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 5),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () => {}),
            contentPadding: EdgeInsets.fromLTRB(18, 0, 18, 0),
            hintText: 'Search Position eg. 1st, 2nd etc.',
            hintStyle: TextStyle(color: Colors.white, fontSize: 16),
            filled: true,
            fillColor: Color.fromRGBO(70, 69, 69, 1),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(const Radius.circular(20))),
          ),
        ),
      ),
    );
  }

  _listOfItems() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 13,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Hunt name goes here plea",
                        style: TextStyle(
                          color: Color.fromRGBO(70, 69, 69, 1),
                          fontSize: 14,
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("DW1.  |  SH/NSH",
                        style: TextStyle(
                          color: Color.fromRGBO(70, 69, 69, 1),
                          fontSize: 11,
                        )),
                  ],
                ),
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
                          padding: const EdgeInsets.fromLTRB(10, 18, 10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Name of Winner",
                                style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 14, fontWeight: FontWeight.w100),
                              ),
                              Text("Date Year, Day at Time",
                                  style: TextStyle(color: Color.fromRGBO(70, 69, 69, 1), fontSize: 11, fontWeight: FontWeight.w100))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                //borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Color.fromRGBO(70, 69, 69, 1))),
          );
        });
  }
}
