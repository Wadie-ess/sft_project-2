import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../Shared/Model/user_model.dart';
import '../../utils/CustomDrawer.dart';

class PrizeDetailPage extends StatefulWidget {
  final indexClicked;

  const PrizeDetailPage({Key key, this.indexClicked}) : super(key: key);
  @override
  _PrizeDetailPage createState() => _PrizeDetailPage();
}

class _PrizeDetailPage extends State<PrizeDetailPage> {
  bool allowVal = false;
  bool blockVal = true;
  bool wedVal = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                  child: Container(
                    height: 50,
                    child: Stack(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Text("PRIZES",
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Color.fromRGBO(180, 179, 180, 1),
                                    fontSize: 16,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 164,
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                            color: Colors.white,
                          ),
                          height: 40,
                          width: 345,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                            child: Text(
                              "Prize 1: ${UserModel().huntModel.data[widget.indexClicked].prizes[0].prizesInfo}",
                              style: TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                        Container(
                          height: 121,
                          width: 345,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(19), bottomRight: Radius.circular(19)),
                            color: Colors.grey,
                            image: DecorationImage(
                              image: AssetImage('assets/splash/chohoo_img.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    "Or",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  shrinkWrap: true,
                  itemCount: UserModel().huntModel.data[widget.indexClicked].prizes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return index > 0
                        ? Padding(
                            padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 1, style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              height: 164,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                      color: Colors.white,
                                    ),
                                    height: 40,
                                    width: 345,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                                      child: Text(
                                        "Prize ${index + 1}: ${UserModel().huntModel.data[widget.indexClicked].prizes[index].prizesInfo}",
                                        style: TextStyle(color: Colors.black, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 121,
                                    width: 345,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(19), bottomRight: Radius.circular(19)),
                                      color: Colors.grey,
                                      image: DecorationImage(
                                        image: UserModel().huntModel.data[widget.indexClicked].prizes[index].prizesPickUpPhoto == null
                                            ? AssetImage('assets/splash/chohoo_img.png')
                                            : NetworkImage(
                                                "https://104.237.143.214/choohoo/${UserModel().huntModel.data[widget.indexClicked].prizes[index].prizesPickUpPhoto}"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container();
                  },
                ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       border: Border.all(
                //           color: Colors.white,
                //           width: 1,
                //           style: BorderStyle.solid),
                //       borderRadius: BorderRadius.circular(20),
                //       color: Colors.white,
                //     ),
                //     height: 164,
                //     child: Column(
                //       children: <Widget>[
                //         Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(20),
                //                 topRight: Radius.circular(20)),
                //             color: Colors.white,
                //           ),
                //           height: 40,
                //           width: 345,
                //           child: Padding(
                //             padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                //             child: Text(
                //               "2nd Prize: Prize Name",
                //               style:
                //                   TextStyle(color: Colors.black, fontSize: 16),
                //             ),
                //           ),
                //         ),
                //         Container(
                //           height: 121,
                //           width: 345,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.only(
                //                 bottomLeft: Radius.circular(19),
                //                 bottomRight: Radius.circular(19)),
                //             color: Colors.grey,
                //             image: DecorationImage(
                //               image: AssetImage('assets/splash/chohoo_img.png'),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
