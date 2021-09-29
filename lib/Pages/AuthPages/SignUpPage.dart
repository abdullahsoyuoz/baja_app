import 'package:baja_app/Pages/MainPageView.dart';
import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController phoneNumberController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController passwordConfirmController;
  ScrollController singleChildScrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneNumberController = new TextEditingController();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
    passwordConfirmController = new TextEditingController();
    singleChildScrollController = new ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    singleChildScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        controller: singleChildScrollController,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(bottom: getWidth(context) * 30 / 380),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top * 1.2,
                left: getWidth(context) * 30 / 380,
                right: getWidth(context) * 30 / 380,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo/baja_logo.png",
                    width: getWidth(context) * 80 / 380,
                    height: getWidth(context) * 40 / 380,
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding:
                      EdgeInsets.only(top: getWidth(context) * 30 / 380),
                    child: Hero(
                      tag: "signUp",
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 30 / 380,
                    ),
                    child: /*Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: getWidth(context) * 30 / 380),
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
                                  color: Colors.black.withOpacity(0.2),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    )*/
                    TextField(
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
                            color: Colors.black.withOpacity(0.2),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 20 / 380,
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
                        hintText: "Email Address *",
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.2),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 20 / 380,
                    ),
                    child: TextField(
                      controller: passwordController,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password *",
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.2),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 20 / 380,
                    ),
                    child: TextField(
                      controller: passwordConfirmController,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Confirm the Password *",
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.2),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getWidth(context) * 20 / 380,
                    ),
                    child: FlatButton(
                      onPressed: () {},
                      color: BajaAppColors.orange,
                      height: getWidth(context) * 50 / 380,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(getWidth(context) * 10 / 380))),
                      child: Center(
                        child: Text(
                          "Sign Up",
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
}
