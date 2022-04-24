import 'package:http/http.dart' as http;

import '../../constants/api_endpoints.dart';
import '../Model/my_game_units_quantity_model.dart';
import '../Model/user_model.dart';

class MyGameUnitsQuantityData {
  static Future<bool> myGameUnitsQuantity() async {
    bool _result = false;
    String url = "${Endpoints.myGameUnitsQuantity}";
    final http.Response _response = await http
        .post(Uri.parse(url), headers: {'app_version': '1', 'authorization': 'bearer ${UserModel().token}'});
    if (_response.statusCode == 200) {
      print("My Game Units Quantity api is working");
      UserModel().myGameUnitsQuantity = myGameUnitsQuantityFromJson(_response.body);
      print(_response.body);
      _result = true;
    } else {
      _result = false;
    }
    return _result;
  }
}
