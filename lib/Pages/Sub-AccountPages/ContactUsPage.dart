import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  TextEditingController messageController;
  int selectedDropDownValue = 0;
  int dropDownValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messageController = new TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top * 1.2,
          left: getWidth(context) * 30 / 380,
          right: getWidth(context) * 30 / 380,
        ),
        child: ListView(
          shrinkWrap: true,
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
                top: getWidth(context) * 20 / 380,
                left: getWidth(context) * 10 / 380,
                right: getWidth(context) * 10 / 380,
              ),
              child: Text(
                "Shadad Ali",
                style: TextStyle(
                    color: BajaAppColors.orange,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: getWidth(context) * 3 / 380,
                left: getWidth(context) * 10 / 380,
                right: getWidth(context) * 10 / 380,
              ),
              child: Text(
                "shadad@gmail.com",
                style: TextStyle(
                    color: BajaAppColors.textGray,
                    fontSize: 14,
                    letterSpacing: 0.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: getWidth(context) * 3 / 380,
                left: getWidth(context) * 10 / 380,
                right: getWidth(context) * 10 / 380,
              ),
              child: Text(
                "+966 500000000",
                style: TextStyle(
                    color: BajaAppColors.textGray,
                    fontSize: 14,
                    letterSpacing: 0.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: getWidth(context) * 25 / 380,
                left: getWidth(context) * 10 / 380,
                right: getWidth(context) * 10 / 380,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: BajaAppColors.textGray.withOpacity(0.1),
                    border: Border.all(
                        color: BajaAppColors.textGray.withOpacity(0.1)),
                    borderRadius: BorderRadius.all(
                        Radius.circular(getWidth(context) * 15 / 380))),
                padding: EdgeInsets.symmetric(
                  vertical: getWidth(context) * 2 / 380,
                  horizontal: getWidth(context) * 20 / 380,
                ),
                child: DropdownButton(
                  value: dropDownValue,
                  onChanged: (value) {
                    setState(() {
                      dropDownValue = value;
                    });
                  },
                  isExpanded: true,
                  icon: FaIcon(
                    FontAwesomeIcons.chevronDown,
                    color: BajaAppColors.orange,
                    size: getWidth(context) * 15 / 380,
                  ),
                  underline: SizedBox(),
                  items: [
                    DropdownMenuItem(
                      value: 0,
                      child: Text(
                        "Reason",
                        style: TextStyle(
                            color: BajaAppColors.orange,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text(
                        "test_data",
                        style: TextStyle(
                            color: BajaAppColors.orange,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: getWidth(context) * 20 / 380,
                left: getWidth(context) * 10 / 380,
                right: getWidth(context) * 10 / 380,
              ),
              child: TextField(
                minLines: 9,
                maxLines: 9,
                decoration: InputDecoration(
                    hintText: "Message",
                    hintStyle: TextStyle(
                        color: BajaAppColors.textGray.withOpacity(0.5)),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: getWidth(context) * 20 / 380,
                        vertical: getWidth(context) * 20 / 380),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: BajaAppColors.textGray.withOpacity(0.1),
                            width: 3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: BajaAppColors.textGray.withOpacity(0.1),
                            width: 3)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: BajaAppColors.textGray.withOpacity(0.1),
                            width: 3)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: BajaAppColors.textGray.withOpacity(0.1),
                            width: 3))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: getWidth(context) * 20 / 380,
                left: getWidth(context) * 10 / 380,
                right: getWidth(context) * 10 / 380,
              ),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.all(
                          Radius.circular(getWidth(context) * 15 / 380)),
                      child: Container(
                        height: getWidth(context) * 50 / 380,
                        decoration: BoxDecoration(
                            color: BajaAppColors.textGray.withOpacity(0.1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(getWidth(context) * 15 / 380))),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.camera,
                            color: BajaAppColors.orange,
                            size: getWidth(context) * 30 / 380,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getWidth(context) * 20 / 380,
                  ),
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.all(
                          Radius.circular(getWidth(context) * 15 / 380)),
                      child: Container(
                        height: getWidth(context) * 50 / 380,
                        decoration: BoxDecoration(
                            color: BajaAppColors.textGray.withOpacity(0.1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(getWidth(context) * 15 / 380))),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.paperclip,
                            color: BajaAppColors.orange,
                            size: getWidth(context) * 30 / 380,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                  Navigator.pop(context);
                },
                color: BajaAppColors.orange,
                height: getWidth(context) * 50 / 380,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(getWidth(context) * 10 / 380))),
                child: Center(
                  child: Text(
                    "Submit",
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
    );
  }
}
