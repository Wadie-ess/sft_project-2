// To parse this JSON data, do
//
//     final huntModel = huntModelFromJson(jsonString);

import 'dart:convert';

HuntModel huntModelFromJson(String str) => HuntModel.fromJson(json.decode(str));

String huntModelToJson(HuntModel data) => json.encode(data.toJson());

class HuntModel {
  static final HuntModel _HuntModel = HuntModel._internal();
  HuntModel({
    this.status,
    this.data,
  });
  HuntModel._internal();
  int status;
  List<Datum> data;

  factory HuntModel.fromJson(Map<String, dynamic> json) => HuntModel(
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
    this.huntNo,
    this.huntName,
    this.huntStatus,
    this.huntMode,
    this.huntCity,
    this.huntLocation,
    this.huntPurpose,
    this.huntDescription,
    this.huntContract,
    this.huntStartDate,
    this.huntEndDate,
    this.huntStartTime,
    this.huntEndTime,
    this.huntType,
    this.privateHuntMasterImage,
    this.huntPositionName,
    this.huntPositionPhoto,
    this.huntPositionPhotoApproved,
    this.privateHuntReferenceNumber,
    this.privateHuntRefNumberListExpired,
    this.privateHuntRefExpiredNo,
    this.privateHuntExpiryTime,
    this.privateHuntExpiryDate,
    this.digitalHuntAnswers,
    this.sentBackYN,
    this.huntPartnerName,
    this.noOfPlayersPerHunt,
    this.huntMap,
    this.huntInternal,
    this.saId,
    this.managerId,
    this.sentBackNo,
    this.huntReleased,
    this.huntPreReleased,
    this.huntReleaseWaiting,
    this.huntApproval,
    this.huntSupportTotalQuantity,
    this.huntComplaintsTotalQuantity,
    this.huntDeletedReason,
    this.huntPreviouslyDeleted,
    this.managerName,
    this.isChoohooContract,
    this.isDeleted,
    this.choohooContractFile,
    this.isChoohooReleased,
    this.choohoPlaces,
    this.createdAt,
    this.isDone,
    this.partners,
    this.prizes,
    this.clues,
    this.riddle,
  });

  int huntNo;
  String huntName;
  String huntStatus;
  String huntMode;
  String huntCity;
  String huntLocation;
  String huntPurpose;
  String huntDescription;
  dynamic huntContract;
  String huntStartDate;
  dynamic huntEndDate;
  String huntStartTime;
  dynamic huntEndTime;
  String huntType;
  dynamic privateHuntMasterImage;
  dynamic huntPositionName;
  String huntPositionPhoto;
  dynamic huntPositionPhotoApproved;
  dynamic privateHuntReferenceNumber;
  dynamic privateHuntRefNumberListExpired;
  dynamic privateHuntRefExpiredNo;
  dynamic privateHuntExpiryTime;
  dynamic privateHuntExpiryDate;
  dynamic digitalHuntAnswers;
  dynamic sentBackYN;
  dynamic huntPartnerName;
  dynamic noOfPlayersPerHunt;
  dynamic huntMap;
  dynamic huntInternal;
  dynamic saId;
  dynamic managerId;
  dynamic sentBackNo;
  dynamic huntReleased;
  ChoohoPlaces huntPreReleased;
  ChoohoPlaces huntReleaseWaiting;
  dynamic huntApproval;
  dynamic huntSupportTotalQuantity;
  dynamic huntComplaintsTotalQuantity;
  dynamic huntDeletedReason;
  dynamic huntPreviouslyDeleted;
  String managerName;
  int isChoohooContract;
  int isDeleted;
  String choohooContractFile;
  int isChoohooReleased;
  ChoohoPlaces choohoPlaces;
  DateTime createdAt;
  int isDone;
  List<Partner> partners;
  List<Prize> prizes;
  List<Clue> clues;
  Riddle riddle;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        huntNo: json["Hunt_No"],
        huntName: json["Hunt_Name"],
        huntStatus: json["Hunt_Status"],
        huntMode: json["Hunt_Mode"],
        huntCity: json["Hunt_City"],
        huntLocation: json["Hunt_Location"],
        huntPurpose: json["Hunt_Purpose"],
        huntDescription: json["Hunt_Description"],
        huntContract: json["Hunt_Contract"],
        huntStartDate: json["Hunt_Start_Date"],
        huntEndDate: json["Hunt_End_Date"],
        huntStartTime: json["Hunt_Start_Time"],
        huntEndTime: json["Hunt_End_Time"],
        huntType: json["Hunt_Type"],
        privateHuntMasterImage: json["Private_Hunt_Master_Image"],
        huntPositionName: json["Hunt_Position_Name"],
        huntPositionPhoto: json["Hunt_Position_Photo"],
        huntPositionPhotoApproved: json["Hunt_Position_Photo_Approved"],
        privateHuntReferenceNumber: json["Private_Hunt_Reference_Number"],
        privateHuntRefNumberListExpired:
            json["Private_Hunt_Ref_Number_List_Expired"],
        privateHuntRefExpiredNo: json["Private_Hunt_Ref_Expired_No"],
        privateHuntExpiryTime: json["Private_Hunt_Expiry_Time"],
        privateHuntExpiryDate: json["Private_Hunt_Expiry_Date"],
        digitalHuntAnswers: json["Digital_Hunt_Answers"],
        sentBackYN: json["Sent_Back(Y/N)"],
        huntPartnerName: json["Hunt_Partner_Name"],
        noOfPlayersPerHunt: json["No_Of_Players_Per_Hunt"],
        huntMap: json["Hunt_Map"],
        huntInternal: json["Hunt_Internal"],
        saId: json["SA_ID"],
        managerId: json["Manager_ID"],
        sentBackNo: json["Sent_Back_No"],
        huntReleased: json["Hunt_Released"],
        huntPreReleased: choohoPlacesValues.map[json["Hunt_PreReleased"]],
        huntReleaseWaiting: choohoPlacesValues.map[json["Hunt_ReleaseWaiting"]],
        huntApproval: json["Hunt_Approval"],
        huntSupportTotalQuantity: json["Hunt_Support_Total_Quantity"],
        huntComplaintsTotalQuantity: json["Hunt_Complaints_Total_Quantity"],
        huntDeletedReason: json["Hunt_Deleted_Reason"],
        huntPreviouslyDeleted: json["Hunt_Previously_Deleted"],
        managerName: json["Manager_Name"],
        isChoohooContract: json["is_Choohoo_Contract"] == null
            ? null
            : json["is_Choohoo_Contract"],
        isDeleted: json["is_deleted"],
        choohooContractFile: json["Choohoo_Contract_File"] == null
            ? null
            : json["Choohoo_Contract_File"],
        isChoohooReleased: json["is_Choohoo_Released"],
        choohoPlaces: choohoPlacesValues.map[json["Chooho_Places"]],
        createdAt: DateTime.parse(json["created_at"]),
        isDone: json["is_done"],
        partners: List<Partner>.from(
            json["partners"].map((x) => Partner.fromJson(x))),
        prizes: List<Prize>.from(json["prizes"].map((x) => Prize.fromJson(x))),
        clues: List<Clue>.from(json["clues"].map((x) => Clue.fromJson(x))),
        riddle: Riddle.fromJson(json["riddle"]),
      );

  Map<String, dynamic> toJson() => {
        "Hunt_No": huntNo,
        "Hunt_Name": huntName,
        "Hunt_Status": huntStatus,
        "Hunt_Mode": huntMode,
        "Hunt_City": huntCity,
        "Hunt_Location": huntLocation,
        "Hunt_Purpose": huntPurpose,
        "Hunt_Description": huntDescription,
        "Hunt_Contract": huntContract,
        "Hunt_Start_Date": huntStartDate,
        "Hunt_End_Date": huntEndDate,
        "Hunt_Start_Time": huntStartTime,
        "Hunt_End_Time": huntEndTime,
        "Hunt_Type": huntType,
        "Private_Hunt_Master_Image": privateHuntMasterImage,
        "Hunt_Position_Name": huntPositionName,
        "Hunt_Position_Photo": huntPositionPhoto,
        "Hunt_Position_Photo_Approved": huntPositionPhotoApproved,
        "Private_Hunt_Reference_Number": privateHuntReferenceNumber,
        "Private_Hunt_Ref_Number_List_Expired": privateHuntRefNumberListExpired,
        "Private_Hunt_Ref_Expired_No": privateHuntRefExpiredNo,
        "Private_Hunt_Expiry_Time": privateHuntExpiryTime,
        "Private_Hunt_Expiry_Date": privateHuntExpiryDate,
        "Digital_Hunt_Answers": digitalHuntAnswers,
        "Sent_Back(Y/N)": sentBackYN,
        "Hunt_Partner_Name": huntPartnerName,
        "No_Of_Players_Per_Hunt": noOfPlayersPerHunt,
        "Hunt_Map": huntMap,
        "Hunt_Internal": huntInternal,
        "SA_ID": saId,
        "Manager_ID": managerId,
        "Sent_Back_No": sentBackNo,
        "Hunt_Released": huntReleased,
        "Hunt_PreReleased": choohoPlacesValues.reverse[huntPreReleased],
        "Hunt_ReleaseWaiting": choohoPlacesValues.reverse[huntReleaseWaiting],
        "Hunt_Approval": huntApproval,
        "Hunt_Support_Total_Quantity": huntSupportTotalQuantity,
        "Hunt_Complaints_Total_Quantity": huntComplaintsTotalQuantity,
        "Hunt_Deleted_Reason": huntDeletedReason,
        "Hunt_Previously_Deleted": huntPreviouslyDeleted,
        "Manager_Name": managerName,
        "is_Choohoo_Contract":
            isChoohooContract == null ? null : isChoohooContract,
        "is_deleted": isDeleted,
        "Choohoo_Contract_File":
            choohooContractFile == null ? null : choohooContractFile,
        "is_Choohoo_Released": isChoohooReleased,
        "Chooho_Places": choohoPlacesValues.reverse[choohoPlaces],
        "created_at": createdAt.toIso8601String(),
        "is_done": isDone,
        "partners": List<dynamic>.from(partners.map((x) => x.toJson())),
        "prizes": List<dynamic>.from(prizes.map((x) => x.toJson())),
        "clues": List<dynamic>.from(clues.map((x) => x.toJson())),
        "riddle": riddle.toJson(),
      };
}

