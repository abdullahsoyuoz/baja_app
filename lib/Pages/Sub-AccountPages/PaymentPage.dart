import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/fakeData.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

class UserPaymentPage extends StatefulWidget {
  @override
  _UserPaymentPageState createState() => _UserPaymentPageState();
}

class _UserPaymentPageState extends State<UserPaymentPage> {
  ScrollController singleChildScrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleChildScrollController = new ScrollController();
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: singleChildScrollController,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top * 1.2,
            left: getWidth(context) * 30 / 380,
            right: getWidth(context) * 30 / 380,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/logo/baja_logo.png",
                  width: getWidth(context) * 80 / 380,
                  height: getWidth(context) * 40 / 380,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: BajaAppColors.navyBlue,
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: FakeData.fakeCreditCardList.length,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(
                    horizontal: getWidth(context) * 5 / 380,
                    vertical: getWidth(context) * 20 / 380),
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: getWidth(context) * 10 / 380,
                      horizontal: getWidth(context) * 15 / 380,
                    ),
                    child: Divider(
                      thickness: 1,
                      color: BajaAppColors.textGray.withOpacity(0.2),
                    ),
                  );
                },
                itemBuilder: (context, index) {
                  return buildOrderItem(
                      context, FakeData.fakeCreditCardList[index]);
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 20 / 380,
                  bottom: getWidth(context) * 20 / 380,
                  left: getWidth(context) * 15 / 380,
                  right: getWidth(context) * 15 / 380,
                ),
                child: FlatButton(
                  color: BajaAppColors.orange,
                  height: getWidth(context) * 50/380,
                  padding: EdgeInsets.symmetric(
                      vertical: getWidth(context) * 15/380
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(getWidth(context) * 10 / 380))),
                  child: Center(
                    child: Text(
                      "Add Card",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  onPressed: () {

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOrderItem(BuildContext context, FakeCreditCard item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 10 / 380),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 15 / 380,
                    ),
                    child: Text(
                      "Card Ending In",
                      style: TextStyle(
                          color: BajaAppColors.navyBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 15 / 380,
                    ),
                    child: Text(
                      "Card Name",
                      style: TextStyle(
                          color: BajaAppColors.navyBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 15 / 380,
                    ),
                    child: Text(
                      "Expires End Of",
                      style: TextStyle(
                          color: BajaAppColors.navyBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 15 / 380,
                    ),
                    child: Text(
                      "${item.endingIn}",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 15 / 380,
                    ),
                    child: Text(
                      "${item.cardName}",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 15 / 380,
                    ),
                    child: Text(
                      "${item.expiresEndOf}",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                    padding: EdgeInsets.all(getWidth(context) * 3 / 380),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: BajaAppColors.navyBlue, width: 1)),
                    child: Center(
                        child: Image.asset(
                      item.imagePath,
                      color: BajaAppColors.navyBlue,
                      height: getWidth(context) * 20/380,
                      width: getWidth(context) * 35/380,
                    ))),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: getWidth(context) * 20 / 380),
            child: OutlineButton(
              color: Colors.white,
              highlightedBorderColor: Colors.transparent,
              borderSide: BorderSide(color: BajaAppColors.textGray.withOpacity(0.2)),
              padding: EdgeInsets.symmetric(
                vertical: getWidth(context) * 15/380
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(getWidth(context) * 10 / 380))),
              child: Center(
                child: Text(
                  "Delete Card",
                  style: TextStyle(
                      color: BajaAppColors.orange,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
              onPressed: () {

              },
            ),
          ),
        ],
      ),
    );
  }
}
