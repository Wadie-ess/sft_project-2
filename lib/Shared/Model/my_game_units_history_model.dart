// To parse this JSON data, do
//
//     final myGameUnitsHistory = myGameUnitsHistoryFromJson(jsonString);

import 'dart:convert';

MyGameUnitsHistory myGameUnitsHistoryFromJson(String str) =>
    MyGameUnitsHistory.fromJson(json.decode(str));

String myGameUnitsHistoryToJson(MyGameUnitsHistory data) =>
    json.encode(data.toJson());

class MyGameUnitsHistory {
  static final MyGameUnitsHistory _myGameUnitsHistory =
      MyGameUnitsHistory._internal();
  MyGameUnitsHistory({
    this.status,
    this.data,
  });
  MyGameUnitsHistory._internal();
  String status;
  List<Datum> data;

  factory MyGameUnitsHistory.fromJson(Map<String, dynamic> json) =>
      MyGameUnitsHistory(
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
    this.gameUnitsNo,
    this.gameUnitsQuantity,
    this.gameUnitsExpiryDate,
    this.gameUnitsExpiryTime,
    this.gameUnitsDateSold,
    this.gameUnitsActivatedYN,
    this.gameUnitsTimeSold,
    this.gameUnitsBatchPrice,
    this.salesDate,
    this.salesTime,
    this.resellerId,
    this.salesChannelId,
    this.guSetNo,
    this.orderNo,
    this.transactionsDetailNo,
    this.gameUnitsBatchQuantity,
    this.gameUnitsType,
    this.gameUnitsLoadedDate,
    this.gameUnitsLoadedTime,
    this.gameUnitsUsed,
    this.gameUnitsUsedTime,
    this.gameUnitsUsedDate,
    this.printAndPackageYN,
    this.salesLinkYN,
    this.salesCashYN,
    this.status,
  });

  int gameUnitsNo;
  int gameUnitsQuantity;
  DateTime gameUnitsExpiryDate;
  DateTime gameUnitsExpiryTime;
  dynamic gameUnitsDateSold;
  String gameUnitsActivatedYN;
  dynamic gameUnitsTimeSold;
  dynamic gameUnitsBatchPrice;
  dynamic salesDate;
  dynamic salesTime;
  dynamic resellerId;
  dynamic salesChannelId;
  dynamic guSetNo;
  dynamic orderNo;
  String transactionsDetailNo;
  int gameUnitsBatchQuantity;
  dynamic gameUnitsType;
  dynamic gameUnitsLoadedDate;
  dynamic gameUnitsLoadedTime;
  dynamic gameUnitsUsed;
  dynamic gameUnitsUsedTime;
  dynamic gameUnitsUsedDate;
  dynamic printAndPackageYN;
  dynamic salesLinkYN;
  dynamic salesCashYN;
  String status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        gameUnitsNo: json["Game_Units_No"],
        gameUnitsQuantity: json["Game_Units_Quantity"],
        gameUnitsExpiryDate: DateTime.parse(json["Game_Units_Expiry_Date"]),
        gameUnitsExpiryTime: DateTime.parse(json["Game_Units_Expiry_Time"]),
        gameUnitsDateSold: json["Game_Units_Date_Sold"],
        gameUnitsActivatedYN: json["Game_Units_Activated_Y_N"],
        gameUnitsTimeSold: json["Game_Units_Time_Sold"],
        gameUnitsBatchPrice: json["Game_Units_Batch_Price"],
        salesDate: json["Sales_Date"],
        salesTime: json["Sales_Time"],
        resellerId: json["Reseller_ID"],
        salesChannelId: json["Sales_Channel_ID"],
        guSetNo: json["GU_Set_No"],
        orderNo: json["Order_No"],
        transactionsDetailNo: json["Transactions_Detail_No"],
        gameUnitsBatchQuantity: json["Game_Units_Batch_Quantity"],
        gameUnitsType: json["Game_Units_Type"],
        gameUnitsLoadedDate: json["Game_Units_Loaded_Date"],
        gameUnitsLoadedTime: json["Game_Units_Loaded_Time"],
        gameUnitsUsed: json["Game_Units_Used"],
        gameUnitsUsedTime: json["Game_Units_Used_Time"],
        gameUnitsUsedDate: json["Game_Units_Used_Date"],
        printAndPackageYN: json["Print_And_Package_Y_N"],
        salesLinkYN: json["Sales_Link_Y_N"],
        salesCashYN: json["Sales_Cash_Y_N"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Game_Units_No": gameUnitsNo,
        "Game_Units_Quantity": gameUnitsQuantity,
        "Game_Units_Expiry_Date":
            "${gameUnitsExpiryDate.year.toString().padLeft(4, '0')}-${gameUnitsExpiryDate.month.toString().padLeft(2, '0')}-${gameUnitsExpiryDate.day.toString().padLeft(2, '0')}",
        "Game_Units_Expiry_Time": gameUnitsExpiryTime.toIso8601String(),
        "Game_Units_Date_Sold": gameUnitsDateSold,
        "Game_Units_Activated_Y_N": gameUnitsActivatedYN,
        "Game_Units_Time_Sold": gameUnitsTimeSold,
        "Game_Units_Batch_Price": gameUnitsBatchPrice,
        "Sales_Date": salesDate,
        "Sales_Time": salesTime,
        "Reseller_ID": resellerId,
        "Sales_Channel_ID": salesChannelId,
        "GU_Set_No": guSetNo,
        "Order_No": orderNo,
        "Transactions_Detail_No": transactionsDetailNo,
        "Game_Units_Batch_Quantity": gameUnitsBatchQuantity,
        "Game_Units_Type": gameUnitsType,
        "Game_Units_Loaded_Date": gameUnitsLoadedDate,
        "Game_Units_Loaded_Time": gameUnitsLoadedTime,
        "Game_Units_Used": gameUnitsUsed,
        "Game_Units_Used_Time": gameUnitsUsedTime,
        "Game_Units_Used_Date": gameUnitsUsedDate,
        "Print_And_Package_Y_N": printAndPackageYN,
        "Sales_Link_Y_N": salesLinkYN,
        "Sales_Cash_Y_N": salesCashYN,
        "Status": status,
      };
}
