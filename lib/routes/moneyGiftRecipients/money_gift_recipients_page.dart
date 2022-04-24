import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';

class MoneyGiftRecipientsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MoneyGiftRecipientsPageState();
  }
}

class MoneyGiftRecipientsPageState extends State<MoneyGiftRecipientsPage> {
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
                "MONEY-REWARD | RECIPIENTS",
                style: CTheme.textRegular16DarkGrey(),
                textAlign: Localization.textAlignLeft(),
              ),
              _searchBar(),
              _listOfItems(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back),
                  ),
                  AutoSizeText(
                    "1 / 2135\nmore...",
                    style: CTheme.textRegular16DarkGrey(),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
              SizedBox(height: 50),
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
            hintText: 'Search Recipients',
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
            margin: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
            padding: EdgeInsets.all(10),
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
                              color: Color(0xffb4b3b4), borderRadius: BorderRadius.circular(100), border: Border.all(color: Colors.white)),
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
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${index + 1}. Karlind Govender",
                              softWrap: true,
                              style: TextStyle(color: Color(0xff464545), fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Amount \$",
                              softWrap: true,
                              style: TextStyle(color: Color(0xff464545), fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              //borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          );
        });
  }
}
