// To parse this JSON data, do
//
//     final myGameUnitsQuantity = myGameUnitsQuantityFromJson(jsonString);

import 'dart:convert';

MyGameUnitsQuantity myGameUnitsQuantityFromJson(String str) {
  return MyGameUnitsQuantity.fromJson(json.decode(str));
}

String myGameUnitsQuantityToJson(MyGameUnitsQuantity data) {
  return json.encode(data.toJson());
}

class MyGameUnitsQuantity {
  static final MyGameUnitsQuantity _myGameUnitsQuantity =
      MyGameUnitsQuantity._internal();
  MyGameUnitsQuantity({
    this.status,
    this.data,
  });
  MyGameUnitsQuantity._internal();
  String status;
  List<Datum> data;

  factory MyGameUnitsQuantity.fromJson(Map<String, dynamic> json) =>
      MyGameUnitsQuantity(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.gameUnitsBatchQuantity,
  });

  String gameUnitsBatchQuantity;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        gameUnitsBatchQuantity: json["Game_Units_Batch_Quantity"],
      );

  Map<String, dynamic> toJson() => {
        "Game_Units_Batch_Quantity": gameUnitsBatchQuantity,
      };
}
