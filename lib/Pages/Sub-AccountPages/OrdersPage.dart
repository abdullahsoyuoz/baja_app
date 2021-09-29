import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/fakeData.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:baja_app/Widgets/CustomAppBar.dart';
import 'package:baja_app/Widgets/DrawerMenu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

class UserOrdersPage extends StatefulWidget {
  @override
  _UserOrdersPageState createState() => _UserOrdersPageState();
}

class _UserOrdersPageState extends State<UserOrdersPage> {
  GlobalKey<ScaffoldState> scaffoldKey;
  ScrollController singleChildScrollController;
  ScrollController listViewScrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
    singleChildScrollController = new ScrollController();
    listViewScrollController = new ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    singleChildScrollController.dispose();
    listViewScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: DrawerMenu(),
      body: SingleChildScrollView(
        controller: singleChildScrollController,
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BajaAppBar(scaffoldKey),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 10 / 380,
                  bottom: getWidth(context) * 10 / 380,
                  left: getWidth(context) * 25 / 380,
                  right: getWidth(context) * 25 / 380,
                ),
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: BajaAppColors.navyBlue,
                  ),
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: FakeData.fakeOrderList.length,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(context) * 5 / 380,
                  vertical: getWidth(context) * 20 / 380),
              separatorBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getWidth(context) * 10 / 380),
                  child: Divider(
                    thickness: 1,
                    color: BajaAppColors.textGray.withOpacity(0.3),
                  ),
                );
              },
              itemBuilder: (context, index) {
                return buildOrderItem(context, FakeData.fakeOrderList[index]);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildOrderItem(BuildContext context, FakeOrders item) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: getWidth(context) * 25 / 380,
              right: getWidth(context) * 25 / 380,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order# ${item.orderId}",
                  style: TextStyle(
                      color: BajaAppColors.navyBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: BajaAppColors.textGray,
                  size: getWidth(context) * 15 / 380,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getWidth(context) * 3 / 380,
              left: getWidth(context) * 25 / 380,
              right: getWidth(context) * 25 / 380,
            ),
            child: Text(
              "Placed On ${item.date}",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            height: getWidth(context) * 80 / 380,
            width: getWidth(context),
            margin: EdgeInsets.only(
              top: getWidth(context) * 20 / 380,
              bottom: getWidth(context) * 15 / 380,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.only(left: getWidth(context) * 25 / 380),
              itemCount: item.orderList.length,
              itemBuilder: (context, index) {
                return Image.asset(item.orderList[index].imagePath);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getWidth(context) * 3 / 380,
              left: getWidth(context) * 25 / 380,
              right: getWidth(context) * 25 / 380,
            ),
            child: Text(
              item.type == false ? "Estimated Time of Delivery on ${item.estimatedTime}" : "Delivered on ${item.estimatedTime}" ,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
          ),
          item.type == false
              ? Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 10 / 380,
                    left: getWidth(context) * 25 / 380,
                    right: getWidth(context) * 25 / 380,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: getWidth(context) * 30 / 380,
                        width: getWidth(context) * 120 / 380,
                        decoration: BoxDecoration(
                            color: BajaAppColors.textGray.withOpacity(0.1),
                            border: Border.all(
                                color: BajaAppColors.textGray.withOpacity(0.1)),
                            borderRadius: BorderRadius.all(
                                Radius.circular(getWidth(context) * 10 / 380))),
                        child: Center(
                          child: Text(
                            "Under Process",
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: getWidth(context) * 50 / 380,
                      ),
                      Container(
                        height: getWidth(context) * 30 / 380,
                        width: getWidth(context) * 120 / 380,
                        decoration: BoxDecoration(
                            color: BajaAppColors.orange,
                            borderRadius: BorderRadius.all(
                                Radius.circular(getWidth(context) * 10 / 380))),
                        child: Center(
                          child: Text(
                            "Tracking",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 10 / 380,
                    left: getWidth(context) * 25 / 380,
                    right: getWidth(context) * 25 / 380,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: getWidth(context) * 30 / 380,
                        width: getWidth(context) * 120 / 380,
                        decoration: BoxDecoration(
                            color: BajaAppColors.textGray.withOpacity(0.1),
                            border: Border.all(
                                color: BajaAppColors.textGray.withOpacity(0.1)),
                            borderRadius: BorderRadius.all(
                                Radius.circular(getWidth(context) * 10 / 380))),
                        child: Center(
                          child: Text(
                            "Delivered",
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
