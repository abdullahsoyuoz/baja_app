import 'package:baja_app/Pages/Sub-AccountPages/OrdersPage.dart';
import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/fakeData.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:baja_app/Widgets/CustomAppBar.dart';
import 'package:baja_app/Widgets/DrawerMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

class OrderReviewPage extends StatefulWidget {
  @override
  _OrderReviewPageState createState() => _OrderReviewPageState();
}

class _OrderReviewPageState extends State<OrderReviewPage> {
  ScrollController singleChildScrollController;
  GlobalKey<ScaffoldState> _scaffoldKey;
  int selectedCard = -1;
  TextEditingController nameOnCardController = new TextEditingController();
  TextEditingController cardNumberController = new TextEditingController();
  TextEditingController expirationDate = new TextEditingController();
  TextEditingController securityCode = new TextEditingController();
  TextEditingController dialogName = new TextEditingController();
  TextEditingController dialogEmail = new TextEditingController();
  TextEditingController dialogPhoneNumber = new TextEditingController();
  TextEditingController dialogAdress = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleChildScrollController = new ScrollController();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    singleChildScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: DrawerMenu(),
      body: SingleChildScrollView(
        controller: singleChildScrollController,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Column(
              children: [
                BajaAppBar(_scaffoldKey),
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) * 20 / 380),
                  child: Text(
                    "Order Review",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 40 / 380,
                    left: getWidth(context) * 30 / 380,
                    right: getWidth(context) * 30 / 380,
                  ),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cart Summary (2 Items)",
                        style: TextStyle(
                            color: BajaAppColors.textGray, fontSize: 14),
                      )),
                ),
                Divider(
                  color: BajaAppColors.textGray.withOpacity(0.3),
                  thickness: 1,
                ),
                Container(
                  height: getWidth(context) * 100 / 380,
                  width: getWidth(context),
                  margin: EdgeInsets.symmetric(
                      vertical: getWidth(context) * 10 / 380),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding:
                        EdgeInsets.only(left: getWidth(context) * 30 / 380),
                    itemCount: FakeData.fakeProductList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: getWidth(context) * 100 / 380,
                        margin: EdgeInsets.only(
                            right: getWidth(context) * 20 / 380),
                        child: Image.asset(
                            FakeData.fakeProductList[index].imagePath),
                      );
                    },
                  ),
                ),
                Divider(
                  color: BajaAppColors.textGray.withOpacity(0.3),
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 20 / 380,
                    bottom: getWidth(context) * 20 / 380,
                    left: getWidth(context) * 30 / 380,
                    right: getWidth(context) * 30 / 380,
                  ),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Delivery Address",
                        style: TextStyle(
                            color: BajaAppColors.textGray, fontSize: 14),
                      )),
                ),
                Container(
                  height: getWidth(context) * 120 / 380,
                  width: getWidth(context),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: BajaAppColors.textGray.withOpacity(0.3))),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: getWidth(context) * 140 / 380,
                            height: getWidth(context) * 120 / 380,
                            child: Hero(
                              tag: "assets/images/firstMap.png",
                              child: Image.asset(
                                "assets/images/firstMap.png",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: getWidth(context) * 15 / 380,
                                left: getWidth(context) * 15 / 380),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: "Name: ",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Shadad",
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ]),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "Email: ",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "Shadad@gmail.com",
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ]),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "Phone Number: ",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text: "+966 500000",
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ]),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "Address: ",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                        TextSpan(
                                          text:
                                              "1, 7021 19, Faisalyah\n Dammam 32298 3059",
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ]),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.all(getWidth(context) * 10 / 380),
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setsState) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      getWidth(context) *
                                                          10 /
                                                          380)),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                340 /
                                                380,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                450 /
                                                380,
                                            padding: EdgeInsets.symmetric(
                                              vertical:
                                                  getWidth(context) * 15 / 380,
                                              horizontal:
                                                  getWidth(context) * 15 / 380,
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        getWidth(context) *
                                                            10 /
                                                            380))),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: getWidth(context) *
                                                        20 /
                                                        380,
                                                    left: getWidth(context) *
                                                        10 /
                                                        380,
                                                    right: getWidth(context) *
                                                        10 /
                                                        380,
                                                  ),
                                                  child: TextField(
                                                    controller: dialogName,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    decoration: InputDecoration(
                                                      enabledBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: BajaAppColors
                                                                  .textGray
                                                                  .withOpacity(
                                                                      0.3),
                                                              width: 1)),
                                                      hintText: "Name",
                                                      hintStyle: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.7),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: getWidth(context) *
                                                        20 /
                                                        380,
                                                    left: getWidth(context) *
                                                        10 /
                                                        380,
                                                    right: getWidth(context) *
                                                        10 /
                                                        380,
                                                  ),
                                                  child: TextField(
                                                    controller: dialogEmail,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    decoration: InputDecoration(
                                                      enabledBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: BajaAppColors
                                                                  .textGray
                                                                  .withOpacity(
                                                                      0.3),
                                                              width: 1)),
                                                      hintText: "Email",
                                                      hintStyle: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.7),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: getWidth(context) *
                                                        20 /
                                                        380,
                                                    left: getWidth(context) *
                                                        10 /
                                                        380,
                                                    right: getWidth(context) *
                                                        10 /
                                                        380,
                                                  ),
                                                  child: TextField(
                                                    controller:
                                                        dialogPhoneNumber,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    decoration: InputDecoration(
                                                      enabledBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: BajaAppColors
                                                                  .textGray
                                                                  .withOpacity(
                                                                      0.3),
                                                              width: 1)),
                                                      hintText: "Phone Number",
                                                      hintStyle: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.7),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: getWidth(context) *
                                                        20 /
                                                        380,
                                                    left: getWidth(context) *
                                                        10 /
                                                        380,
                                                    right: getWidth(context) *
                                                        10 /
                                                        380,
                                                  ),
                                                  child: TextField(
                                                    controller: dialogAdress,
                                                    minLines: 4,
                                                    maxLines: 4,
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    decoration: InputDecoration(
                                                      enabledBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: BajaAppColors
                                                                  .textGray
                                                                  .withOpacity(
                                                                      0.3),
                                                              width: 1)),
                                                      hintText: "Address",
                                                      hintStyle: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(0.7),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                      top: getWidth(context) *
                                                          20 /
                                                          380,
                                                      left: getWidth(context) *
                                                          10 /
                                                          380,
                                                      right: getWidth(context) *
                                                          10 /
                                                          380,
                                                    ),
                                                    child: FlatButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                      color:
                                                          BajaAppColors.orange,
                                                      child: Center(
                                                        child: Text(
                                                          "Submit",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      height:
                                                          getWidth(context) *
                                                              50 /
                                                              380,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  });
                            },
                            child: FaIcon(
                              FontAwesomeIcons.pen,
                              color: BajaAppColors.textGray.withOpacity(0.5),
                              size: getWidth(context) * 20 / 380,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 20 / 380,
                    bottom: getWidth(context) * 20 / 380,
                    left: getWidth(context) * 30 / 380,
                    right: getWidth(context) * 30 / 380,
                  ),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Payment Method",
                        style: TextStyle(
                            color: BajaAppColors.textGray, fontSize: 14),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getWidth(context) * 30 / 380),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildCard(context, 0, "assets/icons/card_mastercard.png"),
                      buildCard(context, 1, "assets/icons/card_visa.png"),
                      buildCard(
                          context, 2, "assets/icons/card_americanExpress.png"),
                      buildCard(
                          context, 3, "assets/icons/card_cashOnDelivery.png"),
                      buildCard(context, 4, "assets/icons/card_applePay.png")
                    ],
                  ),
                ),
                selectedCard == 0 ? buildCreditCardBody(context) : SizedBox(),
                selectedCard == 1 ? buildCreditCardBody(context) : SizedBox(),
                selectedCard == 2 ? buildCreditCardBody(context) : SizedBox(),
                Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 30 / 380,
                    left: getWidth(context) * 30 / 380,
                    right: getWidth(context) * 30 / 380,
                  ),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Payment Summary",
                        style: TextStyle(
                            color: BajaAppColors.textGray, fontSize: 14),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 20 / 380,
                    left: getWidth(context) * 30 / 380,
                    right: getWidth(context) * 30 / 380,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Total:",
                        style: TextStyle(color: BajaAppColors.textGray),
                      ),
                      Text(
                        "SAR. 70",
                        style: TextStyle(
                            color: BajaAppColors.textGray,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 10 / 380,
                    left: getWidth(context) * 30 / 380,
                    right: getWidth(context) * 30 / 380,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Fees:",
                        style: TextStyle(color: BajaAppColors.textGray),
                      ),
                      Text(
                        "SAR. 10",
                        style: TextStyle(
                            color: BajaAppColors.textGray,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 10 / 380,
                    left: getWidth(context) * 30 / 380,
                    right: getWidth(context) * 30 / 380,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Estimated Tax:",
                        style: TextStyle(color: BajaAppColors.textGray),
                      ),
                      Text(
                        "SAR. 0",
                        style: TextStyle(
                            color: BajaAppColors.textGray,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 10 / 380,
                    left: getWidth(context) * 30 / 380,
                    right: getWidth(context) * 30 / 380,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: TextStyle(color: BajaAppColors.textGray),
                      ),
                      Text(
                        "SAR. 0",
                        style: TextStyle(
                            color: BajaAppColors.textGray,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                selectedCard == 3
                    ? Padding(
                        padding: EdgeInsets.only(
                          top: getWidth(context) * 10 / 380,
                          left: getWidth(context) * 30 / 380,
                          right: getWidth(context) * 30 / 380,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Cash on Delivery",
                              style: TextStyle(color: BajaAppColors.textGray),
                            ),
                            Text(
                              "SAR. 10",
                              style: TextStyle(
                                  color: BajaAppColors.textGray,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
                Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 20 / 380,
                    left: getWidth(context) * 30 / 380,
                    right: getWidth(context) * 30 / 380,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total:",
                        style: TextStyle(
                            color: BajaAppColors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "SAR. 90",
                        style: TextStyle(
                            color: BajaAppColors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getWidth(context) * 30 / 380,
                    vertical: getWidth(context) * 40 / 380,
                  ),
                  child: FlatButton(
                    child: selectedCard != 4
                        ? Center(
                            child: Text(
                            "Buy Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ))
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Buy With",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: getWidth(context) * 5 / 380),
                                child: FaIcon(
                                  FontAwesomeIcons.applePay,
                                  color: Colors.white,
                                  size: getWidth(context) * 35 / 380,
                                ),
                              )
                            ],
                          ),
                    color:
                        selectedCard == 4 ? Colors.black : BajaAppColors.orange,
                    height: getWidth(context) * 50 / 380,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(getWidth(context) * 10 / 380))),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => UserOrdersPage(),
                          ),
                          (route) => true);
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                    top: getWidth(context) * 100 / 380,
                    right: getWidth(context) * 20 / 380),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: FaIcon(
                    FontAwesomeIcons.timesCircle,
                    color: BajaAppColors.navyBlue,
                    size: getWidth(context) * 30 / 380,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildCard(BuildContext context, int index, String imagePath) {
    return InkWell(
      onTap: () {
        setState(() {
          if (index != selectedCard) {
            selectedCard = index;
          }
        });
      },
      child: index == 3
          ? Container(
              width: getWidth(context) * 45 / 380,
              height: getWidth(context) * 35 / 380,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: index == selectedCard
                          ? BajaAppColors.orange
                          : Colors.black26,
                      width: 2)),
              child: Center(
                  child: Text(
                "CASH ON\nDELIVERY",
                style: TextStyle(
                  fontSize: 8,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: index == selectedCard
                      ? BajaAppColors.orange
                      : Colors.black26,
                ),
              )))
          : index == 4
              ? Container(
                  width: getWidth(context) * 50 / 380,
                  height: getWidth(context) * 35 / 380,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: index == selectedCard
                              ? BajaAppColors.orange
                              : Colors.black26,
                          width: 2)),
                  child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.applePay,
                        size: getWidth(context) * 30/380,
                        color: index == selectedCard ? BajaAppColors.orange
                            : Colors.black26,
                      ))
                )
              : Container(
                  width: getWidth(context) * 50 / 380,
                  height: getWidth(context) * 35 / 380,
                  padding: EdgeInsets.all(getWidth(context) * 5/380),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: index == selectedCard
                              ? BajaAppColors.orange
                              : Colors.black26,
                          width: 2)),
                  child: Image.asset(
                    imagePath,
                    color: index == selectedCard
                        ? BajaAppColors.orange
                        : Colors.black26,
                  ),
                ),
    );
  }

  buildCreditCardBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: getWidth(context) * 20 / 380,
          left: getWidth(context) * 30 / 380,
          right: getWidth(context) * 30 / 380,
          bottom: getWidth(context) * 20 / 380),
      child: Column(
        children: [
          TextField(
            controller: nameOnCardController,
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
            decoration: InputDecoration(
              hintText: "Name on Card *",
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: BajaAppColors.textGray.withOpacity(0.5))),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: BajaAppColors.textGray.withOpacity(0.5))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: getWidth(context) * 20 / 380),
            child: TextField(
              controller: cardNumberController,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
              decoration: InputDecoration(
                hintText: "Card Number *",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: BajaAppColors.textGray.withOpacity(0.5))),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: BajaAppColors.textGray.withOpacity(0.5))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: getWidth(context) * 20 / 380),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: expirationDate,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                    decoration: InputDecoration(
                      hintText: "Expiration Date *",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: BajaAppColors.textGray.withOpacity(0.5))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: BajaAppColors.textGray.withOpacity(0.5))),
                    ),
                  ),
                ),
                SizedBox(
                  width: getWidth(context) * 15 / 380,
                ),
                Flexible(
                  child: TextField(
                    controller: securityCode,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                    decoration: InputDecoration(
                      hintText: "Security Code *",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: BajaAppColors.textGray.withOpacity(0.5))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: BajaAppColors.textGray.withOpacity(0.5))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
