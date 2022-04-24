import 'buy_game_units_model.dart';
import 'get_current_game_unit_price_model.dart';
import 'hunt_model.dart';
import 'my_game_units_history_model.dart';
import 'my_game_units_quantity_model.dart';
import 'player_model.dart';

class UserModel {
  static final UserModel _UserModel = UserModel._internal();

  factory UserModel() {
    return _UserModel;
  }

  UserModel._internal();
  String verifyAccountPin;
  String token;
  String forgetPin;
  String email;
  String password;
  String name;
  String surname;
  String address;
  String city;
  String province;
  String country;
  String gender;
  String dob;

  var lat;
  var long;
  String mobileNo;
  String nickName;
  String twitterHandler;
  String facebookHandler;
  String instaHandler;
  String tiktokHandler;
  String securityuestionID;
  String securityAnswer;

  PlayerModel playerModel;

  HuntModel huntModel;

  BuyGameUnits buyGameUnits;
  GetCurrentGameUnitPrice getCuurentGameUnitPrice;
  MyGameUnitsHistory myGameUnitsHistory;
  MyGameUnitsQuantity myGameUnitsQuantity;

  // @override
  // String toString() =>
  //     'UserModel(token: $token, email: $email, password: $password)';

}
