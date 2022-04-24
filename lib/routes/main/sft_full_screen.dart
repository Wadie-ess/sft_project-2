import 'package:flutter/material.dart';

class SftFullPage extends StatelessWidget {
  const SftFullPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: s.height,
        width: s.width,
        color: Colors.black,
        padding: EdgeInsets.all(18),
        child: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height: 10, width: 30),
                Text(
                  "SFT | FULL SCREEN",
                  style: TextStyle(
                    color: Color(0xffB4B3B4),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 30, width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Center(child: Icon(Icons.clear, color: Color(0xff464545))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
