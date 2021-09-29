import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(
          top: getWidth(context) * 100 / 380,
          left: getWidth(context) * 30 / 380,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //  LOGO
            Padding(
              padding: EdgeInsets.only(bottom: getWidth(context) * 30 / 380),
              child: Image.asset(
                "assets/logo/baja_logo.png",
                width: getWidth(context) * 140 / 380,
                fit: BoxFit.fitWidth,
              ),
            ),
            //  MENU ITEMS
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  child: Text(
                    "About",
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text(
                    "Shipping & Delivery",
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text(
                    "Terms & Conditions",
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text(
                    "Returns & Refunds",
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text(
                    "FAQs",
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            //  VISIT US
            Padding(
              padding: EdgeInsets.only(bottom: getWidth(context) * 50 / 380,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    child: Text(
                      "Visit Us:",
                      style: TextStyle(color: Colors.black54, fontSize: 20),
                    ),
                    onPressed: () => null,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: getWidth(context) * 50 / 380),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                            color: BajaAppColors.navyBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    getWidth(context) * 7 / 380)),
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            minWidth: getWidth(context) * 30 / 380,
                            height: getWidth(context) * 30 / 380,
                            child: FaIcon(
                              FontAwesomeIcons.instagram,
                              color: Colors.white,
                              size: getWidth(context) * 20 / 380,
                            )),
                        FlatButton(
                            color: BajaAppColors.navyBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    getWidth(context) * 7 / 380)),
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            minWidth: getWidth(context) * 30 / 380,
                            height: getWidth(context) * 30 / 380,
                            child: FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.white,
                              size: getWidth(context) * 20 / 380,
                            )),
                        FlatButton(
                            color: BajaAppColors.navyBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    getWidth(context) * 7 / 380)),
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            minWidth: getWidth(context) * 30 / 380,
                            height: getWidth(context) * 30 / 380,
                            child: FaIcon(
                              FontAwesomeIcons.twitter,
                              color: Colors.white,
                              size: getWidth(context) * 20 / 380,
                            )),
                        FlatButton(
                            color: BajaAppColors.navyBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    getWidth(context) * 7 / 380)),
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            minWidth: getWidth(context) * 30 / 380,
                            height: getWidth(context) * 30 / 380,
                            child: FaIcon(
                              FontAwesomeIcons.youtube,
                              color: Colors.white,
                              size: getWidth(context) * 20 / 380,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
