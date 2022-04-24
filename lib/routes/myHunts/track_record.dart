import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../signup/signup_name_page.dart';
import '../../utils/AppBarBuy.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../utils/CustomDrawer.dart';

class TrackRecord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TrackRecordState();
  }
}

class TrackRecordState extends State<TrackRecord> {
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
                Localization.stLocalized("huntTrackDetail").toUpperCase(),
                style: CTheme.textRegular16Black(),
                textAlign: Localization.textAlignLeft(),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          Localization.stLocalized("huntsPlayed"),
                          style: CTheme.textRegular12Black(),
                        ),
                        Text("200"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          Localization.stLocalized("pointsDate"),
                          style: CTheme.textRegular12Black(),
                        ),
                        Text("200"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          Localization.stLocalized("pointsYear"),
                          style: CTheme.textRegular12Black(),
                        ),
                        Text(("150")),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          Localization.stLocalized("pointsToCodes"),
                          style: CTheme.textRegular12Black(),
                        ),
                        Text(("50")),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      Localization.stLocalized("pointsInYear"),
                      style: CTheme.textRegular12Black(),
                    ),
                    Text(("2020")),
                  ],
                ),
              ),
              _tableContainer(),
              _searchBar(),
              _listOfItems(),
              SizedBox(
                height: 30,
              )
            ]),
          ),
        )));
  }

  Widget _tableContainer() {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 15, 16, 20),
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

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
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
            hintText: 'Search',
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
                  children: <Widget>[Text(Localization.stLocalized("huntNameTitle")), Text("Insert Name (RW/DW")],
                ),
                Row(
                  children: <Widget>[
                    Text(Localization.stLocalized("yearDate")),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(Localization.stLocalized("position")),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                //borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all()),
          );
        });
  }
}
