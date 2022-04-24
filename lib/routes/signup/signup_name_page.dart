// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:world/Shared/Model/countryModel.dart' as cModel;
// import 'package:world/Shared/Model/security_question_model.dart';
// import 'package:world/routes/legal/legal_page.dart';
// import 'package:world/routes/signup/signup_welcome_page.dart';
// import 'package:world/utils/widgets/logo.dart';
// import 'country_state_city_picker_custom.dart';
// import 'package:autocomplete_textfield/autocomplete_textfield.dart';
//   // import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:intl/intl.dart';
// import 'package:searchable_dropdown/searchable_dropdown.dart';
// import 'package:world/Shared/DAL/Authentication.dart';
// import 'package:world/Shared/Model/user_model.dart';
//
// import 'package:world/utils/AppBarSignup.dart';
//
// import 'package:world/utils/CustomRadio.dart';
//
// import 'package:fluttertoast/fluttertoast.dart';
//
// class SignupNamePage extends StatefulWidget {
//   @override
//   _SignupNamePage createState() => _SignupNamePage();
// }
//
// class _SignupNamePage extends State<SignupNamePage> {
//   List<cModel.State> statesOfCountry;
//   List<cModel.City> cityOfStates;
//   String countryValue = "Select Country";
//   String stateValue = "Select State / Province";
//   String cityValue = "Select City";
//   String countryCode = "+27";
//
//   bool isCountriesShowing = false;
//   List<cModel.CountryParse> countries;
//   String phoneNo;
//   bool allowVal = false;
//   bool wedVal = false;
//  //
//
//   List<DropdownMenuItem<String>> listOfDropdown = [];
//   GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
//   String selectedCountryCallingCode = "";
//
//   FocusNode _addressFocus = FocusNode();
//
//   FocusNode _phoneFocus = FocusNode();
//
//   //field Missing Or Wrong
//
//   bool _address = false;
//
//   bool _country = false;
//   bool _city = false;
//   bool _state = false;
//   bool _countryCode = false;
//   bool _phone = false;
//
//   //VALADATION
//   bool fieldIsNotCorrect = false;
//
//   checkField() {
//     print('checking Fields');
//
//     setState(() {
//       if (UserModel().name == null || UserModel().name.length == 0) fieldIsNotCorrect = true;
//       if (UserModel().surname == null || UserModel().surname.length == 0) fieldIsNotCorrect = true;
//       if (UserModel().nickName == null || UserModel().nickName.length == 0)
//         fieldIsNotCorrect = true;
//       if (UserModel().email == null ||
//           UserModel().email.length == 0 ||
//           !UserModel().email.contains('@')) fieldIsNotCorrect = true;
//       if (UserModel().address == null || UserModel().address.length == 0) fieldIsNotCorrect = true;
//       if (UserModel().securityuestionID == null || UserModel().securityuestionID.length == 0)
//         fieldIsNotCorrect = true;
//       if (UserModel().securityAnswer == null || UserModel().securityAnswer.length == 0)
//         fieldIsNotCorrect = true;
//       if (UserModel().securityAnswer == null || UserModel().securityAnswer.length == 0)
//         fieldIsNotCorrect = true;
//       if (UserModel().country == null || UserModel().country.length == 0) fieldIsNotCorrect = true;
//
//       if (UserModel().mobileNo == null ||
//           UserModel().mobileNo.length == 0 ||
//           (UserModel().mobileNo.length > 8 && UserModel().mobileNo.length < 12))
//         fieldIsNotCorrect = true;
//       if (UserModel().dob == null || UserModel().dob.length == 0) fieldIsNotCorrect = true;
//       // if (pwd1 != pwd2) fieldIsNotCorrect = true;
//     });
//   }
//
//   makeIncorrectFieldYellow() {
//     print('makeIcorrectFieldYellow');
//     setState(() {
//       // if (UserModel().name == null || UserModel().name.length == 0) _name = true;
//       // if (UserModel().surname == null || UserModel().surname.length == 0) _surname = true;
//       // if (UserModel().nickName == null || UserModel().nickName.length == 0) _nickName = true;
//       // if (UserModel().email == null ||
//       //     UserModel().email.length == 0 ||
//       //     !UserModel().email.contains('@')) _email = true;
//       // if (UserModel().email == null || UserModel().email.length == 0 || _email != _confirmEmail)
//       //   _confirmEmail = true;
//       if (UserModel().address == null || UserModel().address.length == 0) _address = true;
//       // if (UserModel().securityuestionID == null || UserModel().securityuestionID.length == 0)
//       //   _sQ = true;
//       // if (UserModel().securityAnswer == null || UserModel().securityAnswer.length == 0)
//       //   _sQanswer = true;
//       // if (UserModel().securityAnswer == null || UserModel().securityAnswer.length == 0)
//       //   _sQanswer = true;
//       if (UserModel().country == null || UserModel().country.length == 0) _country = true;
//       if (UserModel().mobileNo == null ||
//           UserModel().mobileNo.length == 0 ||
//           (UserModel().mobileNo.length > 8 && UserModel().mobileNo.length < 12)) _phone = true;
//       if (UserModel().dob == null || UserModel().dob.length == 0) _dob = true;
//       // if (pwd1 != pwd2) _passNotMatch = true;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     // getCountryData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        
//       backgroundColor: Colors.black,
//       appBar: AppBarSignup(),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Container(
//           child: Center(
//             child: Column(
//               children: <Widget>[
//                 ChoohooLogo(),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
//                   child: Text("SIGN UP",
//                       style: TextStyle(
//                           fontFamily: 'Roboto',
//                           color: Color.fromRGBO(180, 179, 180, 1),
//                           fontSize: 18)),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
//                   child: Form(
//                     child: Column(
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
//                           child: Container(
//                             height: 50,
//                             child: TextFormField(
//                               focusNode: _addressFocus,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _address = false;
//                                 });
//                                 UserModel().address = value;
//                               },
//                               onEditingComplete: () {
//                                 // _createPassFocus.requestFocus();
//                               },
//                               style: TextStyle(color: Colors.white),
//                               cursorColor: Colors.white,
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
//                                 hintText: 'Address',
//                                 hintStyle: TextStyle(color: Colors.white),
//                                 filled: true,
//                                 fillColor: Color.fromRGBO(70, 69, 69, 1),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                     width: 1,
//                                     style: BorderStyle.solid,
//                                   ),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: _address ? Colors.yellow : Colors.white,
//                                       width: 1,
//                                     ),
//                                     borderRadius: BorderRadius.all(const Radius.circular(20))),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
// //                   child: Form(
// //                     child: Column(
// //                       children: <Widget>[
// //                         Padding(
// //                           padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
// //                           child: Container(
// //                             height: 50,
// //                             child: TextFormField(
// //                               focusNode: _createPassFocus,
// //                               onChanged: (value) {
// //                                 setState(() {
// //                                   _passNotMatch = false;
// //                                 });
// //                                 UserModel().password = value;
// //                                 pwd1 = value;
// //                               },
// //                               onEditingComplete: () {
// //                                 _confirmPassFocus.requestFocus();
// //                               },
// //                               obscureText: _obscureText1,
// //                               style: TextStyle(color: Colors.white),
// //                               cursorColor: Colors.white,
// //                               decoration: InputDecoration(
// //                                 suffixIcon: Container(
// //                                   width: 70,
// //                                   child: FlatButton(
// //                                       splashColor: Colors.transparent,
// //                                       onPressed: _showPasswordToggle1,
// //                                       child: Align(
// //                                           alignment: Alignment.centerRight,
// //                                           child: new Text(
// //                                             _obscureText1 ? "Show" : "Hide",
// //                                             style:
// //                                                 TextStyle(color: Color.fromRGBO(180, 179, 180, 1)),
// //                                           ))),
// //                                 ),
// //                                 contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
// //                                 hintText: 'Create Password*',
// //                                 hintStyle: TextStyle(color: Colors.white),
// //                                 filled: true,
// //                                 fillColor: Color.fromRGBO(70, 69, 69, 1),
// //                                 focusedBorder: OutlineInputBorder(
// //                                   borderRadius: BorderRadius.circular(20),
// //                                   borderSide: BorderSide(
// //                                     color: Colors.white,
// //                                     width: 1,
// //                                     style: BorderStyle.solid,
// //                                   ),
// //                                 ),
// //                                 enabledBorder: OutlineInputBorder(
// //                                     borderSide: BorderSide(
// //                                       color: Colors.white,
// //                                       width: 1,
// //                                     ),
// //                                     borderRadius: BorderRadius.all(const Radius.circular(20))),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
// //                   child: Form(
// //                     child: Column(
// //                       children: <Widget>[
// //                         Padding(
// //                           padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
// //                           child: Container(
// //                             height: 50,
// //                             child: TextFormField(
// //                               focusNode: _confirmPassFocus,
// //                               onChanged: (value) {
// //                                 setState(() {
// //                                   _passNotMatch = false;
// //                                 });
// //                                 pwd2 = value;
// //                               },
// //                               obscureText: _obscureText2,
// //                               style: TextStyle(color: Colors.white),
// //                               cursorColor: Colors.white,
// //                               decoration: InputDecoration(
// //                                 suffixIcon: Container(
// //                                   width: 70,
// //                                   child: FlatButton(
// //                                       splashColor: Colors.transparent,
// //                                       onPressed: _showPasswordToggle2,
// //                                       child: Align(
// //                                           alignment: Alignment.centerRight,
// //                                           child: new Text(
// //                                             _obscureText2 ? "Show" : "Hide",
// //                                             style:
// //                                                 TextStyle(color: Color.fromRGBO(180, 179, 180, 1)),
// //                                           ))),
// //                                 ),
// //                                 contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
// //                                 hintText: 'Enter Password again to confirm*',
// //                                 hintStyle: TextStyle(color: Colors.white),
// //                                 filled: true,
// //                                 fillColor: Color.fromRGBO(70, 69, 69, 1),
// //                                 focusedBorder: OutlineInputBorder(
// //                                   borderRadius: BorderRadius.circular(20),
// //                                   borderSide: BorderSide(
// //                                     color: Colors.white,
// //                                     width: 1,
// //                                     style: BorderStyle.solid,
// //                                   ),
// //                                 ),
// //                                 enabledBorder: OutlineInputBorder(
// //                                     borderSide: BorderSide(
// //                                       color: _passNotMatch ? Colors.yellow : Colors.white,
// //                                       width: 1,
// //                                     ),
// //                                     borderRadius: BorderRadius.all(const Radius.circular(20))),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.fromLTRB(16, 15, 16, 0),
// //                   child: Container(
// //                     height: 50,
// //                     decoration: BoxDecoration(
// //                         color: Color.fromRGBO(70, 69, 69, 1),
// //                         borderRadius: BorderRadius.circular(20),
// //                         border: Border.all(color: _sQ ? Colors.yellow : Colors.white)),
// //                     child: Padding(
// //                       padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
// //                       child: Theme(
// //                         data:
// //                             Theme.of(context).copyWith(canvasColor: Color.fromRGBO(70, 69, 69, 1)),
// //                         child: ButtonTheme(
// //                           alignedDropdown: true,
// //                           child: DropdownButton<String>(
// //                             underline: Container(),
// //                             iconEnabledColor: Colors.white,
// //                             iconDisabledColor: Colors.white,
// //                             hint: Align(
// //                               alignment: Alignment.centerLeft,
// //                               child: Text(
// //                                 'Security Question*',
// //                                 style: TextStyle(
// //                                     fontFamily: 'Roboto', fontSize: 16, color: Colors.white),
// //                               ),
// //                             ),
// //                             isExpanded: true,
// //                             items: dropDownMenuItems(),
// //                             onChanged: (value) {
// //                               UserModel().securityuestionID = value;
// //                               setState(() {
// //                                 _valueSQ = value;
// //                                 _sQ = false;
// //                               });
// //                             },
// //                             value: _valueSQ,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
// //                   child: Form(
// // //                    key: _formKey,
// //                     child: Column(
// //                       children: <Widget>[
// //                         Padding(
// //                           padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
// //                           child: Container(
// //                             height: 50,
// //                             child: TextFormField(
// //                               onChanged: (value) {
// //                                 setState(() {
// //                                   _sQanswer = false;
// //                                 });
// //                                 return UserModel().securityAnswer = value;
// //                               },
// //                               style: TextStyle(color: Colors.white),
// //                               cursorColor: Colors.white,
// //                               decoration: InputDecoration(
// //                                 contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
// //                                 hintText: 'Security Answer*',
// //                                 hintStyle: TextStyle(color: Colors.white),
// //                                 filled: true,
// //                                 fillColor: Color.fromRGBO(70, 69, 69, 1),
// //                                 focusedBorder: OutlineInputBorder(
// //                                   borderRadius: BorderRadius.circular(20),
// //                                   borderSide: BorderSide(
// //                                     color: Colors.white,
// //                                     width: 1,
// //                                     style: BorderStyle.solid,
// //                                   ),
// //                                 ),
// //                                 enabledBorder: OutlineInputBorder(
// //                                     borderSide: BorderSide(
// //                                       color: _sQanswer ? Colors.yellow : Colors.white,
// //                                       width: 1,
// //                                     ),
// //                                     borderRadius: BorderRadius.all(const Radius.circular(20))),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
//                 //Country State City Picker
//                 isCountriesShowing
//                     ? Container(
//                         margin: const EdgeInsets.fromLTRB(16, 15, 16, 0),
//                         decoration: BoxDecoration(
//                             color: Color.fromRGBO(70, 69, 69, 1),
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(color: _country ? Colors.yellow : Colors.white)),
//                         child: MediaQuery.removePadding(
//                           removeBottom: true,
//                           removeTop: true,
//                           context: context,
//                           child: SearchableDropdown(
//                             style: TextStyle(color: Colors.white),
//                             isExpanded: true,
//                             underline: Container(),
//                             isCaseSensitiveSearch: false,
//                             items: countries.map((e) {
//                               return DropdownMenuItem(
//                                   child: Text(e.name, style: TextStyle()), value: e.name);
//                             }).toList(),
//                             //   value: selectedValue,
//                             hint: Text(countryValue, style: TextStyle(color: Colors.white)),
//
//                             searchHint: "Select one",
//                             onChanged: (value) {
//                               var country =
//                                   countries.firstWhere((element) => element.name == value);
//
//                               statesOfCountry = country.state;
//                               cityOfStates = null;
//                               if (value != null) UserModel().country = value.toString().trim();
//                               setState(() {
//                                 setState(() {
//                                   _country = false;
//                                 });
//                                 countryValue = value.toString();
//                               });
//                               print(countryValue);
//                             },
//                           ),
//                         ),
//                       )
//                     : CircularProgressIndicator(),
//                 (statesOfCountry != null && statesOfCountry?.isNotEmpty)
//                     ? Container(
//                         margin: const EdgeInsets.fromLTRB(16, 15, 16, 0),
//                         decoration: BoxDecoration(
//                             color: Color.fromRGBO(70, 69, 69, 1),
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(color: _state ? Colors.yellow : Colors.white)),
//                         child: MediaQuery.removePadding(
//                           removeBottom: true,
//                           removeTop: true,
//                           context: context,
//                           child: SearchableDropdown(
//                             style: TextStyle(color: Colors.white),
//                             isExpanded: true,
//                             underline: Container(),
//                             isCaseSensitiveSearch: false,
//                             items: statesOfCountry.map((e) {
//                               return DropdownMenuItem(
//                                   child: Text(e.name, style: TextStyle()), value: e.name);
//                             }).toList(),
//                             //   value: selectedValue,
//                             hint: Text(stateValue, style: TextStyle(color: Colors.white)),
//
//                             searchHint: "Select one",
//                             onChanged: (value) {
//                               var state =
//                                   statesOfCountry.firstWhere((element) => element.name == value);
//                               print(state.id);
//                               cityOfStates = state.city;
//                               if (value != null) UserModel().province = value.toString().trim();
//                               setState(() {
//                                 _state = false;
//                                 stateValue = value.toString();
//                               });
//                               print(stateValue);
//                             },
//                           ),
//                         ),
//                       )
//                     : Container(),
//                 (cityOfStates != null && cityOfStates?.isNotEmpty)
//                     ? Container(
//                         margin: const EdgeInsets.fromLTRB(16, 15, 16, 0),
//                         decoration: BoxDecoration(
//                             color: Color.fromRGBO(70, 69, 69, 1),
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(color: _city ? Colors.yellow : Colors.white)),
//                         child: MediaQuery.removePadding(
//                           removeBottom: true,
//                           removeTop: true,
//                           context: context,
//                           child: SearchableDropdown(
//                             style: TextStyle(color: Colors.white),
//                             isExpanded: true,
//                             underline: Container(),
//                             isCaseSensitiveSearch: false,
//                             items: cityOfStates.map((e) {
//                               return DropdownMenuItem(
//                                   child: Text(e.name, style: TextStyle()), value: e.name);
//                             }).toList(),
//                             //   value: selectedValue,
//                             hint: Text(cityValue, style: TextStyle(color: Colors.white)),
//
//                             searchHint: "Select one",
//                             onChanged: (value) {
//                               var city =
//                                   cityOfStates.firstWhere((element) => element.name == value);
//                               print(city.id);
//                               if (value != null) UserModel().city = value.toString().trim();
//                               setState(() {
//                                 _city = false;
//                                 stateValue = value.toString();
//                               });
//                               print(stateValue);
//                             },
//                           ),
//                         ),
//                       )
//                     : Container(),
//
//                 //Phone Number Field
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(16, 15, 16, 0),
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                             color: Color.fromRGBO(70, 69, 69, 1),
//                             borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(20),
//                                 bottomRight: Radius.circular(0),
//                                 topLeft: Radius.circular(20),
//                                 topRight: Radius.circular(0)),
//                             border: Border.all(color: _countryCode ? Colors.yellow : Colors.white)),
//                         child: SizedBox(
//                           width: 80,
//                           height: 50,
//                           child: CountryCodePicker(
//                             onChanged: (val) {
//                               setState(() {
//                                 _countryCode = false;
//                                 countryCode = val.toString();
//                                 print(countryCode);
//                               });
//                             },
//                             // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//                             initialSelection: 'ZA',
//                             textStyle: TextStyle(
//                               color: Colors.white,
//                               fontFamily: 'Roboto',
//                               fontSize: 16,
//                             ),
//                             textOverflow: TextOverflow.visible,
//                             hideSearch: false,
//                             showDropDownButton: false,
//                             showFlag: true,
//                             showFlagMain: false,
//                             showOnlyCountryWhenClosed: false,
//                             backgroundColor: Colors.grey,
//                             // flag can be styled with BoxDecoration's `borderRadius` and `shape` fields
//                             boxDecoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(7),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 0),
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             height: 50,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                   bottomLeft: Radius.circular(0),
//                                   bottomRight: Radius.circular(20),
//                                   topLeft: Radius.circular(0),
//                                   topRight: Radius.circular(20)),
//                               border: Border.all(
//                                   color: _phone ? Colors.yellow : Colors.white,
//                                   width: 1,
//                                   style: BorderStyle.solid),
//                               color: Color.fromRGBO(70, 69, 69, 1),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
//                               child: TextFormField(
//                                 focusNode: _phoneFocus,
//                                 maxLength: 11,
//                                 maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                                 onChanged: (value) {
//                                   if (value.length < 12) {
//                                     setState(() {
//                                       _phone = false;
//                                       phoneNo = value;
//                                       print(countryCode + phoneNo);
//                                     });
//                                     String combinedPhoneNo = countryCode + '-' + phoneNo;
//                                     UserModel().mobileNo = combinedPhoneNo;
//                                   }
//                                 },
//                                 onFieldSubmitted: (val) {
//                                   _dobFocus.requestFocus();
//                                 },
//                                 onEditingComplete: () {
//                                   _dobFocus.requestFocus();
//                                 },
//                                 style: TextStyle(color: Colors.white),
//                                 keyboardType: TextInputType.number,
//                                 cursorColor: Colors.white,
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//                                   hintText: 'Mobile Number*',
//                                   hintStyle: TextStyle(color: Colors.white),
//                                   border: InputBorder.none,
//                                   filled: true,
//                                   counterText: "",
//                                   fillColor: Color.fromRGBO(70, 69, 69, 1),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                     borderSide: BorderSide(
//                                       color: Color.fromRGBO(70, 69, 69, 1),
//                                       width: 1,
//                                       style: BorderStyle.solid,
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Color.fromRGBO(70, 69, 69, 1),
//                                         width: 1,
//                                       ),
//                                       borderRadius: BorderRadius.all(const Radius.circular(20))),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
// //                 Focus(
// //                   autofocus: true,
// //                   focusNode: _dobFocus,
// //                   canRequestFocus: true,
// //                   child: Padding(
// //                     padding: const EdgeInsets.fromLTRB(16, 15, 16, 0),
// //                     child: GestureDetector(
// //                       child: Container(
// //                         height: 50,
// //                         decoration: BoxDecoration(
// //                             color: Color.fromRGBO(70, 69, 69, 1),
// //                             borderRadius: BorderRadius.circular(20),
// //                             border: Border.all(
// //                               color: _dob ? Colors.yellow : Colors.white,
// //                             )),
// //                         child: Padding(
// //                           padding: const EdgeInsets.fromLTRB(20, 5, 40, 5),
// //                           child: Row(
// //                             children: <Widget>[
// //                               Expanded(
// //                                 child: Container(
// //                                   alignment: Alignment.centerLeft,
// //                                   height: 50,
// //                                   child: Text(
// //                                     _valueDOB,
// //                                     style: TextStyle(color: Colors.white, fontSize: 16),
// //                                   ),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                       onTap: () {
// //                         dateTimePicker(onTap: () {
// //                           setState(() {
// //                             String formattedDate = DateFormat('yyyy-MM-dd').format(_valueinDTO);
// //                             _valueDOB = formattedDate;
// //                             _dob = false;
// //                           });
// //
// //                           UserModel().dob = _valueDOB;
// //                           Navigator.pop(context);
// //                         });
// //                       },
// //                     ),
// //                   ),
// //                 ),
// //                 Container(
// //                   child: CustomRadio(),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
// //                   child: Form(
// // //                    key: _formKey,
// //                     child: Column(
// //                       children: <Widget>[
// //                         Padding(
// //                           padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
// //                           child: Container(
// //                             height: 50,
// //                             child: TextFormField(
// //                               focusNode: _fbFocus,
// //                               onEditingComplete: () {
// //                                 _twFocus.requestFocus();
// //                               },
// //                               onChanged: (value) => UserModel().facebookHandler = value,
// //                               style: TextStyle(color: Colors.white),
// //                               cursorColor: Colors.white,
// //                               decoration: InputDecoration(
// //                                 contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
// //                                 hintText: 'Facebook Handle @Name',
// //                                 hintStyle: TextStyle(color: Colors.white),
// //                                 filled: true,
// //                                 fillColor: Color.fromRGBO(70, 69, 69, 1),
// //                                 focusedBorder: OutlineInputBorder(
// //                                   borderRadius: BorderRadius.circular(20),
// //                                   borderSide: BorderSide(
// //                                     color: Colors.white,
// //                                     width: 1,
// //                                     style: BorderStyle.solid,
// //                                   ),
// //                                 ),
// //                                 enabledBorder: OutlineInputBorder(
// //                                     borderSide: BorderSide(
// //                                       color: Colors.white,
// //                                       width: 1,
// //                                     ),
// //                                     borderRadius: BorderRadius.all(const Radius.circular(20))),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
// //                   child: Form(
// //                     child: Column(
// //                       children: <Widget>[
// //                         Padding(
// //                           padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
// //                           child: Container(
// //                             height: 50,
// //                             child: TextFormField(
// //                               focusNode: _twFocus,
// //                               onEditingComplete: () {
// //                                 _igFocus.requestFocus();
// //                               },
// //                               onChanged: (value) => UserModel().twitterHandler = value,
// //                               style: TextStyle(color: Colors.white),
// //                               cursorColor: Colors.white,
// //                               decoration: InputDecoration(
// //                                 contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
// //                                 hintText: 'Twitter Handle @Name',
// //                                 hintStyle: TextStyle(color: Colors.white),
// //                                 filled: true,
// //                                 fillColor: Color.fromRGBO(70, 69, 69, 1),
// //                                 focusedBorder: OutlineInputBorder(
// //                                   borderRadius: BorderRadius.circular(20),
// //                                   borderSide: BorderSide(
// //                                     color: Colors.white,
// //                                     width: 1,
// //                                     style: BorderStyle.solid,
// //                                   ),
// //                                 ),
// //                                 enabledBorder: OutlineInputBorder(
// //                                     borderSide: BorderSide(
// //                                       color: Colors.white,
// //                                       width: 1,
// //                                     ),
// //                                     borderRadius: BorderRadius.all(const Radius.circular(20))),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
// //                   child: Form(
// //                     child: Column(
// //                       children: <Widget>[
// //                         Padding(
// //                           padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
// //                           child: Container(
// //                             height: 50,
// //                             child: TextFormField(
// //                               focusNode: _igFocus,
// //                               onEditingComplete: () {
// //                                 _tiktokFocus.requestFocus();
// //                               },
// //                               onChanged: (value) => UserModel().instaHandler = value,
// //                               style: TextStyle(color: Colors.white),
// //                               cursorColor: Colors.white,
// //                               decoration: InputDecoration(
// //                                 contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
// //                                 hintText: 'Instagram Handle @Name',
// //                                 hintStyle: TextStyle(color: Colors.white),
// //                                 filled: true,
// //                                 fillColor: Color.fromRGBO(70, 69, 69, 1),
// //                                 focusedBorder: OutlineInputBorder(
// //                                   borderRadius: BorderRadius.circular(20),
// //                                   borderSide: BorderSide(
// //                                     color: Colors.white,
// //                                     width: 1,
// //                                     style: BorderStyle.solid,
// //                                   ),
// //                                 ),
// //                                 enabledBorder: OutlineInputBorder(
// //                                     borderSide: BorderSide(
// //                                       color: Colors.white,
// //                                       width: 1,
// //                                     ),
// //                                     borderRadius: BorderRadius.all(const Radius.circular(20))),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
// //                   child: Form(
// //                     child: Column(
// //                       children: <Widget>[
// //                         Padding(
// //                           padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
// //                           child: Container(
// //                             height: 50,
// //                             child: TextFormField(
// //                               focusNode: _tiktokFocus,
// //                               onChanged: (value) => UserModel().tiktokHandler = value,
// //                               style: TextStyle(color: Colors.white),
// //                               cursorColor: Colors.white,
// //                               decoration: InputDecoration(
// //                                 contentPadding: EdgeInsets.fromLTRB(18, 14, 18, 14),
// //                                 hintText: 'TikTok Handle @Name',
// //                                 hintStyle: TextStyle(color: Colors.white),
// //                                 filled: true,
// //                                 fillColor: Color.fromRGBO(70, 69, 69, 1),
// //                                 focusedBorder: OutlineInputBorder(
// //                                   borderRadius: BorderRadius.circular(20),
// //                                   borderSide: BorderSide(
// //                                     color: Colors.white,
// //                                     width: 1,
// //                                     style: BorderStyle.solid,
// //                                   ),
// //                                 ),
// //                                 enabledBorder: OutlineInputBorder(
// //                                     borderSide: BorderSide(
// //                                       color: Colors.white,
// //                                       width: 1,
// //                                     ),
// //                                     borderRadius: BorderRadius.all(const Radius.circular(20))),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.start,
// //                     children: <Widget>[
// //                       Container(
// //                         width: 30,
// //                         height: 30,
// //                         decoration: BoxDecoration(
// //                             color: Color.fromRGBO(70, 69, 69, 1),
// //                             borderRadius: BorderRadius.circular(8),
// //                             border: Border.all(color: Colors.white)),
// //                         child: Theme(
// //                           data: ThemeData(
// //                             unselectedWidgetColor: Color.fromRGBO(70, 69, 69, 1),
// //                           ),
// //                           child: Checkbox(
// //                               activeColor: Color.fromRGBO(70, 69, 69, 1),
// //                               checkColor: Colors.white,
// //                               value: allowVal,
// //                               onChanged: (bool value) {
// //                                 if (value == true) {
// //                                   Navigator.push(
// //                                       context,
// //                                       MaterialPageRoute(
// //                                           builder: (context) => LegalPage(
// //                                                 openFromSignUp: true,
// //                                                 agreed: (v) {
// //                                                   setState(() {
// //                                                     allowVal = v;
// //                                                   });
// //                                                   Navigator.pop(context);
// //                                                 },
// //                                               )));
// //                                 } else {
// //                                   setState(() {
// //                                     allowVal = value;
// //                                   });
// //                                 }
// //                               }),
// //                         ),
// //                       ),
// //                       Expanded(
// //                         child: Padding(
// //                           padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
// //                           child: Container(
// //                             child: GestureDetector(
// //                               onTap: () {
// //                                 if (!allowVal) {
// //                                   Navigator.push(
// //                                       context,
// //                                       MaterialPageRoute(
// //                                           builder: (context) => LegalPage(
// //                                                 openFromSignUp: true,
// //                                                 agreed: (v) {
// //                                                   setState(() {
// //                                                     allowVal = v;
// //                                                   });
// //                                                   Navigator.pop(context);
// //                                                 },
// //                                               )));
// //                                 } else {
// //                                   setState(() {
// //                                     allowVal = false;
// //                                   });
// //                                 }
// //                               },
// //                               child: Text(
// //                                 'By Signing Up you agree to our Terms,' +
// //                                     '\nPrivacy Policy and End User License Agreement',
// //                                 style: TextStyle(
// //                                   fontSize: 12,
// //                                   color: Colors.white,
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 40, 0, 60),
//                   child: Container(
//                     width: 50,
//                     height: 50,
//                     decoration: BoxDecoration(
//                         color: Color.fromRGBO(70, 69, 69, 1),
//                         borderRadius: BorderRadius.circular(30),
//                         border: Border.all(color: Colors.white)),
//                     child: IconButton(
//                       icon: Icon(Icons.arrow_forward),
//                       iconSize: 22,
//                       color: Colors.white,
//                       onPressed: () async {
//                         fieldIsNotCorrect = false;
//                         if (allowVal) {
//                           checkField();
//                           if (!fieldIsNotCorrect) {
//                             bool status = await Authentication.signInUser();
//                             print(UserModel().verifyAccountPin);
//                             status == true
//                                 ? Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => SignupWelcomePage(
//                                               fromEditProfile: false,
//                                             )),
//                                   )
//                                 : Container();
//                           } else {
//                             makeIncorrectFieldYellow();
//                             Fluttertoast.showToast(
//                                 msg: "Please Make Sure To Fill All the Fields Correctly",
//                                 gravity: ToastGravity.CENTER,
//                                 toastLength: Toast.LENGTH_LONG);
//                           }
//                         } else {
//                           Fluttertoast.showToast(
//                               msg:
//                                   "Please agree to our terms, Privacy Policy And User License Agreement",
//                               toastLength: Toast.LENGTH_LONG);
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<DropdownMenuItem<String>> dropDownMenuItems() {
//     // print(SecurityQuestionModel().questions);
//     List<DropdownMenuItem<String>> questions = [];
//     SecurityQuestionModel().questions.forEach((ques) {
//       questions.add(DropdownMenuItem(
//         value: ques.questionId.toString(),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               "${ques.questionId}.	",
//               style: TextStyle(color: Colors.white),
//             ),
//             Expanded(
//               child: Text(
//                 ques.question,
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ));
//     });
//     return questions;
//   }
//
// }
