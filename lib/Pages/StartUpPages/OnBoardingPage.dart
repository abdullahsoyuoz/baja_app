import 'dart:async';

import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:baja_app/rest/controller/ecwid/ecwid_categories_provider.dart';
import 'package:baja_app/rest/controller/ecwid/ecwid_subcategories_provider.dart';
import 'package:baja_app/rest/controller/widget/baja_express_provider.dart';
import 'package:baja_app/rest/controller/widget/mood_today_provider.dart';
import 'package:baja_app/rest/controller/widget/occasions_provider.dart';
import 'package:baja_app/rest/controller/widget/promotion_provider.dart';
import 'package:baja_app/rest/controller/widget/shopping_category_provider.dart';
import 'package:baja_app/rest/controller/widget/side_category_provider.dart';
import 'package:baja_app/rest/controller/widget/todays_taste_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baja_app/rest/controller/widget/best_seller_provider.dart';
import 'package:provider/provider.dart';
import '../MainPageView.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;

class OnBoardingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        Provider.of<OccasionsProvider>(context, listen: false).getOccasionsListController();
        Provider.of<MoodToDayProvider>(context, listen: false).getMoodToDayListController();
        Provider.of<BajaExpressProvider>(context, listen: false).getBajaExpressProductController();
        Provider.of<BestSellerProvider>(context, listen: false).getBestSellerProductController();
        //Provider.of<PromotionProvider>(context, listen: false).getPromotionListController();
        Provider.of<ToDaysTasteProvider>(context, listen: false).getToDaysTasteListController();
        Provider.of<SideCategoryProvider>(context, listen: false).getSideCategoryListController();
        Provider.of<ShoppingCategoryProvider>(context, listen: false).getShoppingCategoryListController();

        //ECWID
        Provider.of<EcwidCategoriesProvider>(context, listen: false).getEcwidCategoryListController();

      } catch (e) {
        print('Exception -- WELCOME PAGE PROVIDER -- $e');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: getWidth(context),
            height: getWidth(context) * 1.0,
            decoration: BoxDecoration(
                color: BajaAppColors.orange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(getWidth(context)),
                  bottomRight: Radius.circular(getWidth(context)),
                )),
          ),
          onBordingBody(),
        ],
      ),
    );
  }

  Widget onBordingBody() => Container(
        child: SliderLayoutView(),
      );
}

class SliderLayoutView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) => topSliderLayout();

  Widget topSliderLayout() => Container(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: sliderArrayList.length,
                  itemBuilder: (ctx, i) => SlideItem(i),
                ),
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: getWidth(context) * 10 / 380,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                  left: 15.0,
                                ),
                                child: Image.asset(
                                  "assets/logo/baja_logo.png",
                                  height: getWidth(context) * 40 / 380,
                                  fit: BoxFit.fitHeight,
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 15.0,
                              ),
                              child: InkWell(
                                onTap: () {
                                  //Navigator.push(context, CupertinoPageRoute(builder: (context) => ChooseOnMap(),));
                                  Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => MainPageView(),), (route) => false);
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Text(
                                  "SKIP",
                                  style: TextStyle(
                                    color: BajaAppColors.orange,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.bottomCenter,
                      margin: EdgeInsets.only(
                        bottom: getWidth(context) * 50 / 380,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < sliderArrayList.length; i++)
                            if (i == _currentPage)
                              SlideDots(true)
                            else
                              SlideDots(false)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )),
      );
}

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Slider(
      {@required this.sliderImageUrl,
      @required this.sliderHeading,
      @required this.sliderSubHeading});
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: 'assets/images/slider_1.png',
      sliderHeading: "YOUR FAVOURITE",
      sliderSubHeading: Constants.SLIDER_DESC),
  Slider(
      sliderImageUrl: 'assets/images/slider_2.png',
      sliderHeading: "ORDER IN 3 STEPS",
      sliderSubHeading: Constants.SLIDER_DESC),
  Slider(
      sliderImageUrl: 'assets/images/slider_3.png',
      sliderHeading: "WORLDWIDE DELEVERY",
      sliderSubHeading: Constants.SLIDER_DESC),
];

class Constants {
  static const String POPPINS = "Poppins";
  static const String OPEN_SANS = "OpenSans";
  static const String SKIP = "Skip";
  static const String NEXT = "Next";
  static const String SLIDER_DESC =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultricies, erat vitae porta consequat.";
}

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: getWidth(context) * 3 / 380),
      height: isActive
          ? getWidth(context) * 24 / 380
          : getWidth(context) * 12 / 380,
      width: isActive
          ? getWidth(context) * 24 / 380
          : getWidth(context) * 12 / 380,
      decoration: BoxDecoration(
        color: isActive
            ? BajaAppColors.navyBlue
            : BajaAppColors.navyBlue.withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
    );
  }
}

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width * 0.6,
          width: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(sliderArrayList[index].sliderImageUrl))),
        ),
        SizedBox(
          height: 50.0,
        ),
        Text(
          sliderArrayList[index].sliderHeading,
          style: TextStyle(
              color: BajaAppColors.navyBlue,
              fontWeight: FontWeight.w700,
              fontSize: 22,
              letterSpacing: 2),
        ),
        SizedBox(
          height: getWidth(context) * 20/380,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 50/380),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height: getWidth(context) * 3/380,
                  decoration: BoxDecoration(
                    color: BajaAppColors.navyBlue,
                    borderRadius: BorderRadius.circular(getWidth(context) * 5/380)
                  ),
                ),
              ),
              Container(
                height: getWidth(context) * 4/380,
                width: getWidth(context) * 4/380,
                margin: EdgeInsets.symmetric(
                  horizontal: getWidth(context) * 5/380
                ),
                decoration: BoxDecoration(
                    color: BajaAppColors.navyBlue,
                    borderRadius: BorderRadius.circular(getWidth(context) * 5/380)
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  height: getWidth(context) * 3/380,
                  decoration: BoxDecoration(
                      color: BajaAppColors.navyBlue,
                      borderRadius: BorderRadius.circular(getWidth(context) * 5/380)
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: getWidth(context) * 20/380,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              sliderArrayList[index].sliderSubHeading,
              style: TextStyle(
                  color: BajaAppColors.navyBlue,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  letterSpacing: 2),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
