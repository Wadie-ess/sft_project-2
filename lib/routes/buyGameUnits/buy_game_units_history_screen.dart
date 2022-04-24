// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../Shared/Model/user_model.dart';
import '../../constants/CTheme.dart';
import '../../utils/AppBarBuy.dart';

class BuyGameUnitsHistoryScreen extends StatefulWidget {
  @override
  _BuyGameUnitsHistoryScreenState createState() => _BuyGameUnitsHistoryScreenState();
}

class _BuyGameUnitsHistoryScreenState extends State<BuyGameUnitsHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarBuy(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                AutoSizeText(
                  "Game Units History".toUpperCase(),
                  style: CTheme.textRegular16Black(),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 2,
                  color: Colors.black,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: UserModel().myGameUnitsHistory.data.length,
                        itemBuilder: (context, index) {
                          return HistoryData(
                            record_no: index + 1,
                            game_Units_No: UserModel().myGameUnitsHistory.data[index].gameUnitsNo.toString(),
                            game_Units_Quantity: UserModel().myGameUnitsHistory.data[index].gameUnitsQuantity.toString(),
                            game_Units_Expiry_Date: UserModel().myGameUnitsHistory.data[index].gameUnitsExpiryDate.toString(),
                            game_Units_Expiry_Time: UserModel().myGameUnitsHistory.data[index].gameUnitsExpiryTime.toString(),
                            game_Units_Date_Sold: UserModel().myGameUnitsHistory.data[index].gameUnitsDateSold.toString(),
                            game_Units_Activated_Y_N: UserModel().myGameUnitsHistory.data[index].gameUnitsActivatedYN.toString(),
                            game_Units_Time_Sold: UserModel().myGameUnitsHistory.data[index].gameUnitsTimeSold.toString(),
                            game_Units_Batch_Price: UserModel().myGameUnitsHistory.data[index].gameUnitsBatchPrice.toString(),
                            sales_Date: UserModel().myGameUnitsHistory.data[index].salesDate.toString(),
                            sales_Time: UserModel().myGameUnitsHistory.data[index].salesTime.toString(),
                            reseller_ID: UserModel().myGameUnitsHistory.data[index].resellerId.toString(),
                            sales_Channel_ID: UserModel().myGameUnitsHistory.data[index].salesChannelId.toString(),
                            gU_Set_No: UserModel().myGameUnitsHistory.data[index].guSetNo.toString(),
                            order_No: UserModel().myGameUnitsHistory.data[index].orderNo.toString(),
                            transactions_Detail_No: UserModel().myGameUnitsHistory.data[index].transactionsDetailNo.toString(),
                            game_Units_Batch_Quantity: UserModel().myGameUnitsHistory.data[index].gameUnitsBatchQuantity.toString(),
                            game_Units_Type: UserModel().myGameUnitsHistory.data[index].gameUnitsType.toString(),
                            game_Units_Loaded_Date: UserModel().myGameUnitsHistory.data[index].gameUnitsLoadedDate.toString(),
                            game_Units_Loaded_Time: UserModel().myGameUnitsHistory.data[index].gameUnitsLoadedTime.toString(),
                            game_Units_Used: UserModel().myGameUnitsHistory.data[index].gameUnitsUsed.toString(),
                            game_Units_Used_Time: UserModel().myGameUnitsHistory.data[index].gameUnitsUsedTime.toString(),
                            game_Units_Used_Date: UserModel().myGameUnitsHistory.data[index].gameUnitsUsedDate.toString(),
                            print_And_Package_Y_N: UserModel().myGameUnitsHistory.data[index].printAndPackageYN.toString(),
                            sales_Link_Y_N: UserModel().myGameUnitsHistory.data[index].salesLinkYN.toString(),
                            sales_Cash_Y_N: UserModel().myGameUnitsHistory.data[index].salesCashYN.toString(),
                            status: UserModel().myGameUnitsHistory.data[index].status.toString(),
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HistoryData extends StatelessWidget {
  final int record_no;
  final String game_Units_No;
  final String game_Units_Quantity;
  final String game_Units_Expiry_Date;
  final String game_Units_Expiry_Time;
  final String game_Units_Date_Sold;
  final String game_Units_Activated_Y_N;
  final String game_Units_Time_Sold;
  final String game_Units_Batch_Price;
  final String sales_Date;
  final String sales_Time;
  final String reseller_ID;
  final String sales_Channel_ID;
  final String gU_Set_No;
  final String order_No;
  final String transactions_Detail_No;
  final String game_Units_Batch_Quantity;
  final String game_Units_Type;
  final String game_Units_Loaded_Date;
  final String game_Units_Loaded_Time;
  final String game_Units_Used;
  final String game_Units_Used_Time;
  final String game_Units_Used_Date;
  final String print_And_Package_Y_N;
  final String sales_Link_Y_N;
  final String sales_Cash_Y_N;
  final String status;

  const HistoryData({
    Key key,
    this.game_Units_No,
    this.game_Units_Quantity,
    this.game_Units_Expiry_Date,
    this.game_Units_Expiry_Time,
    this.game_Units_Date_Sold,
    this.game_Units_Activated_Y_N,
    this.game_Units_Time_Sold,
    this.game_Units_Batch_Price,
    this.sales_Date,
    this.sales_Time,
    this.reseller_ID,
    this.sales_Channel_ID,
    this.gU_Set_No,
    this.order_No,
    this.transactions_Detail_No,
    this.game_Units_Batch_Quantity,
    this.game_Units_Type,
    this.game_Units_Loaded_Date,
    this.game_Units_Loaded_Time,
    this.game_Units_Used,
    this.game_Units_Used_Time,
    this.game_Units_Used_Date,
    this.print_And_Package_Y_N,
    this.sales_Link_Y_N,
    this.sales_Cash_Y_N,
    this.status,
    this.record_no,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Record No: ${record_no.toString()}",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(70, 69, 69, 1),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game_Units_No: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${game_Units_No.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game_Units_Quantity: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${game_Units_Quantity.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game_Units_Expiry_Date: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${game_Units_Expiry_Date.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game_Units_Expiry_Time: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${game_Units_Expiry_Time.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game_Units_Date_Sold: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${game_Units_Date_Sold.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game_Units_Activated Y/N: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${game_Units_Activated_Y_N.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game_Units_Time_Sold: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${game_Units_Time_Sold.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game_Units_Batch_Price: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${game_Units_Batch_Price.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sales_Date: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${sales_Date.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sales_Time: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${sales_Time.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reseller_ID: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${reseller_ID.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sales_Channel_ID: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${sales_Channel_ID.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'GU_Set_No: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${gU_Set_No.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Order_No: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${order_No.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Transactions_Detail_No: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${transactions_Detail_No.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game_Units_Batch_Quantity: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${game_Units_Batch_Quantity.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game_Units_Type: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${game_Units_Type.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game_Units_Loaded_Date: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${game_Units_Loaded_Date.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game_Units_Loaded_Time: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${game_Units_Loaded_Time.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game_Units_Used: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${game_Units_Used.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game_Units_Used_Time: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${game_Units_Used_Time.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game_Units_Used_Date: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${game_Units_Used_Date.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Print_And_Package Y/N: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${print_And_Package_Y_N.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sales_Link Y/N: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${sales_Link_Y_N.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sales_Cash Y/N: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${sales_Cash_Y_N.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Status: ',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
            Text(
              '${status.toString()}',
              style: TextStyle(
                color: Color.fromRGBO(70, 69, 69, 1),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 2,
          color: Colors.black,
        ),
      ],
    );
  }
}