enum ChoohoPlaces { Y, N }

final choohoPlacesValues =
    EnumValues({"N": ChoohoPlaces.N, "Y": ChoohoPlaces.Y});

class Clue {
  Clue({
    this.clueId,
    this.clueName,
    this.clueText,
    this.clueStartTime,
    this.clueEndTime,
    this.clueVideo,
    this.cluePhoto,
    this.clueLink,
    this.clueAnswerLink,
    this.clueStartDate,
    this.clueEndDate,
    this.clueCost,
    this.gameUnitsNo,
    this.huntNo,
    this.clueAvailableYN,
    this.amountOfCluePurchasedFree,
    this.clueType,
  });

  int clueId;
  dynamic clueName;
  String clueText;
  String clueStartTime;
  dynamic clueEndTime;
  String clueVideo;
  String cluePhoto;
  String clueLink;
  dynamic clueAnswerLink;
  DateTime clueStartDate;
  dynamic clueEndDate;
  int clueCost;
  dynamic gameUnitsNo;
  int huntNo;
  dynamic clueAvailableYN;
  dynamic amountOfCluePurchasedFree;
  int clueType;

  factory Clue.fromJson(Map<String, dynamic> json) => Clue(
        clueId: json["Clue_ID"],
        clueName: json["Clue_Name"],
        clueText: json["Clue_Text"],
        clueStartTime: json["Clue_Start_Time"],
        clueEndTime: json["Clue_End_Time"],
        clueVideo: json["Clue_Video"] == null ? null : json["Clue_Video"],
        cluePhoto: json["Clue_Photo"],
        clueLink: json["Clue_Link"] == null ? null : json["Clue_Link"],
        clueAnswerLink: json["Clue_Answer_Link"],
        clueStartDate: DateTime.parse(json["Clue_Start_Date"]),
        clueEndDate: json["Clue_End_Date"],
        clueCost: json["Clue_Cost"],
        gameUnitsNo: json["Game_Units_No"],
        huntNo: json["Hunt_No"],
        clueAvailableYN: json["Clue_Available(Y/N)"],
        amountOfCluePurchasedFree: json["Amount_Of_Clue(Purchased/Free)"],
        clueType: json["Clue_Type"],
      );

