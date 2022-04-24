import 'package:flutter/material.dart';
import '../constants/CTheme.dart';

class CustomRadioSeller extends StatefulWidget {
  @override
  createState() {
    return new CustomRadioSellerState();
  }
}

class CustomRadioSellerState extends State<CustomRadioSeller> {
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new RadioModel(false, 'Shop  '));
    sampleData.add(new RadioModel(false, 'Online Store/Platform'));
    sampleData.add(new RadioModel(false, 'Independent Sales Executive'));

  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.fromLTRB(16, 15, 0, 0),
      child: new ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
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
      margin: new EdgeInsets.all(3.0),
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
            height: 30.0,
            width: 30.0,
            child: new Center(
              child: new Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: _item.isSelected ?  Color.fromRGBO(70, 69, 69, 1):Colors.white,
                    borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
            ),
              ),
            ),
            decoration: new BoxDecoration(
              color:Colors.white,
              border: new Border.all(
                  width: 1.0,
                  color:Color.fromRGBO(70, 69, 69, 1) ),
              borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 8.0),
            child: new Text(_item.text,style: CTheme.textRegular16Black())
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