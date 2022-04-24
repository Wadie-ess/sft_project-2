import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants/CColors.dart';
import '../../constants/CTheme.dart';
import '../../utils/AppBarBuy.dart';
import '../../utils/CustomDrawer.dart';

class AboutChoohoo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoryState();
  }
}

class StoryState extends State<AboutChoohoo> {
  String aboutChoohoo =
      """\nAs a precursor to a future project, KG, PM, WL & DS decided to create a more democratised alternative to Non-Fungible Tokens (NFTs); where instead, more people could participate in purchasing digital assets and content as Shared-Fungible Tokens (SFTs), without facing the barriers of high prices associated with many NFTs.\n\n""";
  String aboutChoohoo2 =
      """\nA shared marketplace for SFTs, content (art, design, video, audio) and other digital assets, with Money-Reward opportunities and public benefits across the globe.

Choohoo supports socio-economic development, and the work of creatives, artists and innovators.

Get your Shared-Fungible Tokens (SFTs) and be given the opportunity to receive a Money-Reward in relation to the total value of all SFTs sold; split between 1 or more people per Pod. 

Choohoo assists artists, creatives and innovators by selling their brilliant work! At the same time Choohoo contributes to public benefit initiatives, via a portion of all SFT sales donated to socio-economic development programmes, which in turn gets you a section 18A tax benefit.

In addition, Choohoo creates jobs by also sharing a portion of various SFT sales with independent marketing and sales partners.
As a global platform we invite people from all over the world to participate in the opportunities available.

Each SFT Pod contains all details for each SFT. SFT Pods run for 2 weeks from start date. Twice a month, beginning on the first and second Tuesday of every month, at 14:00 South Africa Time (GMT+2), and closing at 16:00 on each prior Monday respectively.

The Choohoo system randomly chooses a participant/s to receive a Money-Reward in 1 minute after every SFT Pod closing time. 

One or more people are guaranteed to receive the Money-Reward always, all you have to do is buy the SFT in the Pod, or use a code to participate.

Money-Rewards increase in value as more people purchase SFTs per Pod, this includes the public benefit.

Money-Rewards are provided within 1.5 weeks of issued date.

Countries excluded from participating in Choohoo are Cuba, Iran, North Korea, Sudan and Syria.

The Choohoo shared marketplace mobile app is freemium, free to download but includes paid for content.

Our global monthly SFT Pods bring people together through exciting and edgy content that gives participants a new sense of wonderment every time they engage Choohoo.

The moon shone bright, the sun did rise, and a dog barked at something that rustled under the leaves…
""";
  String sft =
      """\nA Shared-Fungible Token (SFT) is a multiple-of-a-kind digital asset that belongs to whoever purchases it and whomever it is shared with or sold to. SFTs can be bought, shared or exchanged by multiple people at higher or lower values than its initial price. SFTs include artwork, music, animation, photography and other innovative products and content. 

If the first Mona Lisa or other original paintings could be considered as NFTs so to speak, then SFTs are kind of like the digital equivalent of the official reprints of the original NFTs. Just like official prints or reprints of an artwork are much cheaper than the original, SFTs can be cheaper than NFTs while still providing an impact in its intended purpose. 

Only a few people in the world might be able to afford NFTs, but SFTs can bridge the gap for those who also want a high quality digital assets at fairly affordable prices.""";

  String specialCodesTitle = "Special Codes";
  String specialCodesTextDark = """What are the 3 types of Codes? (Special Codes, Super Special Codes, App Promo Codes)""";
  String specialCodesText =
      """Choohoo issues Special Codes to participants at various times. You can use Special Codes to get and SFT and participate for a Money-Reward Opportunity.

Special Codes are valid for 6 months from date of issue.

You get a Special Code after every 4th purchase. 

You get a Special Code on your Birthday.""";

  String superSpecialCodesTitle = "Super Special Codes";
  String superSpecialText = """Special Codes are valid for 6 months from date of issue.

Super Special Codes are issued to participants for extraordinary occasions, events or circumstances.

You can use Super Special Codes for the reason/s as deemed by Choohoo.""";

  String appPromoTitles = "App Promo Codes ";
  String appPromoText = """Participants are given a unique App Promo Code to share with non-participants to sign up to the Choohoo platform.

A participant gets access to 1 SFT every time he refers 10 People that Sign Up. When this occurs his App Promo Code becomes “greenlit” and is thus usable to access an SFT of his choice. 

Accessing the SFT using the greenlit App Promo Code in turn gives the participant access to a Money-Reward Opportunity.""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: Colors.white,
        appBar: AppBarBuy(),
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Center(
                      child: AutoSizeText(
                        "ABOUT CHOOHOO",
                        style: CTheme.textRegular16Black(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    _photoOrVideoContainer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        "Background",
                        style: CTheme.textRegular16Black(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(aboutChoohoo, style: CTheme.textLight16Black()),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        "What is Choohoo?",
                        style: CTheme.textRegular16Black(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(aboutChoohoo2, style: CTheme.textLight16Black()),
                    ),
                    SizedBox(height: 20),
                    _photoOrVideoContainer(),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("What is an SFT?", style: CTheme.textRegular16Black()),
                            Text(sft, style: CTheme.textLight16Black()),
                            SizedBox(height: 30),
                            Text(specialCodesTextDark, style: CTheme.textRegular16Black()),
                            SizedBox(height: 20),
                            Text(specialCodesTitle, style: CTheme.textRegular16Black()),
                            SizedBox(height: 20),
                            Text(specialCodesText, style: CTheme.textLight16Black()),
                            SizedBox(height: 30),
                            Text(superSpecialCodesTitle, style: CTheme.textRegular16Black()),
                            SizedBox(height: 20),
                            Text(superSpecialText, style: CTheme.textLight16Black()),
                            SizedBox(height: 30),
                            Text(appPromoTitles, style: CTheme.textRegular16Black()),
                            SizedBox(height: 20),
                            Text(appPromoText, style: CTheme.textLight16Black()),
                          ],
                        )),
                    SizedBox(height: 40),
                  ],
                ),
              )),
        ));
  }

  _photoOrVideoContainer() {
    return AspectRatio(
      aspectRatio: 343.0 / 193.0,
      child: Container(
        padding: EdgeInsets.only(top: 15, bottom: 30),
        margin: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 19),
        child: Center(
          child: Text(
            "Image/Video",
            style: CTheme.textRegular16LightGrey(),
          ),
        ),
        decoration: BoxDecoration(
          color: CColor.appWhite,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border(
              bottom: BorderSide(color: CColor.appGreyLight),
              top: BorderSide(color: CColor.appGreyLight),
              right: BorderSide(color: CColor.appGreyLight),
              left: BorderSide(color: CColor.appGreyLight)),
        ),
      ),
    );
  }
}
