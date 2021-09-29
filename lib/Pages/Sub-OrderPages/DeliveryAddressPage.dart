import 'package:baja_app/Pages/Sub-OrderPages/OrderReviewPage.dart';
import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:baja_app/Widgets/CustomAppBar.dart';
import 'package:baja_app/Widgets/DrawerMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

class DeliveryAddressPage extends StatefulWidget {
  @override
  _DeliveryAddressPageState createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  GlobalKey<ScaffoldState> _scaffoldKey;
  ScrollController singleChildScrollController;
  int selectedRadioValue = 0;
  int selectedRadioPickUpValue = 0;
  int selectState = 0;
  int selectCity = 0;
  TextEditingController deliveryAddressController;
  TextEditingController apartmentAddressController;
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController emailController;
  TextEditingController phoneNumberController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    singleChildScrollController = ScrollController();
    deliveryAddressController = new TextEditingController();
    apartmentAddressController = new TextEditingController();
    firstNameController = new TextEditingController();
    lastNameController = new TextEditingController();
    emailController = new TextEditingController();
    phoneNumberController = new TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    singleChildScrollController.dispose();
    deliveryAddressController.dispose();
    apartmentAddressController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
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
        padding: EdgeInsets.only(bottom: getWidth(context) * 30 / 380),
        child: Stack(
          children: [
            Column(
              children: [
                BajaAppBar(_scaffoldKey),
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) * 20 / 380),
                  child: Text(
                    "Delivery Address",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 40 / 380,
                    left: getWidth(context) * 40 / 380,
                    right: getWidth(context) * 40 / 380,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildRadioItem(context, 0, "Delivery"),
                      buildRadioItem(context, 1, "Pick Up"),
                    ],
                  ),
                ),
                selectedRadioValue == 0
                    ? buildDeliveryBody(context)
                    : buildPickUpBody(context),
                Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 40 / 380,
                    left: getWidth(context) * 20 / 380,
                    right: getWidth(context) * 20 / 380,
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => OrderReviewPage(),
                          ));
                    },
                    color: BajaAppColors.orange,
                    height: getWidth(context) * 50 / 380,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(getWidth(context) * 10 / 380))),
                    child: Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                )
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

  buildRadioItem(BuildContext context, int index, String title) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          if (selectedRadioValue != index) {
            selectedRadioValue = index;
          }
        });
      },
      child: Row(
        children: [
          Container(
            width: getWidth(context) * 20 / 380,
            height: getWidth(context) * 20 / 380,
            decoration: BoxDecoration(
                color: selectedRadioValue == index
                    ? BajaAppColors.orange
                    : Colors.white,
                border: Border.all(
                    color: selectedRadioValue == index
                        ? Colors.transparent
                        : BajaAppColors.textGray,
                    width: 1),
                shape: BoxShape.circle),
          ),
          Padding(
            padding: EdgeInsets.only(left: getWidth(context) * 5 / 380),
            child: Text(
              "$title",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }

  buildDeliveryBody(BuildContext context) {
    return Column(
      children: [
        Container(
          width: getWidth(context),
          height: getWidth(context) * 0.4,
          margin: EdgeInsets.only(top: getWidth(context) * 30 / 380),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: BajaAppColors.textGray, blurRadius: 0.5)
          ]),
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
            top: getWidth(context) * 10 / 380,
            left: getWidth(context) * 40 / 380,
            right: getWidth(context) * 40 / 380,
          ),
          child: DropdownButton(
            value: selectState,
            underline: SizedBox(),
            isExpanded: true,
            icon: FaIcon(
              FontAwesomeIcons.chevronDown,
              size: getWidth(context) * 15 / 380,
              color: BajaAppColors.textGray,
            ),
            onChanged: (value) {
              setState(() {
                selectState = value;
              });
            },
            items: [
              DropdownMenuItem(
                child: Text(
                  "State*",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                value: 0,
              ),
              DropdownMenuItem(
                child: Text("test_data"),
                value: 1,
              ),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getWidth(context) * 40 / 380),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: getWidth(context) * 10 / 380,
            left: getWidth(context) * 40 / 380,
            right: getWidth(context) * 40 / 380,
          ),
          child: DropdownButton(
            value: selectCity,
            underline: SizedBox(),
            isExpanded: true,
            icon: FaIcon(
              FontAwesomeIcons.chevronDown,
              size: getWidth(context) * 15 / 380,
              color: BajaAppColors.textGray,
            ),
            onChanged: (value) {
              setState(() {
                selectCity = value;
              });
            },
            items: [
              DropdownMenuItem(
                child: Text(
                  "City*",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                value: 0,
              ),
              DropdownMenuItem(
                child: Text("test_data"),
                value: 1,
              ),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getWidth(context) * 40 / 380),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: getWidth(context) * 10 / 380,
            left: getWidth(context) * 40 / 380,
            right: getWidth(context) * 40 / 380,
          ),
          child: TextField(
            controller: deliveryAddressController,
            maxLines: 1,
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 16,
                fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Delivery Address*",
              hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getWidth(context) * 40 / 380),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: getWidth(context) * 10 / 380,
            left: getWidth(context) * 40 / 380,
            right: getWidth(context) * 40 / 380,
          ),
          child: TextField(
            controller: apartmentAddressController,
            maxLines: 1,
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 16,
                fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Apartment # / Hotel Room / Villa # *",
              hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getWidth(context) * 40 / 380),
          child: Divider(),
        ),
        Row(
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 10 / 380,
                  left: getWidth(context) * 40 / 380,
                  right: getWidth(context) * 10 / 380,
                ),
                child: TextField(
                  controller: firstNameController,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "First Name *",
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 10 / 380,
                  left: getWidth(context) * 10 / 380,
                  right: getWidth(context) * 40 / 380,
                ),
                child: TextField(
                  controller: lastNameController,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Last Name *",
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getWidth(context) * 40 / 380),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: getWidth(context) * 10 / 380,
            left: getWidth(context) * 40 / 380,
            right: getWidth(context) * 40 / 380,
          ),
          child: TextField(
            controller: emailController,
            maxLines: 1,
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 16,
                fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Email *",
              hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getWidth(context) * 40 / 380),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: getWidth(context) * 10 / 380,
            left: getWidth(context) * 40 / 380,
            right: getWidth(context) * 40 / 380,
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: getWidth(context) * 30 / 380),
                child: DropdownButton(
                  underline: SizedBox(),
                  isExpanded: false,
                  icon: FaIcon(
                    FontAwesomeIcons.chevronDown,
                    size: getWidth(context) * 15 / 380,
                    color: BajaAppColors.textGray,
                  ),
                  onChanged: (value) {},
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        "+966*",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    DropdownMenuItem(
                      child: Text("test_data"),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: phoneNumberController,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Phone Number *",
                    hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getWidth(context) * 40 / 380),
          child: Divider(),
        )
      ],
    );
  }

  buildPickUpBody(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: getWidth(context) * 40 / 380,
            left: getWidth(context) * 40 / 380,
            right: getWidth(context) * 40 / 380,
          ),
          child: DropdownButton(
            value: selectState,
            underline: SizedBox(),
            isExpanded: true,
            icon: FaIcon(
              FontAwesomeIcons.chevronDown,
              size: getWidth(context) * 15 / 380,
              color: BajaAppColors.textGray,
            ),
            onChanged: (value) {
              setState(() {
                selectState = value;
              });
            },
            items: [
              DropdownMenuItem(
                child: Text(
                  "State*",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                value: 0,
              ),
              DropdownMenuItem(
                child: Text("test_data"),
                value: 1,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: getWidth(context) * 10 / 380,
            left: getWidth(context) * 40 / 380,
            right: getWidth(context) * 40 / 380,
          ),
          child: DropdownButton(
            value: selectCity,
            underline: SizedBox(),
            isExpanded: true,
            icon: FaIcon(
              FontAwesomeIcons.chevronDown,
              size: getWidth(context) * 15 / 380,
              color: BajaAppColors.textGray,
            ),
            onChanged: (value) {
              setState(() {
                selectCity = value;
              });
            },
            items: [
              DropdownMenuItem(
                child: Text(
                  "City*",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                value: 0,
              ),
              DropdownMenuItem(
                child: Text("test_data"),
                value: 1,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: getWidth(context) * 60/380,
            left: getWidth(context) * 40/380,
            right: getWidth(context) * 40/380,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Al Khaleej Road",
                style: TextStyle(
                    color: BajaAppColors.textGray,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedRadioPickUpValue = 0;
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  width: getWidth(context) * 20 / 380,
                  height: getWidth(context) * 20 / 380,
                  decoration: BoxDecoration(
                      color: selectedRadioPickUpValue == 0
                          ? BajaAppColors.orange
                          : Colors.white,
                      border: Border.all(
                          color: selectedRadioPickUpValue == 0
                              ? Colors.transparent
                              : BajaAppColors.textGray,
                          width: 1),
                      shape: BoxShape.circle),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: getWidth(context) * 40/380,
            left: getWidth(context) * 40/380,
            right: getWidth(context) * 40/380,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Umar Ibn Al Khattad Street",
                style: TextStyle(
                    color: BajaAppColors.textGray,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedRadioPickUpValue = 1;
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  width: getWidth(context) * 20 / 380,
                  height: getWidth(context) * 20 / 380,
                  decoration: BoxDecoration(
                      color: selectedRadioPickUpValue == 1
                          ? BajaAppColors.orange
                          : Colors.white,
                      border: Border.all(
                          color: selectedRadioPickUpValue == 1
                              ? Colors.transparent
                              : BajaAppColors.textGray,
                          width: 1),
                      shape: BoxShape.circle),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: getWidth(context) * 40/380,
            left: getWidth(context) * 40/380,
            right: getWidth(context) * 40/380,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Prince Naif Bin Abdul Aziz",
                style: TextStyle(
                    color: BajaAppColors.textGray,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedRadioPickUpValue = 2;
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  width: getWidth(context) * 20 / 380,
                  height: getWidth(context) * 20 / 380,
                  decoration: BoxDecoration(
                      color: selectedRadioPickUpValue == 2
                          ? BajaAppColors.orange
                          : Colors.white,
                      border: Border.all(
                          color: selectedRadioPickUpValue == 2
                              ? Colors.transparent
                              : BajaAppColors.textGray,
                          width: 1),
                      shape: BoxShape.circle),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: getWidth(context) * 40/380,
            left: getWidth(context) * 40/380,
            right: getWidth(context) * 40/380,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Al Qudus Street",
                style: TextStyle(
                    color: BajaAppColors.textGray,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedRadioPickUpValue = 3;
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  width: getWidth(context) * 20 / 380,
                  height: getWidth(context) * 20 / 380,
                  decoration: BoxDecoration(
                      color: selectedRadioPickUpValue == 3
                          ? BajaAppColors.orange
                          : Colors.white,
                      border: Border.all(
                          color: selectedRadioPickUpValue == 3
                              ? Colors.transparent
                              : BajaAppColors.textGray,
                          width: 1),
                      shape: BoxShape.circle),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
