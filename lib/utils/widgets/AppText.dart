import 'package:flutter/material.dart';

import '../../constants/CColors.dart';
import '../../routes/main/sft_full_screen.dart';
import '../CustomBottomBar.dart';
import '../app_utils.dart';

class AppText extends StatelessWidget {
  final String text;
  final bool isBold;

  const AppText({Key key, this.text, this.isBold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.w700 : FontWeight.w300,
          fontSize: 14,
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  final String text;
  final bool shareButton;
  final double aspectRatio;
  const Box({Key key, this.text, this.aspectRatio, this.shareButton = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SftFullPage())),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: aspectRatio,
            child: Container(
              width: double.maxFinite,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: AppUtils.circularBoxDecoration(background: CColor.appBlackLight, border: CColor.appBlackLight),
            ),
          ),
          if (shareButton)
            Positioned(
              left: 0,
              bottom: 5,
              child: IconButton(
                onPressed: () {
                  share(context);
                  debugPrint("Share button pressed");
                },
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
