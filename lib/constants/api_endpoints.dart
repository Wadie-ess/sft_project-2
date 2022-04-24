class Endpoints {
  static const Map<String, String> headers = {'app_version': '1'};
  static const String baseUrl = "http://176.58.115.241:3000";
  static const String login = "$baseUrl/api/v1/auth/login";
  static const String signUp = "$baseUrl/api/v1/auth/register";
  static const String updateUser = "$baseUrl/api/v1/auth/update-user";
  static const String getSecurityQuestion = "$baseUrl/api/v1/security/questions";
  static const String updateSecurityQuestion = "$baseUrl/api/v1/auth/update-security-question";
  static const String resetRequest = "$baseUrl/api/v1/auth/forgot-request";
  static const String updateForgotPassword = "$baseUrl/api/v1/auth/update-forgot-password";
  static const String updatePassword = "$baseUrl/api/v1/auth/update-password";
  static const String uploadProfilePic = "$baseUrl/api/v1/auth/upload-profile";
  static const String userDetails = "$baseUrl/api/v1/auth/user-details";
  static const String verifyAccount = "$baseUrl/api/v1/auth/account-verifications";
  static const String getHunts = "$baseUrl/api/v1/hunt/find";
  static const String myGameUnitsQuantity = "$baseUrl/api/v1/game/unit/my_game_units_quantity";
  static const String myGameUnitsHistory = "$baseUrl/api/v1/game/unit/my_game_unit_history";
  static const String buyGameUnits = "$baseUrl/api/v1/game/unit/buy_game_units";
  static const String getCurrentGameUnitPrice = "$baseUrl/api/v1/game/unit/game_unit_price";
}
