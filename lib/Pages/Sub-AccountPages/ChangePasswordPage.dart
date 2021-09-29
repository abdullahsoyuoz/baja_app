import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  ScrollController singleChildScrollController;
  TextEditingController currentPassword = new TextEditingController();
  TextEditingController newPassword = new TextEditingController();

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
                  top: getWidth(context) * 60/380,
                  left: getWidth(context) * 15/380,
                  right: getWidth(context) * 15/380,
                ),
                child: TextField(
                  controller: currentPassword,
                  decoration: InputDecoration(
                    hintText: "Current Password",
                    hintStyle: TextStyle(color: BajaAppColors.textGray.withOpacity(0.5)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: BajaAppColors.textGray.withOpacity(0.3))
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: BajaAppColors.textGray.withOpacity(0.3))
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 60/380,
                  left: getWidth(context) * 15/380,
                  right: getWidth(context) * 15/380,
                ),
                child: TextField(
                  controller: newPassword,
                  decoration: InputDecoration(
                    hintText: "New Password",
                    hintStyle: TextStyle(color: BajaAppColors.textGray.withOpacity(0.5)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: BajaAppColors.textGray.withOpacity(0.3))
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: BajaAppColors.textGray.withOpacity(0.3))
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getWidth(context) * 15/380,
                  right: getWidth(context) * 15/380,
                  top: getWidth(context) * 50/380,
                ),
                child: FlatButton(
                  child: Center(child: Text("Save", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),)),
                  color: BajaAppColors.orange,
                  height: getWidth(context) * 50/380,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(getWidth(context) * 10/380))
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
