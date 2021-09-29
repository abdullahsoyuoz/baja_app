import 'package:baja_app/Pages/MainPageView.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BajaAppBar extends StatefulWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  MainPageViewState mainPageViewState;
  BajaAppBar(this.scaffoldKey, {this.mainPageViewState});

  @override
  _BajaAppBarState createState() => _BajaAppBarState();
}

class _BajaAppBarState extends State<BajaAppBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context),
      height: getWidth(context) * 100/380,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: getWidth(context) * 5/380,
        right: getWidth(context) * 5/380,
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            icon: Image.asset("assets/icons/menu.png"),
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onPressed: () {
              widget.scaffoldKey.currentState.openDrawer();
            },
          ),
          Image.asset("assets/logo/baja_logo.png",
            height: getWidth(context) * 40/380,
            fit: BoxFit.fitWidth,),
          IconButton(
            icon: Image.asset("assets/icons/shoppingCart.png"),
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onPressed: () {
              widget.mainPageViewState.pageController.jumpToPage(2);
            },
          ),

        ],
      ),
    );
  }
}