  Map<String, dynamic> toJson() => {
        "Clue_ID": clueId,
        "Clue_Name": clueName,
        "Clue_Text": clueText,
        "Clue_Start_Time": clueStartTime,
        "Clue_End_Time": clueEndTime,
        "Clue_Video": clueVideo == null ? null : clueVideo,
        "Clue_Photo": cluePhoto,
        "Clue_Link": clueLink == null ? null : clueLink,
        "Clue_Answer_Link": clueAnswerLink,
        "Clue_Start_Date":
            "${clueStartDate.year.toString().padLeft(4, '0')}-${clueStartDate.month.toString().padLeft(2, '0')}-${clueStartDate.day.toString().padLeft(2, '0')}",
        "Clue_End_Date": clueEndDate,
        "Clue_Cost": clueCost,
        "Game_Units_No": gameUnitsNo,
        "Hunt_No": huntNo,
        "Clue_Available(Y/N)": clueAvailableYN,
        "Amount_Of_Clue(Purchased/Free)": amountOfCluePurchasedFree,
        "Clue_Type": clueType,
      };
}

class Partner {
  Partner({
    this.partnersId,
    this.partnersName,
    this.partnersContributionValue,
    this.pEndDate,
    this.pStartDate,
    this.numberOfHuntsPerContract,
    this.partnersContractYN,
    this.huntId,
    this.partenerType,
  });

