import 'package:flutter/material.dart';

import '../../constants/CColors.dart';

class AppStepper extends StatelessWidget {
  final int active;
  const AppStepper({Key key, this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("1"),
              Text("2"),
              Text("3"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20),
                  color: CColor.appGreyDark,
                ),
              ),
              Expanded(child: Container(height: 1.5, color:CColor.appGreyDark)),
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20),
                  color: active >= 2 ? CColor.appGreyDark : Colors.white,
                ),
              ),
              Expanded(child: Container(height: 1.5, color:CColor.appGreyDark)),
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20),
                  color: active >= 3 ? CColor.appGreyDark : Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("SEND PHOTO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
            Text("SEND BANK INFO TO CLAIM", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
            Text("STATUS", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
          ],
        ),

      ],
    );
  }
}
