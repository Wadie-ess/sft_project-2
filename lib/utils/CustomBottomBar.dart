import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../constants/CTheme.dart';
import '../routes/foundit/found_it_page.dart';
import '../routes/main/choose_hunt_page.dart';

class CustomBottomBar extends StatelessWidget {
  final bool shareable;

  const CustomBottomBar({Key key, this.shareable = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      color: Color.fromRGBO(45, 45, 45, 1),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/bottom_bar/compas.png",
                      scale: 1.3,
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        "FOUND IT?",
                        style: CTheme.textRegular16White(),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoundItPage()),
                  );
                },
              ),
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/bottom_bar/globe.png',
                      scale: 1.3,
                    ),
                    SizedBox(width: 5),
                    Expanded(child: Text("HUNT OPTIONS", style: CTheme.textRegular16White())),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChooseHuntPage()),
                  );
                },
              ),
            ),
          ),
          shareable
              ? Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      onPressed: () => {
                        share(context),
                      },
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

share(BuildContext context) {
  RenderBox box = context.findRenderObject();

  Share.share("Share", sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}