  int partnersId;
  String partnersName;
  dynamic partnersContributionValue;
  dynamic pEndDate;
  dynamic pStartDate;
  dynamic numberOfHuntsPerContract;
  dynamic partnersContractYN;
  int huntId;
  int partenerType;

  factory Partner.fromJson(Map<String, dynamic> json) => Partner(
        partnersId: json["Partners_ID"],
        partnersName: json["Partners_Name"],
        partnersContributionValue: json["Partners_Contribution_Value"],
        pEndDate: json["P_End_Date"],
        pStartDate: json["P_Start_Date"],
        numberOfHuntsPerContract: json["Number_of_Hunts_Per_Contract"],
        partnersContractYN: json["Partners_Contract(Y/N)"],
        huntId: json["Hunt_ID"],
        partenerType: json["Partener_Type"],
      );

  Map<String, dynamic> toJson() => {
        "Partners_ID": partnersId,
        "Partners_Name": partnersName,
        "Partners_Contribution_Value": partnersContributionValue,
        "P_End_Date": pEndDate,
        "P_Start_Date": pStartDate,
        "Number_of_Hunts_Per_Contract": numberOfHuntsPerContract,
        "Partners_Contract(Y/N)": partnersContractYN,
        "Hunt_ID": huntId,
        "Partener_Type": partenerType,
      };
}

class Prize {
  Prize({
    this.prizesId,
    this.prizesInfo,
    this.prizesType,
    this.prizesImage,
    this.prizesExpiryDate,
    this.prizesPickupDate,
    this.prizesPickupYN,
    this.prizesPickUpDetails,
    this.prizesLocation,
    this.huntNo,
    this.leaderboardId,
    this.prizesPickUpPhoto,
    this.prizesAdded,
    this.prizesPickUpPhotoApprovedYN,
    this.isAllowExpiry,
  });

  int prizesId;
  String prizesInfo;
  int prizesType;
  String prizesImage;
  String prizesExpiryDate;
  dynamic prizesPickupDate;
  dynamic prizesPickupYN;
  String prizesPickUpDetails;
  PrizesLocation prizesLocation;
  int huntNo;
  dynamic leaderboardId;
  String prizesPickUpPhoto;
  ChoohoPlaces prizesAdded;
  dynamic prizesPickUpPhotoApprovedYN;
  int isAllowExpiry;

  factory Prize.fromJson(Map<String, dynamic> json) => Prize(
        prizesId: json["Prizes_ID"],
        prizesInfo: json["Prizes_Info"] == null ? null : json["Prizes_Info"],
        prizesType: json["Prizes_Type"],
        prizesImage: json["Prizes_Image"] == null ? null : json["Prizes_Image"],
        prizesExpiryDate: json["Prizes_ExpiryDate"],
        prizesPickupDate: json["Prizes_Pickup_Date"],
        prizesPickupYN: json["Prizes_Pickup(Y/N)"],
        prizesPickUpDetails: json["Prizes_PickUp_Details"] == null
            ? null
            : json["Prizes_PickUp_Details"],
        prizesLocation: prizesLocationValues.map[json["Prizes_Location"]],
        huntNo: json["Hunt_No"],
        leaderboardId: json["Leaderboard_ID"],
        prizesPickUpPhoto: json["Prizes_PickUp_Photo"] == null
            ? null
            : json["Prizes_PickUp_Photo"],
        prizesAdded: choohoPlacesValues.map[json["Prizes_Added"]],
        prizesPickUpPhotoApprovedYN: json["Prizes_PickUp_Photo_Approved(Y/N)"],
        isAllowExpiry: json["is_allow_expiry"],
      );

