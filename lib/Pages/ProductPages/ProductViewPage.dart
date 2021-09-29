import 'package:baja_app/Pages/MainPageView.dart';
import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/fakeData.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:baja_app/Widgets/CustomAppBar.dart';
import 'package:baja_app/Widgets/DrawerMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

class ProductViewPage extends StatefulWidget {
  FakeProduct fakeProduct;
  ProductViewPage(this.fakeProduct);

  @override
  _ProductViewPageState createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  ScrollController singleChildScrollController;
  GlobalKey<ScaffoldState> scaffoldKey;
  int count = 1;
  int selectedPackedLooseRadioValue = 0;
  int selectedWeightValue = 0;
  int selectedCoffeeRoastingLevel = -1;
  int selectedGrindCoffee = -1;
  bool choose0 = false;
  bool choose1 = false;
  bool choose2 = false;
  bool choose3 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleChildScrollController = ScrollController();
    scaffoldKey = GlobalKey<ScaffoldState>();
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
      key: scaffoldKey,
      drawer: DrawerMenu(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: singleChildScrollController,
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            BajaAppBar(scaffoldKey),
            Column(
              children: [
                Container(
                  width: getWidth(context),
                  height: getWidth(context) * 0.75,
                  child: Stack(
                    children: [
                      Center(
                        child: Hero(
                          tag: widget.fakeProduct.index,
                          child: Image.asset(
                            widget.fakeProduct.imagePath,
                            height: getWidth(context) * 250 / 380,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.all(getWidth(context) * 20 / 380),
                          child: IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.timesCircle,
                              color: BajaAppColors.navyBlue,
                            ),
                            iconSize: getWidth(context) * 30 / 380,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 0),
                  width: getWidth(context),
                  height: selectedPackedLooseRadioValue == 0 ? getWidth(context) * 0.8 : getWidth(context) * 1.8,
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 50 / 380,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(getWidth(context) * 50 / 380),
                        topRight: Radius.circular(getWidth(context) * 50 / 380),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: BajaAppColors.textGray.withOpacity(0.5),
                            blurRadius: 5)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: getWidth(context) * 50 / 380,
                              right: getWidth(context) * 50 / 380,
                              bottom: getWidth(context) * 20 / 380),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "${widget.fakeProduct.title}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  buildRadioItem(context, 0, "Packed"),
                                  buildRadioItem(context, 1, "Loose"),
                                ],
                              ),
                              selectedPackedLooseRadioValue == 1 ? buildSelectedLooseBody(context) : SizedBox(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Weight:",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: getWidth(context) * 10 / 380),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildWeightItem(context, 0, "250 g"),
                                        buildWeightItem(context, 1, "140 g"),
                                        buildWeightItem(context, 2, "15 g"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Price:",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "SAR. ${widget.fakeProduct.price.toInt()}",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: getWidth(context) * 60 / 380,
              width: getWidth(context),
              child: Row(
                children: [
                  Container(
                    width: getWidth(context) * 120 / 380,
                    height: getWidth(context) * 60 / 380,
                    decoration: BoxDecoration(
                        color: BajaAppColors.orange.withOpacity(0.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlatButton(
                          child: FaIcon(
                            FontAwesomeIcons.chevronLeft,
                            color: Colors.white,
                          ),
                          minWidth: getWidth(context) * 20 / 380,
                          onPressed: () {
                            setState(() {
                              if (count >= 1) {
                                count -= 1;
                              }
                            });
                          },
                        ),
                        Text(
                          "$count",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        FlatButton(
                          child: FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Colors.white,
                          ),
                          minWidth: getWidth(context) * 20 / 380,
                          onPressed: () {
                            setState(() {
                              if (count <= 99) {
                                count += 1;
                              }
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    child: FlatButton(
                      color: BajaAppColors.orange,
                      child: Center(
                        child: Text(
                          "Add To Cart",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => MainPageView(),));
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildRadioItem(BuildContext context, int index, String title) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          if (selectedPackedLooseRadioValue != index) {
            selectedPackedLooseRadioValue = index;
          }
        });
      },
      child: Row(
        children: [
          Container(
            width: getWidth(context) * 20 / 380,
            height: getWidth(context) * 20 / 380,
            decoration: BoxDecoration(
                color: selectedPackedLooseRadioValue == index
                    ? BajaAppColors.orange
                    : Colors.white,
                border: Border.all(
                    color: selectedPackedLooseRadioValue == index
                        ? Colors.transparent
                        : BajaAppColors.textGray,
                    width: 2),
                shape: BoxShape.circle),
          ),
          Padding(
            padding: EdgeInsets.only(left: getWidth(context) * 5 / 380),
            child: Text(
              "$title",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }

  buildWeightItem(BuildContext context, int index, String title) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedWeightValue = index;
        });
      },
      child: Container(
        height: getWidth(context) * 30 / 380,
        width: getWidth(context) * 80 / 380,
        decoration: index == selectedWeightValue
            ? BoxDecoration(
                color: BajaAppColors.navyBlue,
                border: Border.all(color: BajaAppColors.navyBlue, width: 1),
                borderRadius: BorderRadius.all(
                    Radius.circular(getWidth(context) * 5 / 380)))
            : BoxDecoration(
                color: Colors.white,
                border: Border.all(color: BajaAppColors.navyBlue, width: 1),
                borderRadius: BorderRadius.all(
                    Radius.circular(getWidth(context) * 5 / 380))),
        child: Center(
          child: Text(
            "$title",
            style: TextStyle(
                color: index == selectedWeightValue
                    ? Colors.white
                    : BajaAppColors.navyBlue,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  buildSelectedLooseBody(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: getWidth(context) * 20/380
            ),
            child: Text(
              "Coffee Roasting Level",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getWidth(context) * 10/380
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                    selectedCoffeeRoastingLevel = 0;
                });
              },
              child: Row(
                children: [
                  Container(
                    width: getWidth(context) * 20 / 380,
                    height: getWidth(context) * 20 / 380,
                    decoration: BoxDecoration(
                        color: selectedCoffeeRoastingLevel == 0
                            ? BajaAppColors.orange
                            : Colors.white,
                        border: Border.all(
                            color: selectedCoffeeRoastingLevel == 0
                                ? Colors.transparent
                                : BajaAppColors.textGray,
                            width: 2),
                        shape: BoxShape.circle),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: getWidth(context) * 5 / 380),
                    child: Text(
                      "Light",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getWidth(context) * 10/380
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  selectedCoffeeRoastingLevel = 1;
                });
              },
              child: Row(
                children: [
                  Container(
                    width: getWidth(context) * 20 / 380,
                    height: getWidth(context) * 20 / 380,
                    decoration: BoxDecoration(
                        color: selectedCoffeeRoastingLevel == 1
                            ? BajaAppColors.orange
                            : Colors.white,
                        border: Border.all(
                            color: selectedCoffeeRoastingLevel == 1
                                ? Colors.transparent
                                : BajaAppColors.textGray,
                            width: 2),
                        shape: BoxShape.circle),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: getWidth(context) * 5 / 380),
                    child: Text(
                      "Medium",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getWidth(context) * 20/380
            ),
            child: Text(
              "Grind Coffee",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getWidth(context) * 10/380
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  selectedGrindCoffee = 0;
                });
              },
              child: Row(
                children: [
                  Container(
                    width: getWidth(context) * 20 / 380,
                    height: getWidth(context) * 20 / 380,
                    decoration: BoxDecoration(
                        color: selectedGrindCoffee == 0
                            ? BajaAppColors.orange
                            : Colors.white,
                        border: Border.all(
                            color: selectedGrindCoffee == 0
                                ? Colors.transparent
                                : BajaAppColors.textGray,
                            width: 2),
                        shape: BoxShape.circle),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: getWidth(context) * 5 / 380),
                    child: Text(
                      "Ground",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getWidth(context) * 10/380
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  selectedGrindCoffee = 1;
                });
              },
              child: Row(
                children: [
                  Container(
                    width: getWidth(context) * 20 / 380,
                    height: getWidth(context) * 20 / 380,
                    decoration: BoxDecoration(
                        color: selectedGrindCoffee == 1
                            ? BajaAppColors.orange
                            : Colors.white,
                        border: Border.all(
                            color: selectedGrindCoffee == 1
                                ? Colors.transparent
                                : BajaAppColors.textGray,
                            width: 2),
                        shape: BoxShape.circle),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: getWidth(context) * 5 / 380),
                    child: Text(
                      "Beans",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getWidth(context) * 20/380
            ),
            child: Text(
              "Choose Your Extras:",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getWidth(context) * 10/380
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          choose0 = !choose0;
                        });
                      },
                      child: Container(
                        width: getWidth(context) * 20/380,
                        height: getWidth(context) * 20/380,
                        decoration: BoxDecoration(
                          color: choose0 == true ? BajaAppColors.orange : Colors.white,
                          border: Border.all(color: choose0 == true ? Colors.transparent : Colors.black),
                          borderRadius: BorderRadius.circular(getWidth(context) * 5/380)
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: getWidth(context) * 5 / 380),
                      child: Text(
                        "Cardamom",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: getWidth(context) * 5 / 380),
                  child: Text(
                    "SAR. 15",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getWidth(context) * 10/380
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          choose1 = !choose1;
                        });
                      },
                      child: Container(
                        width: getWidth(context) * 20/380,
                        height: getWidth(context) * 20/380,
                        decoration: BoxDecoration(
                            color: choose1 == true ? BajaAppColors.orange : Colors.white,
                            border: Border.all(color: choose1 == true ? Colors.transparent : Colors.black),
                            borderRadius: BorderRadius.circular(getWidth(context) * 5/380)
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: getWidth(context) * 5 / 380),
                      child: Text(
                        "Coffee Spice Mix",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: getWidth(context) * 5 / 380),
                  child: Text(
                    "SAR. 15",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getWidth(context) * 10/380
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          choose2 = !choose2;
                        });
                      },
                      child: Container(
                        width: getWidth(context) * 20/380,
                        height: getWidth(context) * 20/380,
                        decoration: BoxDecoration(
                            color: choose2 == true ? BajaAppColors.orange : Colors.white,
                            border: Border.all(color: choose2 == true ? Colors.transparent : Colors.black),
                            borderRadius: BorderRadius.circular(getWidth(context) * 5/380)
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: getWidth(context) * 5 / 380),
                      child: Text(
                        "Saffron",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: getWidth(context) * 5 / 380),
                  child: Text(
                    "SAR. 15",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getWidth(context) * 10/380
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          choose3 = !choose3;
                        });
                      },
                      child: Container(
                        width: getWidth(context) * 20/380,
                        height: getWidth(context) * 20/380,
                        decoration: BoxDecoration(
                            color: choose3 == true ? BajaAppColors.orange : Colors.white,
                            border: Border.all(color: choose3 == true ? Colors.transparent : Colors.black),
                            borderRadius: BorderRadius.circular(getWidth(context) * 5/380)
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: getWidth(context) * 5 / 380),
                      child: Text(
                        "Cloves",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: getWidth(context) * 5 / 380),
                  child: Text(
                    "SAR. 15",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
