import 'package:flutter/material.dart';

class CommonUtils {
  // Shared Preferences strings
  static String URL = "https://geodata.solutions/api/api.php?";

  // Display strings
  static String NO_NETWORK_CONNECTED = "Please connect to working internet network.";
  static String NO_CONNECTED = "No connection";

  // show Validation/Error dialog
  static Future<void> validatorDialogBox(BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: new Text("$message"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    height: 40,
                    decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    child: new SizedBox.expand(
                      child: new GestureDetector(
                        onTap: () {
                          Navigator.pop(context, true);
                        },
                        child: new Text(
                          "OK",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