  Map<String, dynamic> toJson() => {
        "Prizes_ID": prizesId,
        "Prizes_Info": prizesInfo == null ? null : prizesInfo,
        "Prizes_Type": prizesType,
        "Prizes_Image": prizesImage == null ? null : prizesImage,
        "Prizes_ExpiryDate": prizesExpiryDate,
        "Prizes_Pickup_Date": prizesPickupDate,
        "Prizes_Pickup(Y/N)": prizesPickupYN,
        "Prizes_PickUp_Details":
            prizesPickUpDetails == null ? null : prizesPickUpDetails,
        "Prizes_Location": prizesLocationValues.reverse[prizesLocation],
        "Hunt_No": huntNo,
        "Leaderboard_ID": leaderboardId,
        "Prizes_PickUp_Photo":
            prizesPickUpPhoto == null ? null : prizesPickUpPhoto,
        "Prizes_Added": choohoPlacesValues.reverse[prizesAdded],
        "Prizes_PickUp_Photo_Approved(Y/N)": prizesPickUpPhotoApprovedYN,
        "is_allow_expiry": isAllowExpiry,
      };
}

enum PrizesLocation { EWEWEEWE, THE_12_NDSVBKJDSBVKSDBVS_SD_JDN_KDS_SK }

final prizesLocationValues = EnumValues({
  "eweweewe": PrizesLocation.EWEWEEWE,
  "12ndsvbkjdsbvksdbvs sd jdn kds sk":
      PrizesLocation.THE_12_NDSVBKJDSBVKSDBVS_SD_JDN_KDS_SK
});

class Riddle {
  Riddle({
    this.riddleId,
    this.riddleName,
    this.riddleText,
    this.riddleStartTime,
    this.riddleEndTime,
    this.riddleVideo,
    this.riddlePhoto,
    this.riddleLink,
    this.riddleAnswerLink,
    this.riddleStartDate,
    this.riddleEndDate,
    this.riddleCost,
    this.huntNo,
    this.gameUnitsNo,
    this.riddleAvailableYN,
    this.amountOfRiddlePurchasedFree,
  });

  int riddleId;
  dynamic riddleName;
  String riddleText;
  String riddleStartTime;
  dynamic riddleEndTime;
  String riddleVideo;
  String riddlePhoto;
  String riddleLink;
  dynamic riddleAnswerLink;
  DateTime riddleStartDate;
  dynamic riddleEndDate;
  int riddleCost;
  int huntNo;
  dynamic gameUnitsNo;
  dynamic riddleAvailableYN;
  dynamic amountOfRiddlePurchasedFree;

  factory Riddle.fromJson(Map<String, dynamic> json) => Riddle(
        riddleId: json["Riddle_ID"],
        riddleName: json["Riddle_Name"],
        riddleText: json["Riddle_Text"],
        riddleStartTime: json["Riddle_Start_Time"],
        riddleEndTime: json["Riddle_End_Time"],
        riddleVideo: json["Riddle_Video"],
        riddlePhoto: json["Riddle_Photo"],
        riddleLink: json["Riddle_Link"],
        riddleAnswerLink: json["Riddle_Answer_Link"],
        riddleStartDate: DateTime.parse(json["Riddle_Start_Date"]),
        riddleEndDate: json["Riddle_End_Date"],
        riddleCost: json["Riddle_Cost"],
        huntNo: json["Hunt_No"],
        gameUnitsNo: json["Game_Units_No"],
        riddleAvailableYN: json["Riddle_Available(Y/N)"],
        amountOfRiddlePurchasedFree: json["Amount_Of_Riddle(Purchased/Free)"],
      );

  Map<String, dynamic> toJson() => {
        "Riddle_ID": riddleId,
        "Riddle_Name": riddleName,
        "Riddle_Text": riddleText,
        "Riddle_Start_Time": riddleStartTime,
        "Riddle_End_Time": riddleEndTime,
        "Riddle_Video": riddleVideo,
        "Riddle_Photo": riddlePhoto,
        "Riddle_Link": riddleLink,
        "Riddle_Answer_Link": riddleAnswerLink,
        "Riddle_Start_Date":
            "${riddleStartDate.year.toString().padLeft(4, '0')}-${riddleStartDate.month.toString().padLeft(2, '0')}-${riddleStartDate.day.toString().padLeft(2, '0')}",
        "Riddle_End_Date": riddleEndDate,
        "Riddle_Cost": riddleCost,
        "Hunt_No": huntNo,
        "Game_Units_No": gameUnitsNo,
        "Riddle_Available(Y/N)": riddleAvailableYN,
        "Amount_Of_Riddle(Purchased/Free)": amountOfRiddlePurchasedFree,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
