import 'package:baja_app/Pages/AuthPages/SignInVerificationPage.dart';
import 'package:baja_app/Pages/Sub-OrderPages/DeliveryAddressPage.dart';
import 'package:baja_app/Pages/AuthPages/SignUpPage.dart';
import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController usernameController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController = new TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: getWidth(context) * 40 / 380,
              right: getWidth(context) * 40 / 380,
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/logo/baja_logo.png",
                    width: getWidth(context) * 80 / 380,
                    height: getWidth(context) * 40 / 380,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: getWidth(context) * 30 / 380),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) * 90 / 380),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: BajaAppColors.textGray.withOpacity(0.2),
                              style: BorderStyle.solid)),
                      hintText: "Phone Number or Email",
                      hintStyle: TextStyle(
                          color: BajaAppColors.textGray.withOpacity(0.5)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) * 50 / 380),
                  child: FlatButton(
                    color: BajaAppColors.orange,
                    height: getWidth(context) * 50 / 380,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(getWidth(context) * 10 / 380))),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => SignInVerificationPage(),
                          ));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) * 60 / 380),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Container(
                        height: 1,
                        color: BajaAppColors.textGray,
                      )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getWidth(context) * 10 / 380),
                        child: Text(
                          "Or",
                          style: TextStyle(
                              color: BajaAppColors.textGray, fontSize: 18),
                        ),
                      ),
                      Flexible(
                          child: Container(
                        height: 1,
                        color: BajaAppColors.textGray,
                      )),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: getWidth(context) * 50 / 380),
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => SignUpPage(),
                          )),
                      child: Hero(
                        tag: "signUp",
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: BajaAppColors.navyBlue,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: getWidth(context) * 20 / 380),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => DeliveryAddressPage(),
                            ));
                      },
                      child: Text(
                        "Continue as a Guest",
                        style: TextStyle(
                            color: BajaAppColors.navyBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                  top: getWidth(context) * 50 / 380,
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
    );
  }
}
