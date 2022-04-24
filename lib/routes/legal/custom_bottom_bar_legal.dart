import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import 'package:flutter/material.dart';

class CustomBottomBarLegal extends StatefulWidget {
  final ValueChanged<bool> agreed;

  const CustomBottomBarLegal({Key key, this.agreed}) : super(key: key);
  @override
  _CustomBottomBarLegalState createState() => _CustomBottomBarLegalState();
}

class _CustomBottomBarLegalState extends State<CustomBottomBarLegal> {
  bool allowVal = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(45, 45, 45, 1),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: CColor.appWhite,
                  )),
              child: Theme(
                data: ThemeData(unselectedWidgetColor: Color.fromRGBO(45, 45, 45, 1)),
                child: Checkbox(
                    activeColor: Color.fromRGBO(45, 45, 45, 1),
                    checkColor: CColor.appWhite,
                    tristate: false,
                    value: allowVal,
                    onChanged: (bool value) {
                      widget.agreed(value);
                      setState(() {
                        allowVal = value;
                      });
                    }),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Text(
                Localization.stLocalized("legalTerms"),
                style: TextStyle(fontSize: 12, fontFamily: CTheme.defaultFont(), fontWeight: FontWeight.w400, color: CColor.appGreyLight),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
