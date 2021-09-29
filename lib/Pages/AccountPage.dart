import 'package:baja_app/Pages/Sub-AccountPages/ContactUsPage.dart';
import 'package:baja_app/Pages/Sub-AccountPages/ProfilePage.dart';
import 'package:baja_app/Pages/Sub-AccountPages/AddressPage.dart';
import 'package:baja_app/Pages/Sub-AccountPages/OrdersPage.dart';
import 'package:baja_app/Pages/Sub-AccountPages/PaymentPage.dart';
import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/Paddings.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  ScrollController accountSingleChildScrollViewController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accountSingleChildScrollViewController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    accountSingleChildScrollViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          controller: accountSingleChildScrollViewController,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          padding: overallBodyOnlyTopPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 10 / 380,
                  left: getWidth(context) * 30 / 380,
                  right: getWidth(context) * 30 / 380,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Hi Shadad !",
                      style: TextStyle(
                          color: BajaAppColors.orange,
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: getWidth(context) * 10 / 380,
                    ),
                    Text(
                      "Shadad@gmail.com",
                      style: TextStyle(
                          color: BajaAppColors.textGray.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: getWidth(context) * 5 / 380,
                    ),
                    Container(
                      height: 2,
                      width: 30,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 30 / 380,
                  bottom: getWidth(context) * 30 / 380,
                  left: getWidth(context) * 30 / 380,
                  right: getWidth(context) * 30 / 380,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: getWidth(context) * 100 / 380,
                      height: getWidth(context) * 130 / 380,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(getWidth(context) * 20 / 380)),
                          boxShadow: [
                            BoxShadow(
                                color: BajaAppColors.textGray.withOpacity(0.3),
                                offset: Offset.zero,
                                blurRadius: 3)
                          ]),
                      child: FlatButton(
                        splashColor: BajaAppColors.textGray,
                        highlightColor: BajaAppColors.backGray,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(getWidth(context) * 20 / 380))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => UserOrdersPage(),
                              ));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/account_orders.png"),
                            SizedBox(
                              height: getWidth(context) * 15 / 380,
                            ),
                            Text(
                              "Orders",
                              style: TextStyle(
                                  color: BajaAppColors.textGray, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: getWidth(context) * 100 / 380,
                      height: getWidth(context) * 130 / 380,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(getWidth(context) * 20 / 380)),
                          boxShadow: [
                            BoxShadow(
                                color: BajaAppColors.textGray.withOpacity(0.3),
                                offset: Offset.zero,
                                blurRadius: 3)
                          ]),
                      child: FlatButton(
                        onPressed: () {

                        },
                        splashColor: BajaAppColors.textGray,
                        highlightColor: BajaAppColors.backGray,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(getWidth(context) * 20 / 380))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/account_returns.png"),
                            SizedBox(
                              height: getWidth(context) * 15 / 380,
                            ),
                            Text(
                              "Returns",
                              style: TextStyle(
                                  color: BajaAppColors.textGray, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: getWidth(context) * 100 / 380,
                      height: getWidth(context) * 130 / 380,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(getWidth(context) * 20 / 380)),
                          boxShadow: [
                            BoxShadow(
                                color: BajaAppColors.textGray.withOpacity(0.3),
                                offset: Offset.zero,
                                blurRadius: 3)
                          ]),
                      child: FlatButton(
                        splashColor: BajaAppColors.textGray,
                        highlightColor: BajaAppColors.backGray,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(getWidth(context) * 20 / 380))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => ContactUsPage(),
                              ));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/account_contact.png"),
                            SizedBox(
                              height: getWidth(context) * 15 / 380,
                            ),
                            Text(
                              "Contact\nUs",
                              style: TextStyle(
                                  color: BajaAppColors.textGray, fontSize: 16),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Divider(
                    color: BajaAppColors.textGray.withOpacity(0.3),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ProfilePage(),
                          ));
                    },
                    highlightColor: Colors.transparent,
                    splashColor: BajaAppColors.backGray,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getWidth(context) * 15 / 380,
                          horizontal: getWidth(context) * 30 / 380),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 1,
                            child:
                                Image.asset("assets/icons/account_person.png"),
                          ),
                          Expanded(
                              flex: 5,
                              child: Text(
                                "Profile",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              )),
                          Flexible(
                            flex: 1,
                            child: FaIcon(
                              FontAwesomeIcons.chevronRight,
                              color: BajaAppColors.textGray,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: BajaAppColors.textGray.withOpacity(0.3),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => UserAddressPage(),
                          ));
                    },
                    highlightColor: Colors.transparent,
                    splashColor: BajaAppColors.backGray,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: getWidth(context) * 15 / 380,
                        horizontal: getWidth(context) * 30 / 380,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Image.asset("assets/icons/account_map.png"),
                          ),
                          Expanded(
                              flex: 5,
                              child: Text(
                                "Addresses",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              )),
                          Flexible(
                            flex: 1,
                            child: FaIcon(
                              FontAwesomeIcons.chevronRight,
                              color: BajaAppColors.textGray,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: BajaAppColors.textGray.withOpacity(0.3),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => UserPaymentPage(),
                          ));
                    },
                    highlightColor: Colors.transparent,
                    splashColor: BajaAppColors.backGray,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getWidth(context) * 15 / 380,
                          horizontal: getWidth(context) * 30 / 380,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Image.asset("assets/icons/account_card.png"),
                          ),
                          Expanded(
                              flex: 5,
                              child: Text(
                                "Payment",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              )),
                          Flexible(
                            flex: 1,
                            child: FaIcon(
                              FontAwesomeIcons.chevronRight,
                              color: BajaAppColors.textGray,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: BajaAppColors.textGray.withOpacity(0.3),
                  ),
                  InkWell(
                    onTap: () {},
                    highlightColor: Colors.transparent,
                    splashColor: BajaAppColors.backGray,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getWidth(context) * 15 / 380,
                          horizontal: getWidth(context) * 30 / 380,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Image.asset(
                                "assets/icons/account_language.png"),
                          ),
                          Expanded(
                              flex: 5,
                              child: Text(
                                "Language",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1),
                              )),
                          Flexible(
                            flex: 1,
                            child: FaIcon(
                              FontAwesomeIcons.chevronRight,
                              color: BajaAppColors.textGray,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: BajaAppColors.textGray.withOpacity(0.3),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 30 / 380,
                  right: getWidth(context) * 30 / 380,
                  left: getWidth(context) * 30 / 380,
                ),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(getWidth(context) * 10 / 380))),
                  height: getWidth(context) * 50 / 380,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.powerOff,
                        color: Colors.white,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: getWidth(context) * 10 / 380),
                        child: Text(
                          "Sign Out",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1),
                        ),
                      )
                    ],
                  ),
                  color: BajaAppColors.orange,
                  onPressed: () {},
                ),
              )
            ],
          ),
        ));
  }
}
