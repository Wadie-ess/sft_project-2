import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../constants/CTheme.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';
import '../main/main_page.dart';

class PaymentMessagePage extends StatefulWidget {
  final String url;

  const PaymentMessagePage({Key key, this.url}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return PaymentMessagePageState(url);
  }
}

class PaymentMessagePageState extends State<PaymentMessagePage> {
  final String url;
  bool isLoading = true;
  bool success = false;

  PaymentMessagePageState(this.url);

  InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: AppBarBuy(),
      body: LayoutBuilder(builder: (context, constraint) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              alignment: Alignment.center,
              children: [
                InAppWebView(
                  initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
                  onWebViewCreated: (controller) {
                    webViewController = controller;
                    setState(() {
                      isLoading = false;
                    });
                  },
                  onReceivedServerTrustAuthRequest: (controller, challenge) async {
                    return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
                  },
                  onLoadStart: (controller, uri) {
                    setState(() {
                      isLoading = true;
                    });
                  },
                  onLoadStop: (controller, uri) {
                    print(uri);
                    if (uri.toString().contains('https://choohoo.tech/choohoo/gameunit/return_url?pid')) {
                      setState(() {
                        isLoading = false;
                        success = true;
                      });
                      Future.delayed(Duration(seconds: 3), () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                      });
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
                isLoading
                    ? Container(
                        height: constraint.maxHeight,
                        color: Color.fromRGBO(70, 69, 69, 1).withOpacity(.4),
                        child: Center(
                          child: Container(
                            height: 120,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)), color: Color.fromRGBO(70, 69, 69, 1)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.white,
                                )),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Text(
                                    'Please Wait'.toUpperCase(),
                                    style: CTheme.textRegular14White(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                success
                    ? Container(
                        height: constraint.maxHeight,
                        color: Color.fromRGBO(70, 69, 69, 1).withOpacity(.4),
                        child: Center(
                          child: Container(
                            height: 120,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)), color: Color.fromRGBO(70, 69, 69, 1)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.white,
                                  size: 50,
                                )),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    'Transaction Successful'.toUpperCase(),
                                    style: CTheme.textRegular14White(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            );
          },
        );
      }),
    );
  }
}
