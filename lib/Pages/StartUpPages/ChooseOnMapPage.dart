import 'package:baja_app/Pages/MainPageView.dart';
import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

class ChooseOnMap extends StatefulWidget {
  @override
  _ChooseOnMapState createState() => _ChooseOnMapState();
}

class _ChooseOnMapState extends State<ChooseOnMap> {
  ScrollController singleChildScrollController;
  ScrollController listViewScrollController;
  TextEditingController setYourLocationController;
  int currentIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleChildScrollController = ScrollController();
    listViewScrollController = ScrollController();
    setYourLocationController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    singleChildScrollController.dispose();
    listViewScrollController.dispose();
    setYourLocationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top +
                getWidth(context) * 10 / 380,
            bottom: getWidth(context) * 25 / 380),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/firstMap.png"),
                fit: BoxFit.cover,
                alignment: Alignment.centerRight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(context) * 30 / 380),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 4,
                    child: Container(
                      height: getWidth(context) * 60 / 380,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: BajaAppColors.textGray.withOpacity(0.3),
                                blurRadius: 5)
                          ],
                          borderRadius: BorderRadius.all(
                              Radius.circular(getWidth(context) * 20 / 380))),
                      child: Center(
                        child: TextField(
                          controller: setYourLocationController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: getWidth(context) * 20 / 380),
                              border: InputBorder.none,
                              hintText: "set your location",
                              hintStyle: TextStyle(
                                fontSize: 20,
                                  color:
                                      BajaAppColors.textGray.withOpacity(0.3))),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getWidth(context) * 10 / 380,
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: getWidth(context) * 60 / 380,
                      width: getWidth(context) * 60 / 380,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: BajaAppColors.textGray.withOpacity(0.3),
                                blurRadius: 5)
                          ],
                          borderRadius: BorderRadius.all(
                              Radius.circular(getWidth(context) * 20 / 380))),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.dotCircle,
                          color: BajaAppColors.textGray.withOpacity(0.7),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  height: getWidth(context) * 65/380,
                  child: ListView(
                    controller: listViewScrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    padding:
                        EdgeInsets.only(
                          left: getWidth(context) * 30 / 380,
                          bottom: getWidth(context) * 15 / 380
                        ),
                    children: [
                      buildSelectItem(context, "HOME", 0),
                      buildSelectItem(context, "WORK", 1),
                      buildSelectItem(context, "FRIEND'S HOUSE", 2),
                      buildSelectItem(context, "OTHER", 3),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getWidth(context) * 30 / 380),
                  child: FlatButton(
                    color: BajaAppColors.orange,
                    height: getWidth(context) * 60 / 380,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(getWidth(context) * 20 / 380))),
                    child: Center(
                      child: Text(
                        "Select",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1),
                      ),
                    ),
                    onPressed: () {
                      if(currentIndex != -1){
                        Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => MainPageView(),), (route) => false);
                      }
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  buildSelectItem(BuildContext context, String title, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        height: getWidth(context) * 50 / 380,
        width: getWidth(context) * 150 / 380,
        margin: EdgeInsets.only(
            top: getWidth(context) * 2/380,
            bottom: getWidth(context) * 2/380,
            right: getWidth(context) * 10/380
        ),
        decoration: BoxDecoration(
            color: index == currentIndex ? BajaAppColors.navyBlue : Colors.white,
            boxShadow: [
              BoxShadow(
                  color:
                  BajaAppColors.textGray.withOpacity(0.3),
                  blurRadius: 5)
            ],
            borderRadius: BorderRadius.all(
                Radius.circular(getWidth(context) * 17 / 380))),
        child: Center(
          child: Text(
            "$title",
            style: TextStyle(
                color: index == currentIndex ? Colors.white : BajaAppColors.navyBlue,
                fontSize: 15,
                fontWeight: FontWeight.w800,
                letterSpacing: 1),
          ),
        ),
      ),
    );
  }
}
