import 'dart:async';
import 'package:baja_app/Pages/ProductPages/ProductViewPage.dart';
import 'package:baja_app/Utility/BoxDecorations.dart';
import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/Paddings.dart';
import 'package:baja_app/Utility/Painters.dart';
import 'package:baja_app/Utility/Styles.dart';
import 'package:baja_app/Utility/fakeData.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:baja_app/rest/controller/widget/baja_express_provider.dart';
import 'package:baja_app/rest/controller/widget/best_seller_provider.dart';
import 'package:baja_app/rest/controller/widget/mood_today_provider.dart';
import 'package:baja_app/rest/controller/widget/occasions_provider.dart';
import 'package:baja_app/rest/controller/widget/shopping_category_provider.dart';
import 'package:baja_app/rest/controller/widget/side_category_provider.dart';
import 'package:baja_app/rest/controller/widget/todays_taste_provider.dart';
import 'package:baja_app/rest/entity/widget/baja_express_entity.dart';
import 'package:baja_app/rest/entity/widget/best_sellers_entity.dart';
import 'package:baja_app/rest/entity/widget/mood_today_entity.dart';
import 'package:baja_app/rest/entity/widget/occasions_entity.dart';
import 'package:baja_app/rest/entity/widget/shopping_category_entity.dart';
import 'package:baja_app/rest/entity/widget/side_category_entity.dart';
import 'package:baja_app/rest/entity/widget/todays_taste_entity.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ScrollController homeScrollController;
  CarouselController carouselController;
  int currentCarouselIndex = 0;
  int lastCarouselIndex = 1;
  var dropValue = 0;

  AnimationController carouselTextAnimationController;

  String carouselTitle = "Sale";
  String carouselSubTitle = "Up To 45% Off";

  @override
  void initState() {
    super.initState();
    homeScrollController = ScrollController();
    carouselController = CarouselController();
    carouselTextAnimationController = AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    Timer(Duration(milliseconds: 50), () => carouselTextAnimationController.forward());
  }

  @override
  void dispose() {
    homeScrollController.dispose();
    carouselTextAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<OccasionsEntity> occasionsDataList = Provider.of<OccasionsProvider>(context, listen: true).occasionsListData;
    List<MoodTodayEntity> moodToDaysList = Provider.of<MoodToDayProvider>(context, listen: true).moodTodayListData;
    List<BajaExpressEntity> bajaExpressProductDataList = Provider.of<BajaExpressProvider>(context, listen: true).bajaExpressProductList;
    List<BestSellerEntity> bestSellerProductDataList = Provider.of<BestSellerProvider>(context, listen: true).bestSellerProductList;
    List<ToDaysTasteEntity> toDaysTasteDataList = Provider.of<ToDaysTasteProvider>(context, listen: true).toDaysTasteListData;
    List<ShoppingCategoryEntity> shoppingCategoryList = Provider.of<ShoppingCategoryProvider>(context, listen: true).shoppingCategoryListData;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          controller: homeScrollController,
          physics: ClampingScrollPhysics(),
          padding: overallBodyOnlyTopPadding(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  DeliverToHome
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.mapMarkerAlt,
                    color: BajaAppColors.textGray,
                    size: getWidth(context) * 15 / 380,
                  ),
                  Padding(
                    padding: leftEdge(context, 5),
                    child: Text(
                      "Deliver to أهلا بك",
                      style: TextStyle(
                          color: BajaAppColors.textGray.withOpacity(0.7),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  DropdownButton(
                    value: dropValue,
                    underline: SizedBox(),
                    icon: Padding(
                      padding: leftEdge(context, 5),
                      child: FaIcon(
                        FontAwesomeIcons.chevronDown,
                        size: getWidth(context) * 15 / 380,
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                          value: 0,
                          child: Text(
                            "Home",
                            style: TextStyle(
                                color: BajaAppColors.textGray,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          )),
                      DropdownMenuItem(value: 1, child: Text("test")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        dropValue = value;
                      });
                    },
                  ),
                ],
              ),
              //  CarouselSlider
              Stack(
                children: [
                  CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: ClampingScrollPhysics(),
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 1000),
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          lastCarouselIndex = currentCarouselIndex;
                          currentCarouselIndex = index;
                          carouselTextAnimationController.reset();
                          carouselTextAnimationController.forward();
                                                                                        // currentObject title,subTitle set carouselTitle & carouselSubTitle
                        });
                      },
                    ),
                    items: List<Widget>.generate(4,(index)=> buildCarouselItem()),
                  ),
                  Positioned(
                    bottom: getWidth(context) * 30 / 380,
                    left: getWidth(context) * 40 / 380,
                    child: SlideTransition(
                      position: Tween<Offset>(
                          begin: currentCarouselIndex < lastCarouselIndex
                              ? Offset(0, -getWidth(context) * 1 / 380)
                              :  Offset(0, getWidth(context) * 1 / 380),
                          end: Offset.zero)
                          .animate(carouselTextAnimationController),
                      child: FadeTransition(
                        opacity: carouselTextAnimationController,
                        child: buildCarouselTextItem(carouselTitle, carouselSubTitle)   // dynamicData : carouselTitle & subTitle
                      ),
                    ),
                  )
                ],
              ),
              //  MoodWidget
              Container(
                height: getWidth(context) * 160 / 380,
                width: getWidth(context) * 340 / 380,
                margin: topEdge(context, 20),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: getWidth(context) * 120 / 380,
                        width: getWidth(context) * 340 / 380,
                        decoration: BoxDecoration(
                            color: BajaAppColors.backGray,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(top: getWidth(context) * 30 / 380),    //######################################
                          child: Text(
                            "What's Your Mood For Today ?",
                            style: TextStyle(
                                color: BajaAppColors.navyBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                shadows: [
                                  BoxShadow(
                                      color: BajaAppColors.orange, offset: Offset(0, 3))
                                ]),
                          ),
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: getWidth(context) * 30 / 380,),   //######################################
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(
                              horizontal: alignMoodItemFunct(moodToDaysList.length),
                            ),
                            itemCount: moodToDaysList.length,
                            itemBuilder: (context, index){
                          MoodTodayEntity moodToDayEntity = moodToDaysList[index];
                          return buildMoodItem(context, "assets/icons/caffeine.png" ,moodToDayEntity);}
                          ),
                      ),
                    )
                  ],
                ),
              ),
              //  BajaExpress
              Container(
                width: getWidth(context),
                height: getWidth(context) * 320 / 380,
                margin: topEdge(context, 30),
                padding: topEdge(context, 20),
                color: BajaAppColors.backGray,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "BAJA EXPRESS",
                      style: TextStyle(fontSize: 35, color: Colors.white, shadows: [
                        BoxShadow(
                            color: BajaAppColors.orange,
                            offset: Offset(0, 0),
                            blurRadius: 15),
                        BoxShadow(
                            color: BajaAppColors.orange,
                            offset: Offset(0, 0),
                            blurRadius: 25),
                        BoxShadow(
                            color: BajaAppColors.orange,
                            offset: Offset(0, 0),
                            blurRadius: 40),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: getWidth(context) * 20 / 380),
                      child: RichText(
                        text: TextSpan(
                            text: "Order Now, And It Will Be Arrived",
                            style: TextStyle(color: BajaAppColors.textGray),
                            children: [
                              TextSpan(
                                  text: " Within 2 Hours !",
                                  style: TextStyle(
                                      color: BajaAppColors.orange,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      //
                                    })
                            ]),
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                          top: getWidth(context) * 30 / 380,
                          left: getWidth(context) * 15 / 380,
                          right: getWidth(context) * 0 / 380,
                          bottom: getWidth(context) * 15 / 380,
                        ),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: bajaExpressProductDataList.length,
                        itemBuilder: (context, index) {
                          return buildBajaExpressProductItem(context, bajaExpressProductDataList[index]);
                        },
                      ),
                    )
                  ],
                ),
              ),
              //  NotReadyYet
              Container(
                width: getWidth(context),
                height: getWidth(context) * 200 / 380,
                child: Stack(
                  children: [
                    Container(
                      padding: symHorizontalEdge(context, 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/backNot.png"),
                              fit: BoxFit.fitWidth)),
                    ),
                    Padding(
                      padding: topEdge(context, 40),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Not Ready Yet ?",
                              style: TextStyle(
                                  color: BajaAppColors.orange,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2),
                            ),
                            SizedBox(
                              height: getWidth(context) * 5 / 380,
                            ),
                            Text("We Prepared A List Of Items That Suits Your Occasion !",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: topEdge(context, 90),
                      child: occasionsDataList.length == 1
                          ? Center(
                            child: Stack(children: [
                                occasionsDataList[0].extraImageUrl==null ?
                                Container(
                                  width: getWidth(context) * 230 / 380,
                                  height: getWidth(context) * 150 / 380,
                                  margin: rightEdge(context, 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              FakeData.fakeGatheringList[0].imagePath))), child: Center(
                                  child: Text(
                                    "${occasionsDataList[0].name}",
                                    style: TextStyle(
                                        color: BajaAppColors.orange,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2),
                                  ),
                                ),):
                                Container(
                                  width: getWidth(context) * 230 / 380,
                                  height: getWidth(context) * 150 / 380,
                                  margin: rightEdge(context, 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      image: DecorationImage(
                                          image: NetworkImage(occasionsDataList[0].extraImageUrl))),
                                  child: Center(
                                    child: Text(
                                      "${occasionsDataList[0].name}",
                                      style: TextStyle(
                                          color: BajaAppColors.orange,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2),
                                    ),
                                  ),
                                ),
                              ]),
                          )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: occasionsDataList.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(

                              ),
                              itemBuilder: (context, index) {
                                OccasionsEntity occasionEntity = occasionsDataList[index];
                                return Stack(children: [
                                  occasionEntity.extraImageUrl==null ?
                                  Container(
                                    width: getWidth(context) * 230 / 380,
                                    height: getWidth(context) * 150 / 380,
                                    margin: rightEdge(context, 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                FakeData.fakeGatheringList[0].imagePath))), child: Center(
                                                  child: Text(
                                    "${occasionEntity.name}",
                                    style: TextStyle(
                                        color: BajaAppColors.orange,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2),
                                  ),
                                                ),):
                                  Container(
                                    width: getWidth(context) * 230 / 380,
                                    height: getWidth(context) * 150 / 380,
                                    margin: rightEdge(context, 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        image: DecorationImage(
                                            image: NetworkImage(occasionEntity.extraImageUrl))),
                                      child: Center(
                                        child: Text(
                                          "${occasionEntity.name}",
                                          style: TextStyle(
                                              color: BajaAppColors.orange,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 2),
                                        ),
                                      ),
                                  ),
                                ],);
                              },
                            ),
                    )
                  ],
                ),
              ),
              //  BestSeller
              Container(
                  width: getWidth(context),
                  height: getWidth(context) * 250 / 380,
                  margin: topEdge(context, 10),
                  padding: topEdge(context, 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: symHorizontalEdge(context, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Best Seller",
                              style: BajaTextStyles.contentTopLeftTitleStyle,),
                            Text("View All",
                              style: BajaTextStyles.contentTopRightTitleStyle,),
                          ],
                        ),
                      ),
                      Flexible(
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                              top: getWidth(context) * 10 / 380,
                              bottom: getWidth(context) * 30 / 380,
                              left: getWidth(context) * 15 / 380),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: bestSellerProductDataList.length,
                          itemBuilder: (context, index) {
                            return buildBestSellerProductItem(context, bestSellerProductDataList[index]);
                          },
                        ),
                      )
                    ],
                  )),
              //  10% Widget
              Container(
                width: getWidth(context),
                height: getWidth(context) * 350 / 380,
                margin: symVerticalEdge(context, 15),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomPaint(
                        size: Size(getWidth(context), getWidth(context)),
                        painter: DiscountBackground(),
                      ),
                    ),
                    Positioned(
                      left: getWidth(context) * 40 / 380,
                      top: getWidth(context) * 25 / 380,
                      child: Container(
                        width: getWidth(context) * 150 / 380,
                        height: getWidth(context) * 240 / 380,
                        decoration: BoxDecoration(
                            color: BajaAppColors.orange,
                            image: DecorationImage(
                                image: AssetImage("assets/images/s1.png"),
                                fit: BoxFit.fitHeight),
                            borderRadius: BorderRadius.all(
                                Radius.circular(getWidth(context) * 170 / 380))),
                      ),
                    ),
                    Positioned(
                      left: getWidth(context) * 50 / 380,
                      top: getWidth(context) * 25 / 380,
                      child: Container(
                        width: getWidth(context) * 30 / 380,
                        height: getWidth(context) * 50 / 380,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: BajaAppColors.orange),
                            borderRadius: BorderRadius.all(
                                Radius.circular(getWidth(context) * 170 / 380))),
                      ),
                    ),
                    Positioned(
                      left: getWidth(context) * 15 / 380,
                      top: getWidth(context) * 150 / 380,
                      child: Container(
                        width: getWidth(context) * 120 / 380,
                        height: getWidth(context) * 180 / 380,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: BajaAppColors.orange),
                            borderRadius: BorderRadius.all(
                                Radius.circular(getWidth(context) * 170 / 380))),
                      ),
                    ),
                    Positioned(
                      left: getWidth(context) * 180 / 380,
                      top: getWidth(context) * 10 / 380,
                      child: Container(
                        width: getWidth(context) * 50 / 380,
                        height: getWidth(context) * 80 / 380,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: BajaAppColors.orange),
                            borderRadius: BorderRadius.all(
                                Radius.circular(getWidth(context) * 170 / 380))),
                      ),
                    ),
                    Positioned(
                        left: getWidth(context) * 180 / 380,
                        top: getWidth(context) * 95 / 380,
                        child: Text(
                          "10% off",
                          style: TextStyle(
                              color: BajaAppColors.orange,
                              fontSize: 34,
                              fontWeight: FontWeight.w700),
                        )),
                    Positioned(
                        left: getWidth(context) * 200 / 380,
                        top: getWidth(context) * 130 / 380,
                        child: Text(
                          "Of Your\nFirst Order",
                          style: TextStyle(
                              color: BajaAppColors.orange,
                              fontSize: 22,
                              fontWeight: FontWeight.w200),
                        )),
                    Positioned(
                        left: getWidth(context) * 200 / 380,
                        top: getWidth(context) * 180 / 380,
                        child: Text(
                          "A New Friend ?\nDiscover A Lot Of Our Tasty\nItems, And Enjoy 10% Off\nWity Your First Order!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w200),
                        )),
                  ],
                ),
              ),
              //  ShopByCategory
              Container(
                  width: getWidth(context),
                  height: getWidth(context) * 230 / 380,
                  padding: topEdge(context, 20),
                  margin: bottomEdge(context, 80),
                  child: Column(
                    children: [
                      Padding(
                        padding: symHorizontalEdge(context, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shop By Category",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: BajaAppColors.textGray),
                            ),
                            Text(
                              "View All",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: BajaAppColors.textGray.withOpacity(0.8)),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                              top: getWidth(context) * 10 / 380,
                              bottom: getWidth(context) * 30 / 380,
                              left: getWidth(context) * 15 / 380),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:shoppingCategoryList.length,
                          itemBuilder: (context, index) {
                            return buildCategoryItem(context, shoppingCategoryList[index], FakeData.fakeCategoriesList[0]);
                          },
                        ),
                      )
                    ],
                  )),
            ],
          ),
        )
    );
  }

  buildMoodItem(BuildContext context, String defaultIconPath, MoodTodayEntity moodTodayEntity) {
    return Container(
      width: getWidth(context) * 60/380,
      margin: EdgeInsets.only(
        top: 30,
        left: getWidth(context) * 5/380,
        right: getWidth(context) * 5/380,
      ),
      decoration: BajaBoxDecorations.moodDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: getWidth(context) * 15/380,),
            child: moodTodayEntity.thumbUrl!=null?
            ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Image.network(
                moodTodayEntity.thumbUrl,
                // color: BajaAppColors.navyBlue,
                width: getWidth(context) * 30/380,
                height: getWidth(context) * 40/380,
                fit: BoxFit.fitWidth,
              ),
            ):
            Image.asset(
              defaultIconPath,
              // color: BajaAppColors.navyBlue,
              filterQuality: FilterQuality.high,
              isAntiAlias: true,
              width: getWidth(context) * 30/380,
              height: getWidth(context) * 40/380,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "${moodTodayEntity.name.toUpperCase()}",
              textAlign: TextAlign.center,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: BajaTextStyles.moodTextStyle.copyWith(letterSpacing: 0.2),
            ),
          ),
        ],
      ),
    );
  }

  buildMoodItem22(BuildContext context, String iconPath, String title) {
    return Container(
      width: getWidth(context) * 60 / 380,
      height: getWidth(context) * 90 / 380,
      decoration: BajaBoxDecorations.moodDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            // color: BajaAppColors.navyBlue,
            filterQuality: FilterQuality.high,
            isAntiAlias: true,
            width: getWidth(context) * 30/380,
            height: getWidth(context) * 30/380,
            fit: BoxFit.fitHeight,
          ),
          h10Sized(context),
          Text(
            "$title",
            style: BajaTextStyles.moodTextStyle,
          )
        ],
      ),
    );
  }

  buildBajaExpressProductItem(BuildContext context, BajaExpressEntity bajaExpress) {
    return InkWell(
      onTap: () {
        //Navigator.push(context, CupertinoPageRoute(builder: (context) => ProductViewPage(item)));
      },
      child: Container(
        width: getWidth(context) * 120 / 380,
        height: getWidth(context) * 250 / 380,
        margin: rightEdge(context, 15),
        padding: leftEdge(context, 5),
        decoration: BajaBoxDecorations.productItemDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Image.network(bajaExpress.imageUrl, fit: BoxFit.contain, width: 100,height: 100)),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "${bajaExpress.name}",
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: BajaTextStyles.productItemTitleTextStyle
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${bajaExpress.defaultDisplayedPriceFormatted}",
                  textAlign: TextAlign.start,
                  style: BajaTextStyles.productItemPriceTextStyle,
                )),
          ],
        ),
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
    );
  }

  buildBestSellerProductItem(BuildContext context, BestSellerEntity bestSellerEntity) {
    return InkWell(
      onTap: () {
        //Navigator.push(context, CupertinoPageRoute(builder: (context) => ProductViewPage(item)));
      },
      child: Container(
        width: getWidth(context) * 120 / 380,
        height: getWidth(context) * 250 / 380,
        margin: rightEdge(context, 15),
        padding: leftEdge(context, 5),
        decoration: BajaBoxDecorations.productItemDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Image.network(bestSellerEntity.imageUrl, fit: BoxFit.contain, width: 100,height: 100)),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${bestSellerEntity.name}",
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: BajaTextStyles.productItemTitleTextStyle
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${bestSellerEntity.defaultDisplayedPriceFormatted}",
                  textAlign: TextAlign.start,
                  style: BajaTextStyles.productItemPriceTextStyle,
                )),
          ],
        ),
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
    );
  }

  buildCategoryItem(BuildContext context, ShoppingCategoryEntity shoppingCategoryEntity, item) {
    return InkWell(
      onTap: () {
        settingRepo.pageViewState.value.pageController.jumpToPage(1);
      },
      child: Container(
        width: getWidth(context) * 100 / 380,
        height: getWidth(context) * 180 / 380,
        margin: rightEdge(context, 15),
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: shoppingCategoryEntity.imageUrl== null ? AssetImage(
                    item.imagePath): NetworkImage(shoppingCategoryEntity.imageUrl),
                fit: BoxFit.fitHeight),
            borderRadius: BorderRadius.all(
                Radius.circular(getWidth(context) * 170 / 380))),
        child: Center(
          child: Text(
            shoppingCategoryEntity.name,
            textAlign: TextAlign.center,
            style: BajaTextStyles.categoryItemTitleTextStyle,
          ),
        ),
      ),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
    );
  }

  buildCarouselItem() {
    return Container(
      margin: EdgeInsets.all(getWidth(context) * 15 / 380),
      width: getWidth(context) * 370 / 380,
      height: getWidth(context) * 200 / 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(getWidth(context) * 40 / 380)),
        // image: DecorationImage(
        //     fit: BoxFit.cover, image: AssetImage("assets/images/a1.png"))
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
            Radius.circular(getWidth(context) * 40 / 380)),
        child: Image.asset(
          "assets/images/a1.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  buildCarouselTextItem(String title, String subTitle){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: TextStyle(
              color: BajaAppColors.orange,
              fontSize: 50,
              fontWeight: FontWeight.w700),
        ),
        Text(
          "$subTitle",
          style: TextStyle(
              color: BajaAppColors.orange,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  double alignMoodItemFunct(int length) {
    switch (length){
      case (1):
        return getWidth(context) * 135/380;
        break;
      case (2):
        return getWidth(context) * 100/380;
        break;
      case (3):
        return getWidth(context) * 65/380;
        break;
      default:
        return getWidth(context) * 30/380;
        break;
    }
  }
}

Map<String, String> fakeMoodList = {
  "assets/icons/sweetie.png" : "SWEETIE",
  "assets/icons/salty.png" : "SALTY",
  "assets/icons/caffeine.png" : "CAFFEINE",
  "assets/icons/tea.png" : "TEA",
};


