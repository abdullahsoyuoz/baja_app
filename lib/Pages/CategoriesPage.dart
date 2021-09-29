import 'dart:async';
import 'dart:ui';
import 'package:baja_app/Pages/ProductPages/ProductViewPage.dart';
import 'package:baja_app/Utility/Colors.dart';
import 'package:baja_app/Utility/Paddings.dart';
import 'package:baja_app/Utility/fakeData.dart';
import 'package:baja_app/Utility/util.dart';
import 'package:baja_app/rest/controller/ecwid/ecwid_categories_provider.dart';
import 'package:baja_app/rest/controller/ecwid/ecwid_subcategories_provider.dart';
import 'package:baja_app/rest/entity/ecwid/ecwid_categories_entity.dart';
import 'package:baja_app/rest/entity/ecwid/ecwid_product_entity.dart';
import 'package:baja_app/rest/entity/ecwid/ecwid_subcategory_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;
import 'package:provider/provider.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with TickerProviderStateMixin {
  ScrollController categoriesPageScrollController;
  AnimationController subCategoryAnimationController;
  AnimationController categoryAnimationController;
  int currentCategoryIndex = 0;
  int lastCategoryIndex = 0;
  FocusNode searchNode = new FocusNode();
  int currentSubCategoryIndex = 0;
  int lastSubCategoryIndex = 0;
  double containerHeight = 0;

  @override
  void initState() {
    super.initState();
    categoriesPageScrollController = ScrollController();
    subCategoryAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    categoryAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    Timer(Duration(milliseconds: 0), () => subCategoryAnimationController.forward());
    Timer(Duration(milliseconds: 0), () => categoryAnimationController.forward());
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        int parentId = Provider.of<EcwidCategoriesProvider>(context, listen: false).ecwidCategoryListData[0].parentId;
        Provider.of<EcwidSubCategoriesProvider>(context, listen: false).getEcwidSubCategoryListController(parentId);
      } catch (e) {
        print('Exception -- Categories Page PROVIDER -- $e');
      }
    });


  }

  @override
  void dispose() {
    categoriesPageScrollController.dispose();
    subCategoryAnimationController.dispose();
    categoryAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<EcwidCategoryEntity> ecwidCategoryList = Provider.of<EcwidCategoriesProvider>(context, listen: true).ecwidCategoryListData;
    List<EcwidSubCategoryEntity> ecwidSubCategoryList = Provider.of<EcwidSubCategoriesProvider>(context, listen: true).ecwidSubCategoryListData;
    List<EcwidProductEntity> ecwidProductDataList = Provider.of<EcwidSubCategoriesProvider>(context, listen: true).ecwidProductListData;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    top: getWidth(context) * 170 / 380,
                    bottom: getWidth(context) * 30/380,
                  ),
                  physics: BouncingScrollPhysics(),
                  itemCount: ecwidCategoryList.length,
                  itemBuilder: (context, index) {
                    EcwidCategoryEntity ecwidCategoryEntity = ecwidCategoryList[index];
                    return buildCategoryItem(context, index,ecwidCategoryEntity);
                  },
                ),
              )),
          Flexible(
            flex: 7,
            child: Align(
              alignment: Alignment.topCenter,
              child: ListView(
                shrinkWrap: true,
                controller: categoriesPageScrollController,
                padding: EdgeInsets.only(top: getWidth(context) * 100/380),
                children: [
                  //  SEARCH AREA
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: getWidth(context) * 9 / 380),
                    decoration: BoxDecoration(
                        color: BajaAppColors.backGray,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: getWidth(context) * 20 / 380),
                          child: FaIcon(
                            FontAwesomeIcons.search,
                            color: BajaAppColors.textGray.withOpacity(0.2),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            selectionHeightStyle: BoxHeightStyle.tight,
                            focusNode: searchNode,
                            onTap: () {},
                            decoration: InputDecoration(
                              hintText: "Search for your favourite",
                              hintStyle: TextStyle(
                                  color:
                                  BajaAppColors.textGray.withOpacity(0.2)),
                              contentPadding: EdgeInsets.only(
                                  left: getWidth(context) * 10 / 380,
                                  top: 0,
                                  bottom: 0
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), // margin horizontal 15
                  //  TOP PAGE TITLE AREA
                  Container(
                    width: getWidth(context),
                    margin: EdgeInsets.only(
                        top: getWidth(context) * 20 / 380,
                        left: getWidth(context) * 9 / 380),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Hi There !",
                          style: TextStyle(
                              color: BajaAppColors.textGray.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              letterSpacing: 2),
                        ),
                        SizedBox(
                          height: getWidth(context) * 5 / 380,
                        ),
                        Text(
                          "What's today's taste ?",
                          style: TextStyle(
                              color: BajaAppColors.orange,
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                              letterSpacing: 2),
                        ),
                        SizedBox(
                          height: getWidth(context) * 10 / 380,
                        ),
                        Container(
                          height: 2,
                          width: 30,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ), // yok
                  //  SUBCATEGORIES AREA
                  Container(
                    width: getWidth(context),
                    height: getWidth(context) * 160 / 380,
                    margin: EdgeInsets.only(
                        top: getWidth(context) * 25 / 380,
                        bottom: getWidth(context) * 15 / 380,
                    ),
                    child: ListView.builder(
                        itemCount: ecwidSubCategoryList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(
                          vertical: getWidth(context) * 3/380,
                        ),
                        itemBuilder: (context, index){
                          EcwidSubCategoryEntity ecwidSubCategory = ecwidSubCategoryList[index];
                      return buildSubCategoryItem(context, index, ecwidSubCategory, FakeData.fakeCCC1);
                    }),
                  ),
                  ecwidProductDataList.length>0?
                  GridView.count(
                    padding: EdgeInsets.only(
                        top: getWidth(context) * 5 / 380,
                        bottom: getWidth(context) * 0.3),
                    crossAxisSpacing: getWidth(context) * 0 / 380,
                    mainAxisSpacing: getWidth(context) * 0 / 380,
                    childAspectRatio: 0.69,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                      children: List<Widget>.generate(ecwidProductDataList.length,(index)=> EcwidProductItemDataWidget(ecwidProductDataList[index], index),
                      ),
                  ): Padding(
                    padding: EdgeInsets.only(
                        top: getWidth(context) * 5 / 380,
                        bottom: getWidth(context) * 0.3),
                    child: CircularProgressIndicator(),
                  ),
                   // children: ecwidProductDataList.map((ecwidProductData) => EcwidProductItemDataWidget(ecwidProductData,FakeData.fakeP1)).toList(),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

  buildCategoryItem(BuildContext context, int index, EcwidCategoryEntity ecwidCategoryEntity) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(bottom: getWidth(context) * 50 / 380),
        alignment: Alignment.center,
        child: RotatedBox(
          quarterTurns: 3,
          child: Row(
            children: [
              index != currentCategoryIndex
                  ? SizedBox()
                  : index < lastCategoryIndex
                      ? SlideTransition(
                          position: Tween<Offset>(
                                  begin:
                                      Offset(-getWidth(context) * 5 / 380, 0),
                                  end: Offset.zero)
                              .animate(categoryAnimationController),
                          child: FadeTransition(
                            opacity: categoryAnimationController,
                            child: Container(
                              width: getWidth(context) * 30 / 380,
                              height: getWidth(context) * 2 / 380,
                              margin: EdgeInsets.only(right: 5),
                              color: BajaAppColors.orange,
                            ),
                          ))
                      : SlideTransition(
                          position: Tween<Offset>(
                                  begin: Offset(getWidth(context) * 5 / 380, 0),
                                  end: Offset.zero)
                              .animate(categoryAnimationController),
                          child: FadeTransition(
                            opacity: categoryAnimationController,
                            child: Container(
                              width: getWidth(context) * 30 / 380,
                              height: getWidth(context) * 2 / 380,
                              margin: EdgeInsets.only(right: 5),
                              color: BajaAppColors.orange,
                            ),
                          ),
                        ),
              AnimatedDefaultTextStyle(
                style: index != currentCategoryIndex
                    ? TextStyle(
                        color: BajaAppColors.textGray.withOpacity(0.3),
                        fontSize: 18,
                        fontWeight: FontWeight.w300)
                    : TextStyle(
                        color: BajaAppColors.textGray,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                duration: Duration(milliseconds: 200),
                child: Text("${ecwidCategoryEntity.name}", textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: () {
        setState(() {
          lastCategoryIndex = currentCategoryIndex;
          currentCategoryIndex = index;
          categoryAnimationController.reset();
          categoryAnimationController.forward();
        });
        currentSubCategoryIndex = 0;
        lastSubCategoryIndex = 0;
        Provider.of<EcwidSubCategoriesProvider>(context, listen: false).getEcwidSubCategoryListController(ecwidCategoryEntity.parentId!=null ? ecwidCategoryEntity.parentId: null);
      },
    );
  }

  buildSubCategoryItem(
      BuildContext context, int index, EcwidSubCategoryEntity ecwidSubCategoryEntity,FakeCategoriesPageCategory item) {
    return InkWell(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
        height: getWidth(context) * 154 / 380,
        width: getWidth(context) * 100 / 380,
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(
          right: getWidth(context) * 10 / 380,
          left: getWidth(context) * 10 / 380,
          bottom: index != currentSubCategoryIndex ? getWidth(context) * 30 / 380 : 0
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4)
            ],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: getWidth(context) * 10 / 380,
                ),
                child: Image.asset(
                  item.imagePath,
                  width: getWidth(context) * 50 / 380,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          EdgeInsets.only(
                            top: getWidth(context) * 10 / 380,
                            left: 10,
                            right: 10,
                          ),
                      child: AnimatedDefaultTextStyle(
                        style: index != currentSubCategoryIndex
                            ? TextStyle(
                                color: BajaAppColors.textGray.withOpacity(0.6),
                                fontSize: 16,
                                fontWeight: FontWeight.w400)
                            : TextStyle(
                                color: BajaAppColors.orange,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                        duration: Duration(milliseconds: 200),
                        child: Text(
                          "${ecwidSubCategoryEntity.name}", textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  index != currentSubCategoryIndex
                      ? SizedBox()
                      : Expanded(
                    flex: 1,
                          child: index < lastSubCategoryIndex
                              ? SlideTransition(
                                  position: Tween<Offset>(
                                          begin: Offset(
                                              getWidth(context) * 10 / 380, 0),
                                          end: Offset.zero)
                                      .animate(subCategoryAnimationController),
                                  child: FadeTransition(
                                    opacity: subCategoryAnimationController,
                                    child: Container(
                                      width: getWidth(context) * 10 / 380,
                                      height: getWidth(context) * 10 / 380,
                                      margin: EdgeInsets.only(
                                          bottom: getWidth(context) * 20 / 380),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: BajaAppColors.orange),
                                    ),
                                  ),
                                )
                              : SlideTransition(
                                  position: Tween<Offset>(
                                          begin: Offset(
                                              -getWidth(context) * 10 / 380, 0),
                                          end: Offset.zero)
                                      .animate(subCategoryAnimationController),
                                  child: FadeTransition(
                                    opacity: subCategoryAnimationController,
                                    child: Container(
                                      width: getWidth(context) * 10 / 380,
                                      height: getWidth(context) * 10 / 380,
                                      margin: EdgeInsets.only(
                                          bottom: getWidth(context) * 20 / 380),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: BajaAppColors.orange),
                                    ),
                                  ),
                                ),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        lastSubCategoryIndex = currentSubCategoryIndex;
        currentSubCategoryIndex = index;
        setState(() {
          if (currentSubCategoryIndex != lastSubCategoryIndex) {
            subCategoryAnimationController.reset();
            subCategoryAnimationController.forward();
          }
        });
        Provider.of<EcwidSubCategoriesProvider>(context, listen: false).getEcwidProductListController(ecwidSubCategoryEntity.id);
      },
    );
  }

}

class EcwidProductItemDataWidget extends StatelessWidget {
  int index;
  EcwidProductEntity ecwidProductEntity;
  EcwidProductItemDataWidget(this.ecwidProductEntity,this.index);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /*Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ProductViewPage(item),
            ));*/
      },
      child: Container(
        margin: EdgeInsets.all(getWidth(context) * 9 / 380),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: getWidth(context) * 15 / 380),
                child: Hero(
                  tag: index,
                  child: CachedNetworkImage(
                    imageUrl: ecwidProductEntity.imageUrl,
                    imageBuilder: (context, imageProvider) => Image.network(
                      ecwidProductEntity.imageUrl,
                      height: getWidth(context) * 130 / 380,
                      fit: BoxFit.fitHeight,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    placeholder: (context, url) => SizedBox(
                        height: getWidth(context) * 130 / 380,
                        width: getWidth(context) * 130 / 380,
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            ))),
                  )
                )),
            Text(
              "${ecwidProductEntity.name}",
              textAlign: TextAlign.center,
              style: TextStyle(color: BajaAppColors.textGray),
            ),
          ],
        ),
      ),
    );
  }
}
