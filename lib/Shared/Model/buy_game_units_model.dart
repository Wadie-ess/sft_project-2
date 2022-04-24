// To parse this JSON data, do
//
//     final buyGameUnits = buyGameUnitsFromJson(jsonString);

import 'dart:convert';

BuyGameUnits buyGameUnitsFromJson(String str) =>
    BuyGameUnits.fromJson(json.decode(str));

String buyGameUnitsToJson(BuyGameUnits data) => json.encode(data.toJson());

class BuyGameUnits {
  static final BuyGameUnits _buyGameUnits = BuyGameUnits._internal();

  BuyGameUnits({
    this.status,
    this.paymentUrl,
  });
  BuyGameUnits._internal();
  String status;
  String paymentUrl;

  factory BuyGameUnits.fromJson(Map<String, dynamic> json) => BuyGameUnits(
        status: json["status"],
        paymentUrl: json["Payment_URL"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "Payment_URL": paymentUrl,
      };
}
