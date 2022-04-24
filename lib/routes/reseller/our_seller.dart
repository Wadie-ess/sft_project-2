import '../../constants/CTheme.dart';
import '../../constants/localization.dart';
import '../../utils/AppBarBuy.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../utils/CustomDrawer.dart';

class OurSellerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OurSellerPageState();
  }
}

class OurSellerPageState extends State<OurSellerPage> {
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
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    AutoSizeText(
                      Localization.stLocalized("ourSeller").toUpperCase(),
                      style: CTheme.textRegular16DarkGrey(),
                      textAlign: Localization.textAlignLeft(),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Text(
                        Localization.stLocalized("resellerMessage1"),
                        style: CTheme.textLight16Black(),
                      ),
                    ),
                    _searchBar(),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
                      child: Text(
                        Localization.stLocalized("ressellerMessage2"),
                        style: CTheme.textLight16Black(),
                      ),
                    ),
                    SizedBox(height: 60)
                  ],
                ),
              )),
        ));
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
            hintText: Localization.stLocalized("search"),
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
}
