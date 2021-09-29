import 'package:baja_app/Pages/Sub-OrderPages/DeliveryAddressPage.dart';
import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

class SignInVerificationPage extends StatefulWidget {
  @override
  _SignInVerificationPageState createState() => _SignInVerificationPageState();
}

class _SignInVerificationPageState extends State<SignInVerificationPage> {
  TextEditingController pincodeController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pincodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top * 1.2,
              left: getWidth(context) * 40 / 380,
              right: getWidth(context) * 40 / 380,
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/logo/baja_logo.png",
                    width: getWidth(context) * 80 / 380,
                    height: getWidth(context) * 40 / 380,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) * 30 / 380),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 50/380
                  ),
                  child: Text(
                    "Please Enter The Verification Code From The Sms We Just Sent You",
                    style: TextStyle(
                      color: BajaAppColors.textGray,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: getWidth(context) * 20/380
                  ),
                  child: Text(
                    "1.36",
                    style: TextStyle(
                        color: BajaAppColors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) * 50/380),
                  child: PinCodeTextField(
                    appContext: context,
                    controller: pincodeController,
                    length: 4,
                    keyboardType: TextInputType.number,
                    showCursor: false,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    pinTheme: PinTheme(
                      borderWidth: 1,
                      borderRadius: BorderRadius.all(Radius.circular(getWidth(context) * 10/380)),
                      shape: PinCodeFieldShape.box,
                      fieldHeight: getWidth(context) * 60/380,
                      fieldWidth: getWidth(context) * 60/380,
                    ),
                    onCompleted: (value) {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) {
                        return DeliveryAddressPage();
                      },));
                    },
                    onChanged: (value) {

                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: getWidth(context) * 70/380
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Resend",
                      style: TextStyle(
                          color: BajaAppColors.navyBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: getWidth(context) * 20/380
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Change Mobile or Email",
                      style: TextStyle(
                          color: BajaAppColors.navyBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
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
                  top: getWidth(context) * 100 / 380,
                  right: getWidth(context) * 20 / 380),
              child: InkWell(
                onTap: () {
                  pincodeController = new TextEditingController();
                  return Navigator.pop(context);
                },
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
