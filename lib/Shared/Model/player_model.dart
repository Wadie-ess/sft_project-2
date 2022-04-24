// To parse this JSON data, do
//
//     final playerModel = playerModelFromJson(jsonString);

import 'dart:convert';

PlayerModel playerModelFromJson(String str) =>
    PlayerModel.fromJson(json.decode(str));

String playerModelToJson(PlayerModel data) => json.encode(data.toJson());

class PlayerModel {
  static final PlayerModel _UserModel = PlayerModel._internal();
  PlayerModel({
    this.status,
    this.data,
  });
  PlayerModel._internal();

  String status;
  Data data;

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.choohooId,
    this.name,
    this.surName,
    this.address,
    this.city,
    this.province,
    this.country,
    this.gender,
    this.dob,
    this.email,
    this.mobileNo,
    this.photo,
    this.playerReferenceNo,
    this.playerFirstHunt,
    this.playerFirstPrivateHunt,
    this.playerProvince,
    this.playerNicknameAlias,
    this.playerParticipatedYN,
    this.playerDateLastActive,
    this.playerDateCreated,
    this.playerTimeCreated,
    this.playerTimeLastActive,
    this.playerTwiterHandle,
    this.playerFbHandle,
    this.playerInstaHandle,
    this.playerTiktokHandle,
    this.saId,
    this.playerCityTime,
    this.status,
    this.password,
    this.securityQuestionId,
    this.securityAnswer,
    this.userToken,
  });

  String choohooId;
  String name;
  String surName;
  String address;
  String city;
  String province;
  String country;
  String gender;
  DateTime dob;
  String email;
  String mobileNo;
  String photo;
  dynamic playerReferenceNo;
  dynamic playerFirstHunt;
  dynamic playerFirstPrivateHunt;
  dynamic playerProvince;
  String playerNicknameAlias;
  dynamic playerParticipatedYN;
  dynamic playerDateLastActive;
  DateTime playerDateCreated;
  String playerTimeCreated;
  dynamic playerTimeLastActive;
  String playerTwiterHandle;
  String playerFbHandle;
  String playerInstaHandle;
  String playerTiktokHandle;
  dynamic saId;
  DateTime playerCityTime;
  int status;
  String password;
  int securityQuestionId;
  String securityAnswer;
  dynamic userToken;

  factory Data.fromJson(Map<String, dynamic> json) {
    print(json['Mobile_No']);
    return Data(
      choohooId: json["Choohoo_ID"],
      name: json["Name"],
      surName: json["SurName"],
      address: json["Address"],
      city: json["City"],
      province: json["Province"],
      country: json["Country"],
      gender: json["Gender"],
      dob: DateTime.parse(json["DOB"]),
      email: json["Email"],
      mobileNo: json["Mobile_No"],
      photo: json["Photo"],
      playerReferenceNo: json["Player_Reference_No"],
      playerFirstHunt: json["Player_First_Hunt"],
      playerFirstPrivateHunt: json["Player_First_Private_Hunt"],
      playerProvince: json["Player_Province"],
      playerNicknameAlias: json["Player_Nickname_Alias"],
      playerParticipatedYN: json["Player_Participated(Y/N)"],
      playerDateLastActive: json["Player_Date_Last_Active"],
      playerDateCreated: DateTime.parse(json["Player_Date_Created"]),
      playerTimeCreated: json["Player_Time_Created"],
      playerTimeLastActive: json["Player_Time_Last_Active"],
      playerTwiterHandle: json["Player_Twiter_Handle"],
      playerFbHandle: json["Player_Fb_Handle"],
      playerInstaHandle: json["Player_Insta_Handle"],
      playerTiktokHandle: json["Player_Tiktok_Handle"],
      saId: json["SA_ID"],
      playerCityTime: DateTime.parse(json["Player_City_Time"]),
      status: json["status"],
      password: json["password"],
      securityQuestionId: json["security_question_id"],
      securityAnswer: json["security_answer"],
      userToken: json["user_token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Choohoo_ID": choohooId,
        "Name": name,
        "SurName": surName,
        "Address": address,
        "City": city,
        "Province": province,
        "Country": country,
        "Gender": gender,
        "DOB":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "Email": email,
        "Mobile_No": mobileNo,
        "Photo": photo,
        "Player_Reference_No": playerReferenceNo,
        "Player_First_Hunt": playerFirstHunt,
        "Player_First_Private_Hunt": playerFirstPrivateHunt,
        "Player_Province": playerProvince,
        "Player_Nickname_Alias": playerNicknameAlias,
        "Player_Participated(Y/N)": playerParticipatedYN,
        "Player_Date_Last_Active": playerDateLastActive,
        "Player_Date_Created":
            "${playerDateCreated.year.toString().padLeft(4, '0')}-${playerDateCreated.month.toString().padLeft(2, '0')}-${playerDateCreated.day.toString().padLeft(2, '0')}",
        "Player_Time_Created": playerTimeCreated,
        "Player_Time_Last_Active": playerTimeLastActive,
        "Player_Twiter_Handle": playerTwiterHandle,
        "Player_Fb_Handle": playerFbHandle,
        "Player_Insta_Handle": playerInstaHandle,
        "Player_Tiktok_Handle": playerTiktokHandle,
        "SA_ID": saId,
        "Player_City_Time": playerCityTime.toIso8601String(),
        "status": status,
        "password": password,
        "security_question_id": securityQuestionId,
        "security_answer": securityAnswer,
        "user_token": userToken,
      };
}
