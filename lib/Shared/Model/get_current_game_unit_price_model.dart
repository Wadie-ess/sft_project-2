// To parse this JSON data, do
//
//     final getCurrentGameUnitPrice = getCurrentGameUnitPriceFromJson(jsonString);

import 'dart:convert';

GetCurrentGameUnitPrice getCurrentGameUnitPriceFromJson(String str) =>
    GetCurrentGameUnitPrice.fromJson(json.decode(str));

String getCurrentGameUnitPriceToJson(GetCurrentGameUnitPrice data) =>
    json.encode(data.toJson());

class GetCurrentGameUnitPrice {
  static final GetCurrentGameUnitPrice _getCurrentGameUnitPrice =
      GetCurrentGameUnitPrice._internal();
  GetCurrentGameUnitPrice({
    this.status,
    this.data,
  });
  GetCurrentGameUnitPrice._internal();
  String status;
  Data data;

  factory GetCurrentGameUnitPrice.fromJson(Map<String, dynamic> json) =>
      GetCurrentGameUnitPrice(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data(
      {this.guSetNo,
      this.guSetExpiryDate,
      this.guSetPrice,
      this.guSetExpiryTime,
      this.guSetName,
      this.gameUnitNumber});

  int guSetNo;
  dynamic guSetExpiryDate;
  int guSetPrice;
  dynamic guSetExpiryTime;
  dynamic guSetName;
  int gameUnitNumber;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      guSetNo: json["GU_Set_No"],
      guSetExpiryDate: json["GU_Set_Expiry_Date"],
      guSetPrice: json["GU_Set_Price"],
      guSetExpiryTime: json["GU_Set_Expiry_Time"],
      guSetName: json["GU_Set_Name"],
      gameUnitNumber: json["Game_Units_No"],
    );
  }

  Map<String, dynamic> toJson() => {
        "GU_Set_No": guSetNo,
        "GU_Set_Expiry_Date": guSetExpiryDate,
        "GU_Set_Price": guSetPrice,
        "GU_Set_Expiry_Time": guSetExpiryTime,
        "GU_Set_Name": guSetName,
      };
}
