import 'package:http/http.dart' as http;

import '../../constants/api_endpoints.dart';
import '../Model/hunt_model.dart';
import '../Model/user_model.dart';

class GetHunts {
  static Future<bool> getHuntsData(String huntType) async {
    bool _result = false;
    String url = "${Endpoints.getHunts}?hunt_type=$huntType";
    final http.Response _response = await http.post(Uri.parse(url), headers: {
      'app_version': '1',
      'authorization': 'bearer ${UserModel().token}'
    });
    if (_response.statusCode == 200) {
      print("Get Hunts Api is working");
      UserModel().huntModel = huntModelFromJson(_response.body);

      // UserModel().huntModel.data.every((element) {
      //   print("This is the city of the hunts" + element.prizes.toString());
      // });
      print("Length of the list is: " +
          UserModel().huntModel.data.length.toString());
      _result = true;
    } else {
      _result = false;
    }
    return _result;
  }
}
