import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Shared/Model/user_model.dart';

class CustomRadio extends StatefulWidget {
  @override
  createState() {
    return new CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    super.initState();

    sampleData.add(new RadioModel(false, 'Male'));
    sampleData.add(new RadioModel(false, 'Female'));
    sampleData.add(new RadioModel(false, 'Non-Binary'));
    setState(() {
      if (UserModel().gender == 'Male') {
        sampleData[0].isSelected = true;
      } else if (UserModel().gender == 'Female') {
        sampleData[1].isSelected = true;
      } else {
        sampleData[2].isSelected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(22, 15, 0, 0),
      height: 65,
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            //highlightColor: Colors.red,
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                sampleData.forEach((element) => element.isSelected = false);
                sampleData[index].isSelected = true;
                String value = sampleData[index].text.toString();
                print(value);
                UserModel().gender = value;
              });
            },
            child: new RadioItem(sampleData[index]),
          );
        },
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.fromLTRB(0, 3, 6, 3),
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            height: 25.0,
            width: 25.0,
            child: new Center(
              child: new Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: _item.isSelected ? Colors.white : Color.fromRGBO(70, 69, 69, 1),
                  borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
                ),
              ),
            ),
            decoration: new BoxDecoration(
              color: Color.fromRGBO(70, 69, 69, 1),
              border: new Border.all(width: 1.0, color: Colors.white),
              borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 4.0),
            child: new Text(
              _item.text,
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String text;

  RadioModel(this.isSelected, this.text);
}
