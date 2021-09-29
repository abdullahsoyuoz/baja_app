/*
 *  DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 *  Copyright (C) 2020 Rich Design - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential.
 *
 *  Written by Yakup Zengin <yakup@designsrich.com>, September 2020
 *
 */
import 'dart:async';
import 'package:baja_app/Pages/StartUpPages/OnBoardingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, run);
  }

  Future run() async {
     runApp(MyApp(OnBoardingPage()));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTime();

    //Provider.of<RegisterPageTextProvider>(context, listen: false).registerPageTextService();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/logo/splash.jpg'), fit: BoxFit.cover),
            ),

          ),
           Positioned(
             bottom: 70.0,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(backgroundColor: Colors.yellow[800],)
                ],
          ),
           )
        ],
      ),
    );
  }

}
