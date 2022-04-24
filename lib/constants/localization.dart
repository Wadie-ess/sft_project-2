import 'package:flutter/material.dart';

class Localization with ChangeNotifier {
  String localized(String key) {
    ///remove "" to check missing values at runtime
    return stLocalized(key);
  }

  static String stLocalized(String key) {
    return _localizedValues["en"][key];
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      //profile Edit Screen
      "profile": "Profile",
      "profileWallet": "PROFILE WALLET",
      "choohooId": "Choohoo ID:",
      "availableGameUnit": "Game Units Available:",
      "availablePoints": "Points Available:",
      "availableSpecialCode": "Special Codes Available:",
      "availableSuperSpecialCode": "Super Special Codes Available:",
      "promoCodePoints": "Promo Code Points:",
      "name": "Name:",
      "surname": "Surname:",
      "nickname": "Nickname/Alias:",
      "email": "Email:",
      "mobileNumber": "Mobile Number:",
      "country": "Country:",
      "city": "City:",
      "dateOfBirth": "Date Of Birth:",
      "gender": "Gender:",
      "editInfo": "Edit Info",

      //edit profile
      "profileEdit": "Profile | Edit Info",

      //chane password
      "passChange": "Update Password",

      //chane password
      "SqQuestionChange": "Update Security Question",

      //sign Up Welcome screen
      "welcomeMessage": "Welcome Name, you have successfully signed up to find the Choohoo",

      "detailsVerified": "Your details have been verified",
      "choohooIdNumber": "Your Choohoo ID is insert number",
      "emailSentVerify": "An email has been sent to you to verify your details.",
      "checkLink": "Kindly enter the pin you received in your email to activate your Choohoo account",
      "readyToHunt": "Ready to Hunt?",

      // profile updated
      "welcomeMessageEditProfile": "You have successfully updated your Profile Settings",
      "profileUpdatedMessage": "Your updated details have been verified.",
      "emailSentVerifyEditProfile": "An email has been sent to you to verify your updated details.",
      "checkLinkEditProfile": "Kindly enter the pin you received in your email to update your details.",
      'changePassword': 'Change Password',
      'changeSecurityQuestion': 'Change Security Question',

      //changePassword
      'passChangeSuccess': 'You have successfully updated the password of your Choohoo account.',
      'sQChangeSuccess': 'You have successfully updated the security question of your Choohoo account.',

      //notification
      "notifications": "Notifications",
      "search": "Search",
      "notificationTitle": "Notification Title",
      "notificationDetailText":
          "Lorem ipsum dolor sit amet, cing elit. Ut ornare pulvinar odio fermentum. Lorem ipsum dolor  consectetur adipiscing elit. odio at fermentum, ut ornare…",
      "dateTime": "Date Year, Day at Time",
      "notificationNumber": "Notification Number",

      //notification Details
      "notificationDetail": "Notification Details",
      "notificationDummyText":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ornare pulvinar odio at fermentum. Donec id lectus in tellus venenatis pharetra nec ut magna. Aliquam fermentum sem accumsan, interdum urna vel, facilisis arcu. Phasellus efficitur dictum nisi, vel bibendum purus placerat et. Pellentesque porttitor dolor quis purus tristique, vel pretium ex accumsan. Nulla et ultrices lacus. Integer scelerisque est in nulla cursus scelerisque. Nunc bibendum nulla varius erat mattis, nec ultrices nisi mollis. Nulla feugiat nulla vel semper lobortis. Fusce commodo vulputate sodales. Vivamus mollis ligula a velit venenatis rhoncus. Maecenas consequat ",
      "mediaGoesHere": "PHOTO OR VIDEO OR AUDIO OR ICON GOES HERE",

      //my hunts
      "myHunts": "My Hunts",
      "huntName": "Hunt name goes here plea  \nDW1.  |  SH/NSH",
      "huntDate": "Status: Finished/Open since Date Year",
      "huntStatus": "Status:",
      "huntStatusTitle": "Finished/Open since Date Year",
      "clue1": "Clue 1",
      "clueAvailable": "Available! Get it now here",
      "clue2": "Clue 2",
      "clueNotAvailable": "Not available yet ",
      "clueSeen": "You have it already check View Details",

      //track records
      "trackRecord": "Track Record",
      "huntsPlayed": "Hunts played to date:",
      "pointsDate": "Total Points to date:",
      "pointsYear": "Points in 2019:",
      "pointsToCodes": "Points converted to Special Codes:",
      "pointsInYear": "Top ten position since:",
      "huntNameTitle": "Hunt Name",
      "yearDate": "Year Date",
      "position": "Position",
      "huntTrackDetail": "NAME’S TRACK RECORD",

      // Buy game units
      "buyLoadGameUnits": "BUY OR LOAD GAME UNITS",
      "buyGameUnits": "BUY GAME UNITS",
      "purcahasedDate": "Purchased to date:",
      "usedData": "Used to date:",
      "Expired": "Expired:",
      "Available": "Available:",
      "valid12Months":
          "Game Units are valid for 12 months.\n\nEach batch of 50 Units can be used for Riddles or Clues in all Standard Hunts.\n\nNon-Standard Hunts cost more than Standard Hunts.\n\nGame Units can also be used for Riddles and Clues in Non-Standard Hunts if you have the correct amount of Game Units available, which you can always top up if you wish to.\n\nYou get a free Riddle or Clue after every 4th purchase. This is issued as a Special Code.",
      "r50": "R50.00 | 50 Units per batch",
      "quantity": "Quantity",
      "loadGameUnit": "Load Game Units | Enter Here",
      "buyNow": "Buy Now",
      // buy game unit payments
      "buyGameUnitsReview": "BUY GAME UNITS  |  REVIEW",
      "contactCustomerSupport": "If something appears to be missing or incorrect,\nplease contact CUSTOMER SUPPORT",
      "contactUsNote": "Please do not hesitate to email us your enquiry on ",
      "emailAddressContact": "contactus@choohoo.world",

      //game unit card oayment details
      "gameUnitDebitCreditCard": "BUY GAME UNITS  |  CREDIT OR DEBIT CARD",
      "payNow": "Pay Now (R150.00)",

      // payment process message
      "paymentProcessed":
          "You have successfully purchased 150 Game Units/Riddle/Clue 1/Clue 2 for insert Hunt on date, year & time\n\nYour payment has been unsuccessful. Please contact your bank.\n\nDisplay relevant error or unsuccessful message pending payment option chosen",

      // load payment screen
      "loadPayment":
          "You have successfully loaded 150 Game Units to you wallet, please note that these Game Units expire 12 months from now on date, year & time\n\nGame Units have Not been loaded. Please try again. Please note that loading the same Game Units more than once is Not allowed.",

      //special code
      "specialCode": "SPECIAL CODES",
      "specialCodeReceievedDate": "Special Codes Received to date:",
      "specialCodeUsedDate": "Special Codes Used to date:",
      "specialCodeExpires": "Special Codes Expired:",
      "specialCodeAvailable": "Special Codes Available:",
      "specialCodePromo": "Special Codes from App Promo Code Points:",
      "speicalCodeMessage":
          "\nChoohoo issues Special Codes to participants at various times. You can use Special Codes to get and SFT and participate for a Money-Reward Opportunity.\n\nSpecial Codes are valid for 6 months from date of issue.\n\nYou get a Special Code after every 4th purchase.\n\nYou get a Special Code on your Birthday.\n",
      "superSpecialText":
          "\nSpecial Codes are valid for 6 months from date of issue.\n\nSuper Special Codes are issued to participants for extraordinary occasions, events or circumstances.\n\nYou can use Super Special Codes for the reason/s as deemed by Choohoo.",
      "specialCodeTitle": "Special Code",

      //super special code
      "superSpecialCode": "SUPER SPECIAL CODES",
      "superSpecialCodeReceievedDate": "Super Special Codes Received to date:",
      "superSpecialCodeUsedDate": "Super Special Codes Used to date:",
      "superSpecialCodeExpires": "Super Special Codes Expired:",
      "superSpecialCodeAvailable": "Super Special Codes Available:",
      "superSpeicalCodeMessage": "Super Special Codes are issued for extraordinary occasions, events or circumstances.",
      "superSpecialCodeTitle": "Super Special Code",
      "codeMessage":
          "Expires on Date Year,cing elit. Ut ornare pulvinar odio fermentum. Ut ornare pulvinar Lorem ipsum dolor consectetur odio at fermentum, ut ornare…",

      //special code details
      "specialCodeDetails": "SPECIAL CODE DETAILS",
      "specialCodeMessage": "Use Special Codes for any Riddle or Clue in Standard Hunts only.",

      //super special code details
      "superSpecialCodeDetails": "Super SPECIAL CODE DETAILS",
      "superSpecialCodeMessage": "Use Super Special Codes for Insert Reason.",

      "generatedNumber": "SCRandomGeneratedNumber",
      "expireOn": "Expires on Date and Year",

      //receipts page
      "receiptPage": "Receipts",
      "unitsPurchased": "Units Purchased",
      "riddlePurchased": "Riddle Purchased",
      "clueOnePurchased": "Clue 1 Purchased",
      "clueTwoPurchased": "Clue 2 Purchased",
      "recieptNumber": "Reciept Number",

      //receipts detail page
      "receiptDetails": "Receipt Details",
      "receiptPersonalDetail": "Paid with: ??\nName: ??\nLast Name: ??\nChoohoo ID: ??",
      "dateTimePurchased": "Date Year, Day at Time of Purchase",
      "gameUnitNumber": "Game Units Number: ",
      "unitDummy": "GUWAGenerated6digitNumber",
      "receiptMailed": "The receipt has also been emailed to you.",
      "riddleNumber": "Riddle Number: ",
      "clueOneNumber": "Clue 1 Number: ",
      "clueTwoNumber": "Clue 2 Number: ",
      "dummyTextDetail":
          "City, Location\nDate Time \nStarted/Start Date Time \nDescription is typed here about eg. \nAdidas is impossible is nothing.\nStandard Hunt/Non-Standard Hunt\n",
      "dummyTextDetail2": "DW1.  |  SH/NSH",
      "dummyTextDetail3": "Hunt name goes here plea",

      //reseller
      "resellerPage": "RESELLERS",
      "ourSeller": "Our ReSellers",
      "becomeSeller": "Become A Reseller",
      "resellerMessage1":
          "Choohoo is available from 200 Resellers.\n\nList is in no order of importance. Search results show Resellers closest to you in alphabetical order including Shops, Online Stores/Platforms and Independent Sales Executives.",

      //become a seller
      "sellerMessage":
          "Exciting opportunity available for Resellers:\n\n1.	Shops\n2.	Online Stores/Platforms\n3.	Independent Sales Executives\n\nEarning Potential +- R35000/ \$S2000 per month.\n\nOpportunities are available across the Globe for Digital World Resellers. However, opportunities for Real World Resellers are currently only available in a few South African cities for now, namely, Cape Town, Stellenbosch, Durban, Johannesburg, Ladysmith & Worcestor.\n\nTo find out more provide your details below:",
      "isSeller": "Are you a?",
      "uploadPhoto": "Upload a Photo of Yourself…",
      "takePhoto": "Step 1. TAKE PHOTO",
      "uploadPhotoC": "Step 2. UPLOAD PHOTO",
      "uploadPhotoMessage": "Great! x1 Photo has been uploaded\nSorry, Photo has not been uploaded,\nplease try again",
      "processing": "Processing",

      //our resellers
      "ressellerMessage":
          "Your Reseller Request has been successfully submitted.\n\nOur Choohoo Team will be in contact with you shortly.\n\nSorry, your Reseller Request has not been submitted successfully.\n\nlease try again. If this problem persists, please contact the Game Masters by clicking here",
      "ressellerMessage2":
          "1. List displayed here before Searching is based on Resellers closest to your phone or computer.\n\n2. Exclusive Books displayed here before Searching is based on Resellers closest to your phone or computer.\n\n3. Shoprite displayed here before Searching is based on Resellers closest to your phone or computer.\n\n4. Takealot displayed here before Searching is based on Resellers closest to your phone or computer.\n\n5. Wayne Lazarus displayed here before Searching is based on Resellers closest to your phone or computer.\n\n6. etc.",

      //BOOK PRIVATE EVENT
      "bookTitle": "BOOK CHOOHOO FOR PRIVATE EVENTS AND TEAM BUILDING",
      "bookMessage":
          "Choohoo is a fun and challenging way to bring people together.\n\nIt is a mystery to be solved, and a reality to be experienced.\n\nContact us on bookings@choohoo.world",
      "photoVideo": "Photo or Video or Audio goes Here",

      //our story
      "ourStory": "Our Story",
      "ourStoryMessage":
          "Once upon a time during a balmy Cape Town twilight… KG had an idea. KG has many ideas. He wrestles with ideas night and day… until it ticks all the boxes.\n\nOne day he called WL with an idea… WL himself was also an idea-wrestler. WL agreed with great gusto and proceeded to further build upon the idea.\n\nPM then teleported in from a familiar dimension not too far away.\n\nKG, WL & PM put the plan together and Choo’d their Hoo.\n\nThe moon shone bright, the sun did rise and a dog barked at something that rustled under the leaves.\n\nTo this day KG, WL & PM continue to Choo their Hoo.",

      //contact us
      "contactUsFAQ": "CONTACT US & FAQ",
      "contactUs": "Contact Us",
      "faq": "FAQ",
      "contactUsMessage":
          "Thank you for your enquiry.\n\nOur Choohoo Team will be in contact with you shortly.\n\nSorry, your enquiry has not been submitted successfully.\n\nPlease try again. If this problem persists, please contact the Game Masters by clicking here\n\nMight use wordpress/Google forms here…",

      //faq
      "faqTitle": "FREQUENTLY ASKED QUESTIONS",
      "faqDetail": "Perhaps use Wordpress for this…",

      //technical update
      "techniacalUpdate": "TECHNICAL UPDATE",
      "techniacalUpdateMessage":
          "Version 2.0 of Choohoo has automatically been updated.\n\nYou need to update the Choohoo game to version 2.0, click here",

      //how to play
      "howToPlay": "HOW TO PLAY | DETAILS & RULES",
      "howToPlayMessageCentred":
          "Choohoo \n\nif yoo find it, it’s for yoo hoo\n\nCrack the Riddle\nHunt in the Real World\nor the Digital World,\nwith your friends\nor by yourself.\n\nIt’s a mystery game,\nA global scavenger hunt to find the Choohoo…\n\nThink yoo can find it?\nGreat prizes… climb the leaderboard\n\n\n",
      "howToPlayMessage": "HOW TO PLAY is a short version to read (for those who prefer to learn while mostly playing)\n\nGAME DETAILS & RULES is a long version to read (for those who need to know everything before they start)\n\nHOW TO PLAY\n\n\t1.\tDownload the Choohoo game app and sign up to receive your Choohoo ID.\n\n\t2.\tThe Choohoo is a card with a half-moon design and secret number. Choose to search for the Choohoo in Real World Hunts, Digital World Hunts or Private Hunts. You will be hunting and playing against people from all over the world!\n\n\t3.\tGet the Riddle, start the hunt and try to find the Choohoo. The opening Riddle of every hunt can sometimes include information intentionally created to mislead you, but also includes the correct information to send you in the right direction :)\n\n\t4.\tIf you want to, you can also get Clue 1 and Clue 2 for more intriguing direction to help you get closer to the Choohoo."
          "\n\n\t5.\tThere are 10 Choohoos per hunt, sometimes you might need Game Units to get Riddles or Clues to find the Choohoo.\n\n\t6.\tWhen you find the Choohoo, validate its Secret Number to win prizes and points for 1st - 10th positions per hunt. \n\n\t7.\tIf you win, the Game Masters will contact you via an app notification informing you of a safe and secret location of where to pick up your prize or where it will be delivered. You may receive your prize within an hour of Choohoo validation, pending the type of prize. At this time all other players will also be informed that the 1st Choohoo has been found and validated, and that there are still positions available for those who continue hunting for 2nd - 10th place. This process is repeated until the 10th place position for each hunt is filled.\n\n\t8.\tAccumulated points translate to various prizes and rewards including a Special Code for every 50 points earned, and Leaderboard prizes and a trophy for overall rank of points in positions 1-10 at the end of each year.\n\n\t9.\tYou also get a Special Code on your birthday or after every 4th batch of Game Units purchased. 1 batch = 50 Game Units. Special Codes are valid for 6 months and can be used for any Riddle or Clue in Standard Hunts only.\n\n\t10.\tThe Game Masters might also issue you a Super Special Code for whatever reason they see fit. Super Special Codes can be used for Standard Hunts and Non-Standard Hunts, or both if deemed by the Game Masters.\n\n\t11.\tIf you find the Choohoo send the Game Masters a cool or fun photo of yourself or you and a group of your friends, and we will share it on our social media.\n\n\t12.\tPrizes vary and include vouchers, products, travel, money and lots more. Sometimes there a many hunts taking place at the same time and you can hunt in all of them if you want to.\n\n\n\nGAME DETAILS & RULES\n\n\t1\tYou need to download the Choohoo app and sign up to get a Choohoo ID. You then crack riddles and clues to help you find the Choohoo. The Choohoo is a card with a half-moon design. Every Choohoo has a unique secret number. Choohoos can be found in the real world or the digital world via hunts that are public or private. \n\n\t2\tWhen you find a Choohoo, you need to submit its secret number. If the secret number is validated, you can win prizes and points.\nEach hunt has 10 Choohoos with unique secret numbers to find and validate. \n\n\t3.\tA player who finds the Choohoo first might not necessarily be the player to win the 1st prize and 1st position points. Rank of prizes and of rank of points are awarded to players who validate the Choohoo’s secret number in order of 1st-10th. This is because for example, a player’s phone battery might die in the process of a secret number submission. 1st to validate = 1st prize and points, 2nd to validate = 2nd prize and points, and so on… until the 10th position."
          "\n\n\t4.\tYou can play in 4 hunt modes:\n\t\ta.\tDigital World Hunt\n\t\tb.\tReal World Hunt\n\t\tc.\tPrivate Hunt Real World \n\t\td.\tPrivate Hunt Digital World\n\n\t5.\tDigital World Hunts are available to all players anywhere on the entire planet at the same time; with the Choohoo being found within the game app. Digital World Hunts require the player to find and validate the Choohoo through a process of submitting 1 or 1-3 answers. Answers are alpha-numeric and not case sensitive.\n\n\t6.\tReal World Hunts are sometimes only available to players in specific regions around the world; and the Choohoo could be found for example, in a building, on a person or somewhere unexpected.\n\n\n\t7.\tPrivate Hunts can be for specific regions around the world or the entire planet, but always require a reference number to play. Private Hunts can also be for specific requests for example, team building events, birthday parties, dinner parties or any concept you might have. Private Hunts do not contribute points to the Leaderboard. Players are able to email a query to Private Hunt managers.\n\n\t8.\tEach mode has many hunts, and If you wish you can also try and find the Choohoo in different hunts within all 4 modes at the same time. All modes have 2 types of hunts, Standard Hunt or Non-Standard Hunt. Countries excluded from hunts that are available for the entire planet are Cuba, Iran, North Korea, Sudan and Syria.\n\t9.\tEach hunt as 1 Riddle and 2 Clues. The content of the Riddle and Clues are sometimes free of charge, or might require you to buy Game Units, this depends on the nature of each hunt. However, all hunts do provide free content (Riddle or Clue) at some stage of each hunt to help you find the Choohoo. Hunts only display in the app’s My Hunts menu if the player has viewed the initial Riddle. All free Riddles and Clues appear in the app’s My Hunts menu only when clicked and viewed from the app’s Hunt List. \n\n\n\t10.\tThe opening Riddle of every hunt can sometimes include information intentionally created to mislead you, but also includes the correct information to send you in the right direction :)\nClues give more information to help you to get closer to finding the Choohoo. However, if you are game-savvy you may not require Clues, and you could find the Choohoo using only the opening Riddle.\n\n\n\t11.\tNotifications are sent to all players when hunts open and close, clues become available and when Choohoos are found. Until all 10 Choohoos per hunt are found, the hunt stays open. If a player finds a Choohoo without being legally entered into the relevant hunt, the player cannot submit the secret number until the player legally enters the hunt first, which might demand paying for the Riddle if required by said hunt.\n\n\t12.\tStandard Hunts are released with the Riddle on the first Tuesday of every month, starting at 14:00 South Africa Time (GMT+2). Clue 1 becomes available at 14:00 on the Friday of the same week as the hunt’s release. Clue 2 becomes available on the following week’s Monday at 14:00. A new Hunt and Cycle of Riddles and Clues is sometimes started the next day (Tuesday, 3rd week of the month). Non-Standard Hunts have their own release dates.\n\t13.\tA player cannot submit and validate more than 1 Choohoo secret number per hunt. If all 10 Choohoos are found and validated at the Riddle stage of a hunt then Clue 1 and Clue 2 are not released. If all 10 Choohoos are found and validated in a hunt at the Clue 1 stage, then Clue 2 is not released. If a player joins a hunt after a Riddle or Clue is released, then the player is sent a Notification affirming that the Riddle and/or Clue has already been released. In this instance, the player would have to buy the Riddle content if required."
          "\n\t14.\tGame Units are tokens that players use to get Riddles or Clues that are not free. Game Units are sold in batches of 50 Game Units each, and can be topped up in the player profile wallet. You can save time by buying many batches of Game Units in advance for future hunts. Riddles or Clues for Standard Hunts cost 50 Game Units (1 batch). Riddles and Clues for Non-Standard Hunts cost either 100 Game Units (2 batches), 200 Game Units (4 batches) or 250 Game Units (5 batches).\n\t15.\tGame Units are valid for 12 months from date of purchase. Game Units can be bought directly in the game app or from Resellers. Resellers include Stores and Independent Sales Executives, Resellers also sell Game Units online. Promo Codes may be used to top up Game Units pending the type of promotion. In the event of a refund for a Riddle or Clues, the player receives the refund as Game Units. \n\t16.\tSpecial Codes are tokens that are given to players. Players exchange Special Codes for Riddles or Clues and are valid for 6 months from date of issue. Players get a Special Code for their birthday, after every 4th Game Unit batch purchase and for every 50 points they accumulate. Special Codes can only be used for Standard Hunts. In the case of a refund, Special Codes will be refunded within 14 working days in the form of Game Units.\n\t17.\tSuper Special Codes are tokens that are given to players. Players exchange Super Special Codes for Riddles or Clues and are valid for 6 months from date of issue. Super Special Codes are issued to players for any reason deemed by the Game Masters. Players can only use Super Special Codes for the reason deemed by the Game Masters which could be for any hunt or a specific hunt only. In the case of a refund, Super Special Codes will be refunded within 14 working days in the form of Game Units.\n\t18.\tThere are 2 categories of prizes, Hunt Prizes and Leaderboard Prizes. Hunt Prizes are awarded to some players who find and validate the Choohoo in any hunt. Each Hunt may include up to 5 Hunt Prizes. The player may have the option to choose from 2 first prize options, either Prize 1A or Prize 1B. Leaderboard Prizes are awarded at the end of the year to players with the most points on the Leaderboard in positions 1-5. A Trophy is also awarded to the Leaderboard winners (Digital World and Real World) at the end of each year."
          "\n\t19.\tPrizes sometimes have expiry dates, in this case players must \'use\' the prize within the allocated period, for example a trip to watch a football game has a pre-set date. Prizes are Amazon Gift Cards, products on Amazon, money deposits, other partner/brand associated prizes, travel, and other prizes based on hunt requirements. Amazon is used for the source and delivery of prizes for both national and international hunts. If a country does not permit the Amazon prize, an alternate prize will be arranged. In some cases, other companies will be used for the source and delivery of prizes for both national and international hunts. These prizes would be based on the hunt requirements. Prizes cannot be exchanged for money.\n\t20.\tPrize pick up details for Leaderboard Prizes is sent via an app notification, email and phone communication. If both the Leaderboard Prizes and Hunt Prizes have not been picked up there is an automated follow up notification that goes out 3 weeks after the initial notification goes out. This notification repeats every 3 weeks until the player confirms that the prize has been picked up. Weekly notifications get sent to a player that has won a prize but has not uploaded a photo of it, until a photo is uploaded.\n\t21.\tPlayers who find the 10 Choohoos per hunt and validate the secret numbers in 1st to 10th positions are awarded points in their profile wallet and on the Leaderboard. The points awarded for the top 10 positions are 1st = 25 points, 2nd = 20 points, 3rd = 15 points, 4th = 10 points, 5th = 8 points, 6th = 7 points, 7th = 5 points, 8th = 3 points, 9th = 2 points, 10th = 1 point. Players also get points for the following: Sign Up point = 3 Points, Login Point = 0.25 Points (*only for 2 logins a month). \n\t22.\tAccumulated points translate to various rewards and prizes. Every 50 points gets you a free Special Code. The top 5 players with the most points on the Leaderboards at the end of the year also win prizes. There is a Digital World Leaderboard and a Real World Leaderboard. Only Leaderboard Points are reset to zero on 20 January each new year. All other points still remain in the players profile wallet as leverage for Special Codes and other opportunities deemed by the Game Masters.\n\t23.\tPromo Codes are tokens that are given to players. Promo Codes are valid for the duration as deemed by the promotion. Based on the promotion, the player could use the Promo Codes to top up Game Units, access Riddles or Clues in Standard or Non-Standard Hunts or for any reason as deemed by the promotion.\n\t24.\tPlayers cannot play the game unless they enable the app permissions for access to location, notifications and access to the phone’s camera. Players cannot change their birthday after submitting their birthday and sign up info the first time. Players can only opt out of email and app communication if they opt out of the game. Logging back into the game, means again agreeing to the Choohoo Terms & Conditions.\n\t25.\tWinners can submit a photo of themselves to be posted on social media. The photo goes through an auditing process by the Game Masters. \n",
      "legal": "TERMS, PRIVACY POLICY & END USER LICENSE AGREEMENT",
      "legalTerms": "By Signing Up you agree to our Terms, Privacy Policy and End User License Agreement",
      "legalMessage": ""
              "Terms and Conditions | Version 1.0\n" +
          "1. Introduction\n" +
          "These terms and conditions regulate the relationship between us (Choohoo - the app provider) and you as the app user. We are Choohoo (Pty) Ltd with registration number {Registration_Number}. We have developed this application and you can use it to crack clues, hunt for the Choohoo object (a half moon object card) and take a shot at winning some great prizes. This license is subject to conditions and you will be liable for breach of this licence if you use our software contrary to these terms.\n" +
          "2. Acceptance\n" +
          "You agree to these terms by downloading, installing, or running the application. If you do not agree to these terms you may not use the application.\n" +
          "3. Software application\n" +
          "3.1. The application\n" +
          "These terms apply to your use of the Choohoo application, which is a game where you crack clues, and hunt for prizes in your city or in the virtual world.\n" +
          "3.2. The rules\n" +
          "• You choose what you want to hunt for.\n" +
          "• You choose where you want to hunt.\n" +
          "• There is only one clue per hunt.\n" +
          "• To stand a chance of winning a prize, you must send a clear photo of you or your friends holding the Choohoo in a cool and fun way with the secret number to the game master for validation.\n" +
          "• The game master allocates the prize to the first validated entry.\n" +
          "• You are only a valid winner once the game master contacts you with a safe and secret location of where to pick up your prize.\n" +
          "• You may receive your prize as early as an hour of Choohoo photo validation, depending on the type of prize you have won, however this time period is not guaranteed and it can take longer for you to receive your prize.\n" +
          "• Upon the winner being established, the particular hunt comes to end.\n" +
          "• You may receive points every time you purchase a new clue. You can redeem the points to receive cool rewards.\n" +
          "• Winners grant permission for us to use their names and photographs in any advertising and promotional material for the app. You may ask us to remove your name or refuse to take part in any publicity.\n" +
          "• You will not receive any payment for using the app, or taking part in any media format related to it.\n" +
          "• You cannot ask us to give you another prize of similar value or to pay out the value of the prize. We may substitute any prize with another prize of similar value.\n" +
          "• The app is in no way sponsored, endorsed or administered by, or associated with, Facebook, Twitter or YouTube.\n" +
          "• You release Facebook, Twitter and YouTube of all liability for any damage you may suffer. You will be giving information to us and not to Facebook, Twitter or YouTube.\n" +
          "3.3. Costs and purchasing of clues\n" +
          "Each clue or Clue Code will cost R50.00 (ZAR50). Clues can be purchased through the app or Clue Codes can be purchased at selected stores. We reserve the right to change the costs of purchasing clues or purchasing Clue Codes by giving you reasonable notice of any changes.\n" +
          "3.4. Access\n" +
          "For the app to run successfully you must grant us the following:\n" +
          "• access to your location while using the app;\n" +
          "• permission to receive push notifications; and\n" +
          "• access to your camera.\n" +
          "3.5. City or virtual world\n" +
          "Hunts may take place in the virtual world or in any city. Choohoos are everywhere. In order to play in a city, you must grant us access to your location to be able to hunt and collect prizes.\n" +
          "3.6. Hullabaloos\n" +
          "Hullabaloos are promotional vouchers that can be claimed and used once available. The vouchers can be redeemed at participating stores and on claiming it, you will be given the unique code to use the voucher.\n" +
          "4. Duration\n" +
          "4.1. Commencement\n" +
          "These terms commence whenever you accept them and continue until terminated.\n" +
          "5. End User Terms\n" +
          "5.1. License\n" +
          "We grant you a limited non-exclusive license to use this application on these terms. We may cancel your license at any time for any reason. Your license is automatically cancelled if you do not get our written permission before using this application in a way these terms do not allow. Your right to use our application is non-assignable. You may not transfer the right to anyone else.\n" +
          "5.2. Your obligations\n" +
          "Each authorised user agrees:\n" +
          "• to create their credentials on request;\n" +
          "• to keep their credentials, secure;\n" +
          "• not to provide access to any person other than an authorised user;\n" +
          "• not to interfere with the functionality or proper working of the service; and\n" +
          "• not to introduce any viruses, worm, logic bomb, trojan, wares, potentially unwanted program (PUP) or other malicious software into the service.\n" +
          "5.3. Security\n" +
          "Each authorised user is responsible and liable for activities that occur under their account. You authorise us to act on any instruction given by an authorised user, even if it transpires that someone else has defrauded both us and you, unless you have notified us in writing prior to us acting on a fraudulent instruction. We are not liable for any loss or damage suffered by you attributable to an authorised user’s failure to maintain the confidentiality of their credentials.\n" +
          "6. Privacy\n" +
          "We take the protection of your data very seriously and will always do everything in our power to protect it. We process your personal information in terms of our Privacy Policy.\n" +
          "7. Intellectual property\n" +
          "7.1. Retention of rights\n" +
          "We own intellectual property rights in our technology and you may not use those rights without our permission. You do not acquire any rights in our technology if we use it in our performance under a request.\n" +
          "7.2. Our technology\n" +
          "Our technology is anything that we have or acquire rights in and may use to perform our obligations under this agreement.\n" +
          "7.3. Trademarks\n" +
          "Our trademarks are our property and you may not use them without our permission. All other trademarks are their respective owners’ property.\n" +
          "7.4. Restrictions\n" +
          "You may not change, hire out, reverse engineer, or copy the services without our permission.\n" +
          "7.5. Prosecution\n" +
          "All violations of proprietary rights or this agreement will be prosecuted to the fullest extent permissible under applicable law.\n" +
          "8. Limitation of liability\n" +
          "8.1. Direct damages limited\n" +
          "To the extent permitted by applicable law, regardless of the form (whether in contract, delict or any other legal theory) in which any legal action may be brought, our maximum liability to you for direct damages for anything giving rise to any legal action will be an amount equal to the total fees already paid by you to us.\n" +
          "8.2. Indirect damages excluded\n" +
          "To the extent permitted by applicable law, in no event will we (or our personnel) be liable for any indirect, incidental, special or consequential damages or losses (whether foreseeable or unforeseeable) of any kind arising from this agreement.\n" +
          "8.3. We are not liable for your default\n" +
          "We are not liable for any damage or loss that your breach, misrepresentation, or mistake causes.\n" +
          "8.4. Other goods or services\n" +
          "We are not liable for any other deliverable, including website, goods, or service provided by any third party.\n" +
          "8.5. Indemnity\n" +
          "You agree to indemnify, defend and hold us (and our personnel) harmless against any and all:\n" +
          "• loss of or damage to any property or injury to or death of any person; and\n" +
          "• loss, damage (including attorneys’ fees on an attorney and own client basis), costs and expenses that you may suffer or incur arising directly or indirectly from: (i) any wilful misconduct or fraud by us or our personnel; or (ii) a breach by us of your proprietary or confidential information, or intellectual property.\n" +
          "9. Breach and termination\n" +
          "If you breach any of these terms (failure to comply with it) and you fail to comply with it within seven days of receiving written notice from us to do so, we may:\n" +
          "• immediately cancel and remove you as a user and close your account; and\n" +
          "• claim damages from you, including any claim for any fees already due.\n" +
          "10. Termination\n" +
          "10.1. Termination for good cause\n" +
          "We may immediately terminate this agreement at any time by giving you notice in writing if:\n" +
          "• we discontinue the software or services;\n" +
          "• we believe providing the software or services could create an economic or technical burden or material security risk for us;\n" +
          "• termination is necessitated by us having to comply with any applicable law or requests of governmental entities.\n" +
          "10.2. Termination for convenience\n" +
          "We may, in our discretion, terminate this agreement, on reasonable written notice to you.\n" +
          "10.3. Duties on termination\n" +
          "On termination, cancellation, or expiry of this agreement:\n" +
          "• you must uninstall the software from all licensed devices;\n" +
          "• we will stop providing the services; and\n" +
          "• your user account will cease to exist.\n" +
          "11. Resolving disputes\n" +
          "There will be a dispute about or from this agreement if a party writes to the other about it and asks for it to be resolved under this clause. The parties must refer any dispute to be resolved by arbitration. The parties must refer the dispute within 15 business days to arbitration (including any appeal against the arbitrator’s decision) under AFSA’s latest rules for expedited arbitrations. The arbitration will be held in English in Johannesburg. The parties will agree and appoint one arbitrator. If the parties cannot agree on the arbitrator within 10 business days after the referral, the Secretariat of AFSA will appoint the arbitrator.\n" +
          "12. Beyond human control\n" +
          "Neither party is responsible for breach of this agreement caused by circumstances beyond human control, but the other party may cancel this agreement on written notice to the other if the circumstances persist for more than 60 calendar days.\n" +
          "13. General\n" +
          "13.1. Entire agreement\n" +
          "This agreement is the entire agreement between the parties related to the relationship between you and us.\n" +
          "13.2. Changes to the terms\n" +
          "We may change the terms at any time and where this affects your rights and obligations, we will notify you of any changes by placing a notice in a prominent place on our website or by email. If you do not agree with the change you must stop using the software or services. If you continue to use the software or services following notification of a change to the terms, the changed terms will apply to you and you will be deemed to have accepted such terms.\n" +
          "13.3. Changes to any third party software license agreement\n" +
          "We will notify you of any changes to any third party software license terms by placing a notice in a prominent place on our website or in the software, or notifying you by email. The updated third party software license terms will be effective immediately and you will be deemed to have accepted them upon notification.\n" +
          "13.4. Waiver (giving up of rights)\n" +
          "Any favour we may allow you will not affect or substitute any of our rights against you.\n" +
          "13.5. Severability\n" +
          "If any term is void (invalid), unenforceable, or illegal, the term may be severed (removed) from and will not affect the rest of this agreement if it does not change its purpose.\n" +
          "13.6. Governing law\n" +
          "South African law governs this agreement.\n" +
          "13.7. Jurisdiction\n" +
          "You consent to the jurisdiction of the South African Magistrate’s Court in respect of any action or proceedings that we may bring against you in connection with this agreement, even if the action or proceedings would otherwise be beyond its jurisdiction without prejudice to our right to institute any action in any other court having jurisdiction.\n" +
          "Privacy Policy | Version 1.0\n" +
          "Introduction\n" +
          "Welcome to our privacy policy. We are Choohoo Partnership and this is our plan of action when it comes to protecting your privacy. We respect your privacy and take the protection of personal information very seriously. The purpose of this policy is to describe the way that we collect, store, use, and protect information that can be associated with you or another specific natural or juristic person and can be used to identify you or that person (personal information).\n" +
          "Audience\n" +
          "This policy applies to you if you are:\n" +
          "• a user of our application (app);\n" +
          "• a visitor to our website; or\n" +
          "• a customer who has ordered the services that we provide.\n" +
          "Personal information\n" +
          "Personal information includes:\n" +
          "• certain information that we collect automatically when you visit our website or use our app;\n" +
          "• certain information collected on registration; or\n" +
          "• certain information collected on submission.\n" +
          "but excludes:\n" +
          "• information that has been made anonymous so that it does not identify a specific person;\n" +
          "• permanently de-identified information that does not relate or cannot be traced back to you specifically;\n" +
          "• non-personal statistical information collected and compiled by us; and\n" +
          "• information that you have provided voluntarily in an open, public environment or forum including any blog, chat room, community, classifieds, or discussion board (because the information has been disclosed in a public forum, it is no longer confidential and does not constitute personal information subject to protection under this policy).\n" +
          "Common examples\n" +
          "Common examples of the types of personal information which we may collect and process include your:\n" +
          "\n" +
          "\n" +
          "\n" +
          "Sensitive personal information\n" +
          "\n" +
          "Acceptance\n" +
          "Acceptance required\n" +
          "You must accept all the terms of this policy when you order any of our goods or order, register for, or use the website, app or any of our services If you do not agree with anything in this policy, then you may not order any of our goods or order, register for, or use the website, app or any of our services.\n" +
          "Legal capacity\n" +
          "You may not access our website, use our app, or order our services if you are younger than 18 years old or do not have legal capacity to conclude legally binding contracts. If you are younger than 18 years old you must get parental consent before using our website, app, or order our services\n" +
          "Deemed acceptance\n" +
          "By accepting this policy, you are deemed to have read, understood, accepted, and agreed to be bound by all of its terms.\n" +
          "Your obligations\n" +
          "You may only send us your own personal information or the information of another data subject where you have their permission to do so.\n" +
          "Changes\n" +
          "We may change the terms of this policy at any time by updating this web page. We will notify you of any changes by placing a notice in a prominent place on the website or the app, or by sending you an email detailing the changes that we have made and indicating the date that they were last updated. If you do not agree with the changes, then you must stop using the website, the app and our services. If you continue to use the website, the app or our services following notification of a change to the terms, the changed terms will apply to you and you will be deemed to have accepted those updated terms.\n" +
          "Collection\n" +
          "On registration\n" +
          "Once you register on our website or app, you will no longer be anonymous to us. You will provide us with certain personal information.\n" +
          "This personal information will include:\n" +
          "• your name and surname;\n" +
          "• your email address;\n" +
          "• your contact number;\n" +
          "• your date of birth; and\n" +
          "• your password.\n" +
          "We will use this personal information to fulfil your user ID, provide additional services and information to you as we reasonably think appropriate, and for any other purposes set out in this policy.\n" +
          "From browser\n" +
          "We automatically receive and record Internet usage information on our server logs from your browser, such as your Internet Protocol address (IP address), browsing habits, click patterns, version of software installed, system type, screen resolutions, colour capabilities, plug-ins, language settings, cookie preferences, search engine keywords, JavaScript enablement, the content and pages that you access on the website, and the dates and times that you visit the website, paths taken, and time spent on sites and pages within the website (usage information). Please note that other websites visited before entering our website might place personal information within your URL during a visit to it, and we have no control over such websites. Accordingly, a subsequent website that collects URL information may log some personal information.\n" +
          "Cookies\n" +
          "We may place small text files called ‘cookies’ on your device when you visit our website or use our app. These files do not contain personal information, but they do contain a personal identifier allowing us to associate your personal information with a certain device. These files serve a number of useful purposes for you, including:\n" +
          "• granting you access to age restricted content;\n" +
          "• tailoring our website’s functionality to you personally by letting us remember your preferences;\n" +
          "• improving how our website performs;\n" +
          "• allowing third parties to provide services to our website; and\n" +
          "• helping us deliver targeted advertising where appropriate in compliance with the applicable laws.\n" +
          "Your internet browser generally accepts cookies automatically, but you can often change this setting to stop accepting them. You can also delete cookies manually. However, no longer accepting cookies or deleting them will prevent you from accessing certain aspects of our website where cookies are necessary. Many websites use cookies and you can find out more about them at www.allaboutcookies.org.\n" +
          "Web beacons\n" +
          "Our website may contain electronic image requests (called a single-pixel gif or web beacon request) that allow us to count page views and to access cookies. Any electronic image viewed as part of a web page (including an ad banner) can act as a web beacon. Our web beacons do not collect, gather, monitor or share any of your personal information. We merely use them to compile anonymous information about our website.\n" +
          "Recording calls\n" +
          "We may monitor and record any telephone calls that you make to us, unless you specifically request us not to.\n" +
          "Purpose for collection\n" +
          "We may use or process any services information or optional information that you provide to us for the purposes that you indicated when you agreed to provide it to us. Processing includes gathering your personal information, disclosing it, and combining it with other personal information. We generally collect and process your personal information for various purposes, including:\n" +
          "\n" +
          "\n" +
          "\n" +
          "\n" +
          "We may use your usage information for the purposes described above and to:\n" +
          "• remember your information so that you will not have to re-enter it during your visit or the next time you access the website or the app;\n" +
          "• monitor your website and app usage metrics such as total number of users and pages accessed; and\n" +
          "• track your accumulated points, hunts, and winnings or other activities in connection with your usage of the website or the app.\n" +
          "Consent to collection\n" +
          "We will obtain your consent to collect personal information in accordance with applicable law when you provide us with any registration information.\n" +
          "Use\n" +
          "Our obligations\n" +
          "We may use your personal information to fulfil our obligations to you. We may access your location information for you to successfully hunt for objects and collect them.\n" +
          "Messages and updates\n" +
          "We may send administrative messages and email updates to you about the website or the app. In some cases, we may also send you primarily promotional messages. You can choose to opt-out of promotional messages.\n" +
          "Disclosure\n" +
          "Sharing\n" +
          "We may share your personal information with:\n" +
          "• an affiliate, in which case we will seek to require the affiliates to honour this privacy policy;\n" +
          "• our service providers under contract who help with parts of our business operations, including fraud prevention, bill collection, marketing, technology services (our contracts dictate that these service providers only use your information in connection with the services they perform for us and not for their own benefit);\n" +
          "• credit bureaus to report account information, as permitted by law;\n" +
          "• banking partners as required by credit card association rules for inclusion on their list of terminated merchants (in the event that you utilise the services to receive payments and you meet their criteria); and\n" +
          "• other third parties who provide us with relevant services where appropriate.\n" +
          "Regulators\n" +
          "We may disclose your personal information as required by law or governmental audit.\n" +
          "Law enforcement\n" +
          "We may disclose personal information if required:\n" +
          "• by a subpoena or court order;\n" +
          "• to comply with any law;\n" +
          "• to protect the safety of any individual or the general public; and\n" +
          "• to prevent violation of our customer relationship terms.\n" +
          "No selling\n" +
          "We will not sell personal information. No personal information will be disclosed to anyone except as provided in this privacy policy.\n" +
          "Marketing purposes\n" +
          "We may disclose aggregate statistics (information about the customer population in general terms) about the personal information to advertisers or business partners.\n" +
          "Employees\n" +
          "We may need to disclose personal information to our employees that require the personal information to do their jobs. These include our responsible management, accounting, compliance, information technology, or other personnel.\n" +
          "Change of ownership\n" +
          "If we undergo a change in ownership, or a merger with, acquisition by, or sale of assets to, another entity, we may assign our rights to the personal information we process to a successor, purchaser, or separate entity. We will disclose the transfer on the website. If you are concerned about your personal information migrating to a new owner, you may request us to delete your personal information.\n" +
          "Security\n" +
          "We take the security of personal information very seriously and always do our best to comply with applicable data protection laws. Our hosting company will host our website in a secure server environment that uses a firewall and other advanced security measures to prevent interference or access from outside intruders. We authorize access to personal information only for those employees who require it to fulfil their job responsibilities. We implement disaster recover procedures where appropriate.\n" +
          "Accurate and up to date\n" +
          "We will try to keep the personal information we collect as accurate, complete and up to date as is necessary for the purposes defined in this policy. From time to time we may request you to update your personal information on the website or the app. You are able to review or update any personal information that we hold on you by accessing your account in the app, emailing us, or phoning us. Please note that in order to better protect you and safeguard your personal information, we take steps to verify your identity before granting you access to your account or making any corrections to your personal information.\n" +
          "Retention\n" +
          "We will only retain your personal information for as long as it is necessary to fulfil the purposes explicitly set out in this policy, unless:\n" +
          "• retention of the record is required or authorised by law; or\n" +
          "• you have consented to the retention of the record.\n" +
          "During the period of retention, we will continue to abide by our non-disclosure obligations and will not sell your personal information. We may retain your personal information in physical or electronic records at our discretion.\n" +
          "Transfer to another country\n" +
          "We may transmit or transfer personal information outside of the country in which it was collected to a foreign country and process it in that country. Personal information may be stored on servers located outside the country in which it was collected in a foreign country whose laws protecting personal information may not be as stringent as the laws in the country in which it was collected. You consent to us processing your personal information in a foreign country whose laws regarding processing of personal information may be less stringent.\n" +
          "Updating or removing\n" +
          "You may choose to correct or update the personal information you have submitted to us, by clicking the relevant menu on our website or the app or contacting us by phone or email.\n" +
          "Limitation\n" +
          "We are not responsible for, give no warranties, nor make any representations in respect of the privacy policies or practices of linked or any third party websites.\n" +
          "Enquiries\n" +
          "If you have any questions or concerns arising from this privacy policy or the way in which we handle personal information, please contact us by:\n" +
          "• emailing us at info@choohoo.world;\n" +
          "• calling us on +27 021 683 6117; or\n" +
          "• sending physical mail to 32 Maple Drive, 200 Kyalami Hills, 1684, Midrand, South Africa.\n",

      //app promo code
      "appPromoCode": "APP PROMO CODE",
      "pointsFromCode": "Points from Promo Code:",
      "pointsFromSpecialCode": "Points from Promo Code converted to Special Codes:",
      "yourCode": "Your Code",
      "dummyCode": "Choohoo-CraigXHE",
      "appPromoMessage":
          "Use this App Promo Code to get 50 Points if you Refer 10 People that Sign Up.\n\nEach person referred and signed up equatesto 5 points.\n\nThese points accumulate until you reach 50 points. 50 points is issued as a Special Code.\n\nShare and Refer…",
    },
  };

  static TextDirection textDirectionLtr() {
    return TextDirection.rtl;
  }

  static TextDirection textDirectionRtl() {
    return TextDirection.rtl;
  }

  static TextAlign textAlignLeft() {
    return isEnglish() ? TextAlign.left : TextAlign.right;
  }

  static TextAlign textAlignRight() {
    return !isEnglish() ? TextAlign.left : TextAlign.right;
  }

  static Alignment alignmentTopLeft() {
    return !isEnglish() ? Alignment.topRight : Alignment.topLeft;
  }

  static Alignment alignmentTopRight() {
    return isEnglish() ? Alignment.topRight : Alignment.topLeft;
  }

  static FractionalOffset fractionalOffsetTopRight() {
    return isEnglish() ? FractionalOffset.topRight : FractionalOffset.topLeft;
  }

  static String defaultAlertTitle() {
    return stLocalized("alert_title");
  }

  static String defaultAlertButtonTitle() {
    return stLocalized("default_alert_btn_title");
  }

  static bool isEnglish() {
    return true;
  }
}
