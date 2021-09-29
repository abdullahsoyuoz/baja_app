import 'package:baja_app/Pages/ProductPages/ProductViewPage.dart';
import 'package:baja_app/Pages/AuthPages/SignInPage.dart';
import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/Paddings.dart';
import 'package:baja_app/Utility/fakeData.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

class BasketPage extends StatefulWidget {
  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  ScrollController basketViewSingleChildScrollController;
  ScrollController basketViewListViewScrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    basketViewSingleChildScrollController = ScrollController();
    basketViewListViewScrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    basketViewSingleChildScrollController.dispose();
    basketViewListViewScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: basketViewSingleChildScrollController,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: overallBodySymmetricPadding(context),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ListView.separated(
              shrinkWrap: true,
              controller: basketViewListViewScrollController,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: FakeData.fakeProductList.length,
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(context) * 15 / 380),
              itemBuilder: (context, index) {
                return buildItemWidget(
                    context, FakeData.fakeProductList[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: BajaAppColors.textGray.withOpacity(0.5),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(context) * 15 / 380),
              child: Divider(
                color: BajaAppColors.textGray.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(context) * 15 / 380,
                  vertical: getWidth(context) * 20 / 380),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(getWidth(context))),
                    border: Border.all(
                        color: BajaAppColors.textGray.withOpacity(0.2))),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: getWidth(context) * 20 / 380),
                      hintText: "Enter your coupon code",
                      hintStyle: TextStyle(
                          color: BajaAppColors.textGray.withOpacity(0.3)),
                      border: InputBorder.none),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(context) * 15 / 380),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Total:",
                        style: TextStyle(
                          color: BajaAppColors.textGray,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "SAR.70",
                        style: TextStyle(
                          color: BajaAppColors.textGray,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getWidth(context) * 5 / 380,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Fees:",
                        style: TextStyle(
                          color: BajaAppColors.textGray,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "SAR.10",
                        style: TextStyle(
                          color: BajaAppColors.textGray,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getWidth(context) * 5 / 380,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Estimated Tax:",
                        style: TextStyle(
                          color: BajaAppColors.textGray,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "SAR.0",
                        style: TextStyle(
                          color: BajaAppColors.textGray,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getWidth(context) * 5 / 380,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount:",
                        style: TextStyle(
                          color: BajaAppColors.textGray,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "- SAR.0",
                        style: TextStyle(
                          color: BajaAppColors.textGray,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getWidth(context) * 10 / 380,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total:",
                        style: TextStyle(
                            color: BajaAppColors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "SAR.80",
                        style: TextStyle(
                            color: BajaAppColors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getWidth(context) * 20 / 380,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(context) * 15 / 380),
              child: Divider(
                color: BajaAppColors.textGray.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: getWidth(context) * 30 / 380),
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Place Order",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "SAR. 80",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                color: BajaAppColors.orange,
                height: getWidth(context) * 50 / 380,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(getWidth(context) * 10 / 380))),
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => SignInPage(),
                      ));
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  left: getWidth(context) * 15 / 380,
                  right: getWidth(context) * 15 / 380,
                  top: getWidth(context) * 30 / 380,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: getWidth(context) * 45 / 380,
                      height: getWidth(context) * 35 / 380,
                      padding: EdgeInsets.all(getWidth(context) * 5 / 380),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: BajaAppColors.navyBlue, width: 2)),
                      child: Image.asset("assets/icons/card_mastercard.png", color: BajaAppColors.navyBlue),
                    ),
                    Container(
                      width: getWidth(context) * 45 / 380,
                      height: getWidth(context) * 35 / 380,
                      padding: EdgeInsets.all(getWidth(context) * 5 / 380),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: BajaAppColors.navyBlue, width: 2)),
                      child: Image.asset("assets/icons/card_visa.png", color: BajaAppColors.navyBlue,),
                    ),
                    Container(
                      width: getWidth(context) * 45 / 380,
                      height: getWidth(context) * 35 / 380,
                      padding: EdgeInsets.all(getWidth(context) * 5 / 380),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: BajaAppColors.navyBlue, width: 2)),
                      child:
                          Image.asset("assets/icons/card_americanExpress.png", color: BajaAppColors.navyBlue,),
                    ),
                    Container(
                        width: getWidth(context) * 45 / 380,
                        height: getWidth(context) * 35 / 380,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: BajaAppColors.navyBlue, width: 2)),
                        child: Center(
                            child: Text(
                          "CASH ON\nDELIVERY",
                          style: TextStyle(
                              fontSize: 8,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: BajaAppColors.navyBlue),
                        ))),
                    Container(
                      width: getWidth(context) * 45 / 380,
                      height: getWidth(context) * 35 / 380,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: BajaAppColors.navyBlue, width: 2)),
                      child: Center(
                          child: FaIcon(
                        FontAwesomeIcons.applePay,
                        color: BajaAppColors.navyBlue,
                      )),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget buildItemWidget(BuildContext context, FakeProduct item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getWidth(context) * 20 / 380),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => ProductViewPage(item))),
                child: Image.asset(item.imagePath)),
          ),
          SizedBox(
            width: getWidth(context) * 10 / 380,
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => ProductViewPage(item))),
                  child: Text(
                    "${item.title}",
                    style: TextStyle(
                        color: BajaAppColors.navyBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: getWidth(context) * 10 / 380,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity:",
                      style: TextStyle(
                        color: BajaAppColors.textGray,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "${item.quantity.toString()}",
                      style: TextStyle(
                        color: BajaAppColors.textGray,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getWidth(context) * 10 / 380,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Size:",
                      style: TextStyle(
                        color: BajaAppColors.textGray,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "${item.size.toString()}g",
                      style: TextStyle(
                        color: BajaAppColors.textGray,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) * 20 / 380),
                  child: Text(
                    "Remove",
                    style: TextStyle(
                        color: BajaAppColors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: getWidth(context) * 10 / 380,
          ),
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                "SAR.${item.price.toInt().toString()}",
                style: TextStyle(
                    color: BajaAppColors.textGray,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }
}
