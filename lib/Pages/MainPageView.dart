import 'package:baja_app/Pages/AccountPage.dart';
import 'package:baja_app/Pages/BasketPage.dart';
import 'package:baja_app/Pages/CategoriesPage.dart';
import 'package:baja_app/Pages/HomePage.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:baja_app/Widgets/CustomAppBar.dart';
import 'package:baja_app/Widgets/DrawerMenu.dart';
import 'package:flutter/material.dart';
import 'package:baja_app/Widgets/CustomBottomNavigationBarBackground.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

class MainPageView extends StatefulWidget {
  @override
  MainPageViewState createState() => MainPageViewState();
}

class MainPageViewState extends State<MainPageView> {
  ScrollController _singleChildScrollViewController;
  GlobalKey<ScaffoldState> _scaffoldKey;
  PageController pageController;
  int currentPageIndex = 0;

  List<Widget> views = [
    HomePage(),
    CategoriesPage(),
    BasketPage(),
    AccountPage(),
    // NAVIGATE TO BASKET FROM PRODUCTVIEWPAGE
  ];

  @override
  void initState() {
    super.initState();
    _singleChildScrollViewController = ScrollController();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _singleChildScrollViewController.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    settingRepo.pageViewState.value = this;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      drawer: DrawerMenu(),
      body: Stack(children: [
        Scaffold(
          body: PageView.builder(
            controller: pageController,
            itemCount: views.length,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              setState(() {
                currentPageIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return views[index];
            },
          ),
        ),
        BajaAppBar(
          _scaffoldKey,
          mainPageViewState: this,
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(bottom: getWidth(context) * 0 / 380),
                padding: EdgeInsets.only(
                    left: getWidth(context) * 20 / 380,
                    right: getWidth(context) * 20 / 380,
                    bottom: getWidth(context) * 0 / 380),
                decoration: BoxDecoration(),
                child: Stack(
                  children: [
                    CustomPaint(
                      size:
                          Size(getWidth(context), getWidth(context) * 70 / 380),
                      painter: CustomBottomNavigationBarBackground(),
                    ),
                    Container(
                      height: getWidth(context) * 70 / 380,
                      padding: EdgeInsets.symmetric(
                          horizontal: getWidth(context) * 30 / 380),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: currentPageIndex != 0
                                ? Image.asset(
                                    "assets/icons/home_border.png",
                                  )
                                : Image.asset(
                                    "assets/icons/home.png",
                                  ),
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                currentPageIndex = 0;
                                pageController.jumpToPage(0);
                              });
                            },
                          ),
                          IconButton(
                            icon: currentPageIndex != 1
                                ? Image.asset(
                                    "assets/icons/categorie_border.png",
                                  )
                                : Image.asset(
                                    "assets/icons/categorie.png",
                                  ),
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                currentPageIndex = 1;
                                pageController.jumpToPage(1);
                              });
                            },
                          ),
                          IconButton(
                            icon: currentPageIndex != 2
                                ? Image.asset(
                                    "assets/icons/bag_border.png",
                                  )
                                : Image.asset(
                                    "assets/icons/bag.png",
                                  ),
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                currentPageIndex = 2;
                                pageController.jumpToPage(2);
                              });
                            },
                          ),
                          IconButton(
                            icon: currentPageIndex != 3
                                ? Image.asset(
                                    "assets/icons/person_border.png",
                                  )
                                : Image.asset(
                                    "assets/icons/person.png",
                                  ),
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                currentPageIndex = 3;
                                pageController.jumpToPage(3);
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                )))
      ]),
    );
  }
}
