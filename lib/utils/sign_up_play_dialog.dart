// import 'package:flutter/material.dart';
// import 'package:world/routes/signup/signup_1.dart';
//
// AlertDialog signUpToPlayDialog(BuildContext context) {
//   return AlertDialog(
//     content: new SingleChildScrollView(
//       child: new ListBody(
//         children: <Widget>[
//           Align(
//             alignment: Alignment.center,
//             child: new Text("Sign Up to Play?"),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//           ),
//           Container(
//             alignment: Alignment.centerLeft,
//             child: new Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 new Flexible(
//                     child: Container(
//                       margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
//                       padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//                       height: 40,
//                       decoration: new BoxDecoration(
//                         color: Color.fromARGB(255, 0, 0, 0),
//                         borderRadius: new BorderRadius.circular(50.0),
//                       ),
//                       child: new SizedBox.expand(
//                         child: new GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => SignUp1()));
//                           },
//                           child: new Text(
//                             "Sign Up",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: 'Roboto'),
//                           ),
//                         ),
//                       ),
//                     ),
//                     flex: 1),
//                 new Flexible(
//                     child: Container(
//                       margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
//                       padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//                       height: 40,
//                       decoration: new BoxDecoration(
//                         color: Color.fromARGB(255, 0, 0, 0),
//                         borderRadius: new BorderRadius.circular(50.0),
//                       ),
//                       child: new SizedBox.expand(
//                         child: new GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context, true);
//                           },
//                           child: new Text(
//                             "No",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: 'Roboto'),
//                           ),
//                         ),
//                       ),
//                     ),
//                     flex: 1),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
