
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/api_endpoints.dart';
import '../Model/player_model.dart';
import '../Model/user_model.dart';

class PlayerData {
  static Future<bool> getUserData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool _result = false;
    String url = "${Endpoints.userDetails}";
    if (UserModel().token == null || UserModel().token == "") {
      UserModel().token = _prefs.getString("token");
    }
    final http.Response _response = await http.post(Uri.parse(url), headers: {
      'app_version': '1',
      'authorization': 'bearer ${UserModel().token}'
    });
    if (_response.statusCode == 200) {
      print("User Details api is working");
      print(_response.body);
      UserModel().playerModel = playerModelFromJson(_response.body);
      print(UserModel().playerModel.data.address);
      _result = true;
    } else {
      _result = false;
    }
    return _result;
  }
}
