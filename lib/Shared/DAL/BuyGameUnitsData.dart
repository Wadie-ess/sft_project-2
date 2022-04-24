import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/api_endpoints.dart';
import '../Model/buy_game_units_model.dart';
import '../Model/user_model.dart';
import 'Authentication.dart';

class BuyGameUnitsData {
  static Future<bool> buyGameUnitsData() async {
    bool _result = false;
    String apiUrl = "${Endpoints.buyGameUnits}";
    final http.Response _response = await http.post(Uri.parse(apiUrl),
        headers: {'app_version': '1', 'authorization': 'bearer ${UserModel().token}'});
    if (_response.statusCode == 200) {
      print("Get Current Game Unit Price api is working");
      if (int.parse(jsonDecode(_response.body)['status']) == 204) {
        print('relogin needed');
        await Authentication.loginUser();
        return await buyGameUnitsData();
      } else {
        UserModel().buyGameUnits = buyGameUnitsFromJson(_response.body);
        print(_response.body);
        _result = true;
      }
    } else {
      _result = false;
    }
    return _result;
  }
}
