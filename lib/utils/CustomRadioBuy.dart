import 'package:flutter/material.dart';

class CustomRadioBuy extends StatefulWidget {
  @override
  createState() {
    return new CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadioBuy> {
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new RadioModel(true, ''));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
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
      margin: new EdgeInsets.all(5.0),
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            height: 30.0,
            width: 30.0,
            child: new Center(
              child: new Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: _item.isSelected ? Color.fromRGBO(70, 69, 69, 1) : Colors.white,
                  borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
                ),
              ),
            ),
            decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(width: 2.0, color: Color.fromRGBO(70, 69, 69, 1)),
              borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 10.0),
            child: new Text(
              _item.text,
              style: TextStyle(color: Colors.white),
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
