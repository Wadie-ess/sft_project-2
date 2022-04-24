import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../constants/CColors.dart';
import 'payment_done_page.dart';
import 'payment_method_page.dart';
import 'sft_pod_details.dart';
import '../../utils/CustomBottomBar.dart';
import '../../utils/CustomDrawer.dart';
import '../../utils/generic_ap_bar.dart';
import 'package:dotted_line/dotted_line.dart';

class MyHomePage extends StatelessWidget {
  final String name;
  final dataKey = new GlobalKey();

  MyHomePage({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.black,
      appBar: GenericAppBar(
        showMenu: true,
        showBackButton: false,
        showLoginButton: true,
        showRegButton: true,
        name: name,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.only(bottom: 80),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                    height: 70,
                    width: 180,
                    child: SvgPicture.asset('assets/onboarding/logo-white.svg'),
                      
                    
                  ),
                ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    //   child: Container(
                    //     height: 70,
                    //     width: 180,
                    //     decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //         image: AssetImage('assets/splash/chohoo_img.png'),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    //   child: Text("it's for yoo hoo",
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(fontFamily: 'Roboto', color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300)),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, top: 30, right: 30),
                      child: Text(
                        "Choohoo randomly selects a participant/s to receive the Money-Reward in 1 minute after every SFT Pod closing time.\n\nOne or more people are guaranteed to receive the Money-Reward always, all you have to do is buy the SFT in the Pod, or use a code to participate.\n\nSpecial Codes are issued after every 4th SFT purchase.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xFFB4B3B4),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    _buySFTCard(context),
                    SizedBox(
                      height: 20,
                    ),
                    _buySFTCard(context),
                    _imageCard("Money-Reward Recipient | Pod Number", context),
                    _extraText(
                        """Last weeks SFT Pod Run for SFT Name by Artist Name enabled Name from City, Country to receive a Money-Reward of Amount on Date, and a public benefit donation of Amount to NGO/Initiative Name. The total quantity of SFTs sold for this pod was Quantity. \n\nNulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id."""),
                    _imageCard("Money-Reward Recipient | Pod Number", context),
                    _extraText(
                        """Last weeks SFT Pod Run for SFT Name by Artist Name enabled Name from City, Country to receive a Money-Reward of Amount on Date, and a public benefit donation of Amount to NGO/Initiative Name. The total quantity of SFTs sold for this pod was Quantity. \n\nNulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id."""),
                    _imageCard("What is Choohoo?", context),
                    _extraText(
                        """A shared marketplace for SFTs, content (art, design, video, audio) and other digital assets, with Money-Reward opportunities and public benefits across the globe.\n\nChoohoo supports socio-economic development, and the work of creatives, artists and innovators.\n\nGet your Shared-Fungible Tokens (SFTs) and be given the opportunity to receive a Money-Reward in relation to the total value of all SFTs sold; split between 1 or more people per Pod.\n\nChoohoo assists artists, creatives and innovators by selling their brilliant work! At the same time Choohoo contributes to public benefit initiatives, via a portion of all SFT sales donated to socio-economic development programmes, which in turn gets you a section 18A tax benefit.\n\nIn addition, Choohoo creates jobs by also sharing a portion of various SFT sales with independent marketing and sales partners. As a global platform we invite people from all over the world to participate in the opportunities available.\n\nEach SFT Pod contains all details for each SFT. SFT Pods run for 2 weeks from start date. Twice a month, beginning on the first and second Tuesday of every month, at 14:00 South Africa Time (GMT+2), and closing at 16:00 on each prior Monday respectively.\n\nMoney-Rewards increase in value as more people purchase SFTs per Pod, this includes the public benefit.\n\nMoney-Rewards are provided within 1.5 weeks of issued date.\n\nCountries excluded from participating in Choohoo are Cuba, Iran, North Korea, Sudan and Syria.\n\nOur global monthly SFT Pods bring people together through exciting and edgy content that gives participants a new sense of wonderment every time they engage Choohoo.\n\nThe moon shone bright, the sun did rise, and a dog barked at something that rustled under the leaves…"""),
                    _imageCard("What is an SFT?", context),
                    _extraText(
                        """A Shared-Fungible Token (SFT) is a multiple-of-a-kind digital asset that belongs to whoever purchases it and whomever it is shared with or sold to. SFTs can be bought, shared or exchanged by multiple people at higher or lower values than its initial price. SFTs include artwork, music, animation, photography and other innovative products and content.\n\nIf the first Mona Lisa or other original paintings could be considered as NFTs so to speak, then SFTs are kind of like the digital equivalent of the official reprints of the original NFTs. Just like official prints or reprints of an artwork are much cheaper than the original, SFTs can be cheaper than NFTs while still providing an impact in its intended purpose.\n\nOnly a few people in the world might be able to afford NFTs, but SFTs can bridge the gap for those who also want a high quality digital assets at fairly affordable prices."""),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      key: dataKey,
                      child: _imageCard("This week's featured SFT", context),
                    ),
                    _extraText(
                        """Last weeks SFT Pod Run for SFT Name by Artist Name enabled Name from City, Country to receive a Money Reward of Amount on Date, and a public benefit donation of Amount to NGO/Initiative Name. The total quantity of SFTs sold for this pod was Quantity. \n\nNulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id."""),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 9, 30, 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: DottedLine(
                              dashColor: Colors.transparent,
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.to(() => PaymentDonePage()),
                            child: Chip(
                              label: Text(' USE CODE '),
                              padding: EdgeInsets.only(left: 10, right: 10),
                              backgroundColor: Color(0xFF03F832),
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                          ),
                          Container(
                            width: 10,
                            child: DottedLine(
                              dashColor: Colors.transparent,
                              dashGapLength: 2,
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.to(() => PaymentMethodPage()),
                            child: Chip(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              label: Text('  BUY SFT  '),
                              backgroundColor: Color(0xFFEBF411),
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                          ),
                          Expanded(
                            child: DottedLine(
                              dashColor: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _imageCard("This week's featured Public Benefit", context),
                    _extraText(
                        """Last weeks SFT Pod Run for SFT Name by Artist Name enabled Name from City, Country to receive a Money Reward of Amount on Date, and a public benefit donation of Amount to NGO/Initiative Name. The total quantity of SFTs sold for this pod was Quantity. \n\nNulla luctus vel magna quis lobortis. Vivamus pulvinar risus mauris, non semper velit faucibus id."""),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              color: CColor.appBlackLight,
              child: Center(
                child: InkWell(
                  onTap: () => Scrollable.ensureVisible(dataKey.currentContext),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/star.png", height: 24),
                      SizedBox(width: 6),
                      Text(
                        "FEATURED",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buySFTCard(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color(0xFF464545),
            border: Border.all(color: Colors.white),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 9,
                    child: InkWell(
                      onTap: () => Get.to(() => SftPodDetails()),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Center(
                            child: Text(
                              "Thumbnail Image",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[200],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 11,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "SFT Price: ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                                TextSpan(
                                  text: '\$2,50',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                                TextSpan(
                                  text: '\nYour Money-Reward Opportunity:',
                                  style: TextStyle(
                                    color: Color(0xFFEBF411),
                                    fontFamily: 'Roboto',
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  text: ' \$3500,00 ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                                TextSpan(text: '(not split/split in 2/3)\n'),
                                TextSpan(
                                  text:
                                      'Money-Rewards increase in value as more people purchase SFTs per pod, this includes the public benefit.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: DottedLine(
                      dashColor: Colors.transparent,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => PaymentMethodPage());
                    },
                    child: Chip(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      label: Text('  BUY SFT  '),
                      backgroundColor: Color(0xFFEBF411),
                      side: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  Expanded(
                    child: DottedLine(
                      dashColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                'City, Country/International',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ),
              Text(
                'Started: Date | Time | 6 days remaining',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ),
              Text.rich(
                TextSpan(
                  text: 'SFT: ',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                  children: [
                    TextSpan(
                      text: ' Name by Artist Name this line should not be more than 2 lines',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' | Specification: 4K Resolution',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'SFT Number: ',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ),
              Text(
                'Quantity of SFTs Sold in this Pod:',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ),
              Text(
                'Public Benefit: \$120,00 | NGO/Initiative Name should not be longer than 2 lines',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ),
              Text(
                'Pod Number:  ',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ),
              Text(
                'SFT Pod Close: Date | Time (closed/open)',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'SFT Pods run for 2 weeks from start date. Twice a month, beginning on the first '
                'and second Tuesday of every month, at 14:00 South Africa Time (GMT+2),'
                ' and closing at 16:00 on each prior Monday respectively.',
                style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w100, fontFamily: 'Roboto'),
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(height: 1, width: double.maxFinite),
                  InkWell(
                    onTap: () => Get.to(() => PaymentDonePage()),
                    child: Chip(
                      label: Text(' USE CODE '),
                      padding: EdgeInsets.only(left: 12, right: 12),
                      backgroundColor: Color(0xFF03F832),
                      side: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(() => SftPodDetails()),
                    child: Chip(
                      label: Text('More Info...', style: TextStyle(color: Colors.white)),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      backgroundColor: CColor.appBlackLight,
                      side: BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                  SizedBox(height: 7),
                  IconButton(
                    onPressed: () {
                      debugPrint("Share button pressed");
                      share(context);
                    },
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 11,
          right: 30,
          child: Text(
            'POD',
            style: TextStyle(
              color: CColor.appWhite,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w200,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _imageCard(String heading, BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 48, 16, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              height: 40,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 10, 0, 10),
                  child: Text(
                    heading,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1.77,
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(19), bottomRight: Radius.circular(19)),
                      color: CColor.appBlackLight,
                    ),
                    child: Center(
                      child: Text('Image/Video/Gif/Music', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
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
          ],
        ),
      ),
    );
  }

  Widget _extraText(String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Color.fromRGBO(180, 179, 180, 1),
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
