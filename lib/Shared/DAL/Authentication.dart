import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Helper/Helper.dart';
import '../../constants/api_endpoints.dart';
import '../Model/security_question_model.dart';
import '../Model/user_model.dart';

enum LoginStatus {
  login,
  notVerified,
  wrongInfo,
  none,
}

class Authentication {
  static Future<LoginStatus> loginUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    LoginStatus _result = LoginStatus.none;
    String url = "${Endpoints.login}?email=${UserModel().email}&password=${UserModel().password}";
    final http.Response _response = await http.post(Uri.parse(url), headers: Endpoints.headers);
    if (_response.statusCode == 200) {
      final _data = jsonDecode(_response.body);
      print("Login Message:" + _data['message']);
      print(_data);
      if (_data['statas'] == 201) {
        Helper.printLog(_data["message"]);
        UserModel().token = _data['token'];
        _prefs.setString("token", _data['token']);
        if (UserModel().token != null || UserModel().token != "") _result = LoginStatus.login;
      } else {
        if (_data["message"] ==
            'Your account is not verified. Please follow the instructions at email.') {
          _result = LoginStatus.notVerified;
        } else {
          _result = LoginStatus.wrongInfo;
        }
      }
    } else {
      final _data = jsonDecode(_response.body);
      print(_data['message']);
    }
    return _result;
  }

  static Future<bool> signUpUser() async {
    bool _result = false;
    String url =
        "${Endpoints.signUp}?name=${UserModel().name}&email=${UserModel().email}&surname=${UserModel().surname}&address=${UserModel().address}&city=${UserModel().city}&province=${UserModel().province}&country=${UserModel().country}&gender=${UserModel().gender ?? 'Non-Binary'}&dob=${UserModel().dob}&password=${UserModel().password}&mobile_no=${UserModel().mobileNo}&nickname=${UserModel().nickName}&twitter_handler=${UserModel().twitterHandler}&facebook_handler=${UserModel().facebookHandler}&insta_handler=${UserModel().instaHandler}&tiktok_handler=${UserModel().tiktokHandler}&security_question_id=${UserModel().securityuestionID}&security_answer=${UserModel().securityAnswer}";
    print(url);
    final http.Response _response = await http.post(Uri.parse(url), headers: Endpoints.headers);
    if (_response.statusCode == 200) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      final _data = jsonDecode(_response.body);
      print(_data["message"]);
      if (_data["statas"] == 201) {
        Helper.printLog(_data["message"]);
        UserModel().token = _data["token"];
        _prefs.setString("token", _data['token']);

        UserModel().verifyAccountPin = _data["pin"];
        print(UserModel().verifyAccountPin);
        print(UserModel().token);
        if (UserModel().token != null || UserModel().token != "") {
          _result = true;
          Fluttertoast.showToast(msg: _data['message'], toastLength: Toast.LENGTH_SHORT);
        }
      } else if (_data["statas"] == 204) {
        _result = false;
        Fluttertoast.showToast(msg: _data['message'], toastLength: Toast.LENGTH_SHORT);
      }
    } else {
      final _data = jsonDecode(_response.body);
      Helper.printLog(_data["message"]);
    }
    return _result;
  }

  static Future<bool> verifyAccount(String pin) async {
    bool _result = false;
    String url = "${Endpoints.verifyAccount}?email=${UserModel().email}&pin=$pin";
    final http.Response _response = await http.post(Uri.parse(url), headers: Endpoints.headers);
    if (_response.statusCode == 200) {
      final _data = jsonDecode(_response.body);
      if (_data['status'] == 201) {
        _result = true;
        Fluttertoast.showToast(msg: _data["message"], toastLength: Toast.LENGTH_SHORT);
        Helper.printLog(_data["message"]);
      } else if (_data['status'] == 204) {
        _result = false;
        Fluttertoast.showToast(msg: _data["message"], toastLength: Toast.LENGTH_SHORT);
      }
    } else {
      final _data = jsonDecode(_response.body);
      Helper.printLog(_data["message"]);
    }
    return _result;
  }

  static Future<bool> updateUser() async {
    bool _result = false;
    String url =
        "${Endpoints.updateUser}?name=${UserModel().name}&email=${UserModel().email}&surname=${UserModel().surname}&address=${UserModel().address}&city=${UserModel().city}&province=${UserModel().province}&country=${UserModel().country}&gender=${UserModel().gender}&dob=${UserModel().dob}&mobile_no=${UserModel().mobileNo}&nickname=${UserModel().nickName}&twitter_handler=${UserModel().twitterHandler}&facebook_handler=${UserModel().facebookHandler}&insta_handler=${UserModel().instaHandler}&tiktok_handler=${UserModel().tiktokHandler}";
    print(url);
    String token = UserModel().token;
    final http.Response _response = await http.post(
        Uri.parse(url),
      headers: {'app_version': '1', 'authorization': 'bearer $token'},
    );
    if (_response.statusCode == 200) {
      final _data = jsonDecode(_response.body);
      print(_data["message"] + '+++++++++++++++++++++');
      if (_data["status"] == "201") {
        print("This if is working");
        if (UserModel().token != null || UserModel().token != "") {
          _result = true;
          Fluttertoast.showToast(msg: _data['message'], toastLength: Toast.LENGTH_SHORT);
        }
      } else if (_data["status"] == "204") {
        _result = false;
        Fluttertoast.showToast(msg: _data['message'], toastLength: Toast.LENGTH_SHORT);
      }
    } else {
      final _data = jsonDecode(_response.body);
      Helper.printLog(_data["message"]);
    }
    return _result;
  }

  static Future<bool> resetRequest() async {
    String url = "${Endpoints.resetRequest}?email=${UserModel().email}";
    final http.Response _response = await http.post(Uri.parse(url), headers: {'app_version': '1'});
    if (_response.statusCode == 200) {
      final _data = jsonDecode(_response.body);
      if (_data["status"] == 200) {
        Helper.printLog(_data["message"]);
        UserModel().forgetPin = _data["pin"];
        Fluttertoast.showToast(msg: _data['message'], toastLength: Toast.LENGTH_SHORT);
        return _data["pin"] == null ? false : true;
      } else if (_data['status'] == 204) {
        Fluttertoast.showToast(msg: _data['message']);
        Helper.printLog(_data['message']);
        return false;
      }
    } else {
      Helper.printLog("System Error.");
      Fluttertoast.showToast(msg: "System Error. Please comeback later");
      return false;
    }
  }

  static Future<bool> updateForgotPassword(String email, String password, String token) async {
    bool _result = false;
    String url = "${Endpoints.updateForgotPassword}?email=$email&password=$password&pin=$token";
    final http.Response _response = await http.post(Uri.parse(url), headers: Endpoints.headers);
    if (_response.statusCode == 200) {
      final _data = jsonDecode(_response.body);
      print(_data);

      if (_data['status'] == 201) {
        _result = true;
        Fluttertoast.showToast(msg: _data["message"], toastLength: Toast.LENGTH_SHORT);
        Helper.printLog(_data["message"]);
      } else if (_data['status'] == 204) {
        _result = false;

        Fluttertoast.showToast(msg: _data["message"], toastLength: Toast.LENGTH_SHORT);
      }
    } else {
      final _data = jsonDecode(_response.body);
      Helper.printLog(_data["message"]);
    }
    return _result;
  }

  static Future<void> getAllSecurityQuestion() async {
    String url = "${Endpoints.getSecurityQuestion}";
    final http.Response _response = await http.post(
        Uri.parse(url),
      headers: {'app_version': '1'},
    );
    if (_response.statusCode == 200) {
      final _data = jsonDecode(_response.body);
      print('get question api is called');
      print(_response.body);
      if (_data['status'] == 201) {
        SecurityQuestionModel().fromJson(jsonDecode(_response.body));
      }
    } else {
      final _data = jsonDecode(_response.body);
      Helper.printLog(_data["message"]);
    }
  }

  static Future<bool> updateSecurityQuestion(
      String email, String questionID, String answer, String token) async {
    bool _result = false;
    String url =
        "${Endpoints.updateSecurityQuestion}?email=$email&token=$token&question_id=$questionID&answer=$answer";
    print(url);
    final http.Response _response = await http.post(
        Uri.parse(url),
      headers: {'app_version': '1', 'authorization': 'bearer ${UserModel().token}'},
    );
    if (_response.statusCode == 200) {
      final _data = jsonDecode(_response.body);
      print(_data);

      if (_data['status'] == 201) {
        _result = true;
        Fluttertoast.showToast(msg: _data["message"], toastLength: Toast.LENGTH_SHORT);
        Helper.printLog(_data["message"]);
      } else if (_data['status'] == 204) {
        _result = false;

        Fluttertoast.showToast(msg: _data["message"], toastLength: Toast.LENGTH_SHORT);
      }
    } else {
      final _data = jsonDecode(_response.body);
      Helper.printLog(_data["message"]);
    }
    return _result;
  }

  static Future<bool> updatePassword(String email, String password, String token) async {
    bool _result = false;
    String url = "${Endpoints.updatePassword}?email=$email&password=$password&pin=$token";
    final http.Response _response = await http.post(
        Uri.parse(url),
      headers: {'app_version': '1', 'authorization': 'bearer ${UserModel().token}'},
    );
    if (_response.statusCode == 200) {
      final _data = jsonDecode(_response.body);
      print(_data);

      if (_data['status'] == 201) {
        _result = true;
        Fluttertoast.showToast(msg: _data["message"], toastLength: Toast.LENGTH_SHORT);
        Helper.printLog(_data["message"]);
      } else if (_data['status'] == 204) {
        _result = false;

        Fluttertoast.showToast(msg: _data["message"], toastLength: Toast.LENGTH_SHORT);
      }
    } else {
      final _data = jsonDecode(_response.body);
      Helper.printLog(_data["message"]);
    }
    return _result;
  }

  static Future<bool> uploadProfilePic(File file) async {
    bool _result = false;
    final _fileName = DateTime.now().microsecondsSinceEpoch.toString();
    Map<String, String> header = {
      'Authorization': 'Bearer ${UserModel().token}',
      'app_version': '1',
      'Content-Type': 'multipart/form-data'
    };
    final url = "${Endpoints.uploadProfilePic}";
    final _request = http.MultipartRequest("POST", Uri.parse(url));
    _request.headers.addAll(header);
    print(_fileName + '.${file.path.split('.').last}');
    _request.files.add(
      http.MultipartFile.fromBytes(
        'files',
        await File.fromUri(Uri.parse(file.path)).readAsBytes(),
        filename: _fileName + '.${file.path.split('.').last}',
        contentType: MediaType('image', 'jpg/jpeg'),
      ),
    );
    http.StreamedResponse uploadValue;
    try {
      uploadValue = await _request.send();
    } catch (e) {
      print(e);
      print('============================');
      return _result;
    }

    if (uploadValue.statusCode == 200) {
      print(_request.files);
      print(_request.fields);
      print(_request.headers);
      var responseData = await uploadValue.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print(responseString);
      // uploadValue.stream.listen((value) {
      //   print("UPLOADED ${value.length}/${uploadValue.contentLength}");
      // }, onDone: () {
      //   Helper.printLog("PROFILE PICTURE UPLOADED");
      //   // return _result;
      // });
      // _result = true;
    }
    return _result;
  }
}
