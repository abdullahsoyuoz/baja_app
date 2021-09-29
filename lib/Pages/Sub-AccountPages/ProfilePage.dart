import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

import 'ChangePasswordPage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ScrollController singleChildScrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleChildScrollController = ScrollController();
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
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
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
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 40 / 380,
                  left: getWidth(context) * 10 / 380,
                  right: getWidth(context) * 10 / 380,
                ),
                child: Text(
                  "Name",
                  style: TextStyle(
                      color: BajaAppColors.navyBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 20 / 380,
                  left: getWidth(context) * 10 / 380,
                  right: getWidth(context) * 10 / 380,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shadad Ali",
                      style: TextStyle(
                          color: BajaAppColors.textGray,
                          fontSize: 18,
                          letterSpacing: 0.5),
                    ),
                    FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: BajaAppColors.textGray.withOpacity(0.5),
                      size: getWidth(context) * 15 / 380,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 20 / 380,
                  left: getWidth(context) * 10 / 380,
                  right: getWidth(context) * 10 / 380,
                ),
                child: Divider(thickness: 1,),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 40 / 380,
                  left: getWidth(context) * 10 / 380,
                  right: getWidth(context) * 10 / 380,
                ),
                child: Text(
                  "Email",
                  style: TextStyle(
                      color: BajaAppColors.navyBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 20 / 380,
                  left: getWidth(context) * 10 / 380,
                  right: getWidth(context) * 10 / 380,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shadad@gmail.com",
                      style: TextStyle(
                          color: BajaAppColors.textGray,
                          fontSize: 18,
                          letterSpacing: 0.5),
                    ),
                    FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: BajaAppColors.textGray.withOpacity(0.5),
                      size: getWidth(context) * 15 / 380,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 20 / 380,
                  left: getWidth(context) * 10 / 380,
                  right: getWidth(context) * 10 / 380,
                ),
                child: Divider(thickness: 1,),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 40 / 380,
                  left: getWidth(context) * 10 / 380,
                  right: getWidth(context) * 10 / 380,
                ),
                child: Text(
                  "Phone Number",
                  style: TextStyle(
                      color: BajaAppColors.navyBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 20 / 380,
                  left: getWidth(context) * 10 / 380,
                  right: getWidth(context) * 10 / 380,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "+966 500000000",
                      style: TextStyle(
                          color: BajaAppColors.textGray,
                          fontSize: 18,
                          letterSpacing: 0.5),
                    ),
                    FaIcon(
                      FontAwesomeIcons.chevronRight,
                      color: BajaAppColors.textGray.withOpacity(0.5),
                      size: getWidth(context) * 15 / 380,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 20 / 380,
                  left: getWidth(context) * 10 / 380,
                  right: getWidth(context) * 10 / 380,
                ),
                child: Divider(thickness: 1,),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 50 / 380,
                  bottom: getWidth(context) * 20 / 380,
                  left: getWidth(context) * 10 / 380,
                  right: getWidth(context) * 10 / 380,
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => ChangePasswordPage(),));
                  },
                  color: BajaAppColors.orange,
                  height: getWidth(context) * 50 / 380,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(getWidth(context) * 10 / 380))),
                  child: Center(
                    child: Text(
                      "Change Password",
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
        ),
      ),
    );
  }
}
