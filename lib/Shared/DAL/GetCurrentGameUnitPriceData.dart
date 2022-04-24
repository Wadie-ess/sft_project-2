import '../Model/user_model.dart';
import '../../constants/api_endpoints.dart';
import 'package:http/http.dart' as http;
import '../Model/get_current_game_unit_price_model.dart';

class GetCurrentGameUnitPriceData {
  static Future<bool> getCurrentGameUnitPriceData() async {
    bool _result = false;
    String url = "${Endpoints.getCurrentGameUnitPrice}";
    final http.Response _response = await http.post(Uri.parse(url), headers: {
      'app_version': '1',
      'authorization': 'bearer ${UserModel().token}'
    });
    if (_response.statusCode == 200) {
      print("Get Current Game Unit Price api is working");
      UserModel().getCuurentGameUnitPrice =
          getCurrentGameUnitPriceFromJson(_response.body);
      print('===========>start<===========');
      print(_response.body);
      print('===========>end<===========');

      _result = true;
    } else {
      _result = false;
    }
    return _result;
  }
}
