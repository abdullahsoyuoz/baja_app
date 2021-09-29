class FakeProduct{
  int index;
  String title;
  double price;
  String imagePath;
  int quantity;
  int size;
  FakeProduct(this.index, this.title, this.price, this.imagePath, this.quantity, this.size);
}

class FakeGathering{
  String imagePath;
  FakeGathering(this.imagePath);
}

class FakeCategories{
  String title;
  String imagePath;
  FakeCategories(this.title, this.imagePath);
}

class FakeCategoriesPageCategory{
  String title;
  String imagePath;
  FakeCategoriesPageCategory(this.title, this.imagePath);
}

class FakeOrders{
  String orderId;
  String date;
  List orderList;
  String estimatedTime;
  bool type;
  FakeOrders(this.orderId, this.date, this.orderList, this.estimatedTime, this.type);
}

class FakeCreditCard{
  String endingIn;
  String cardName;
  String expiresEndOf;
  String imagePath;
  FakeCreditCard(this.endingIn, this.cardName, this.expiresEndOf, this.imagePath);
}

class FakeData{
  static FakeProduct fakeP1 = FakeProduct(0,"Pumpkin Seeds", 50.00, "assets/images/p1.png", 1, 250);
  static FakeProduct fakeP2 = FakeProduct(1,"Deluxe Mix", 10.00, "assets/images/p2.png", 1, 200);
  static FakeProduct fakeP3 = FakeProduct(2,"Ground Beans", 20.00, "assets/images/p3.png", 1, 350);
  static FakeProduct fakeP4 = FakeProduct(3,"Salted Cashew", 70.00, "assets/images/p4.png", 1, 450);
  static FakeProduct fakeP5 = FakeProduct(4,"Red Tea", 90.00, "assets/images/p5.png", 1, 200);

  static FakeGathering fakeG1 = FakeGathering("assets/images/g1.png");
  static FakeGathering fakeG2 = FakeGathering("assets/images/g2.png");
  static FakeGathering fakeG3 = FakeGathering("assets/images/g3.png");
  static FakeGathering fakeG4 = FakeGathering("assets/images/g4.png");

  static FakeCategories fakeC1 = FakeCategories("SEEDS", "assets/images/c1.png");
  static FakeCategories fakeC2 = FakeCategories("NUTS", "assets/images/c2.png");
  static FakeCategories fakeC3 = FakeCategories("MIXED\nNUTS", "assets/images/c3.png");
  static FakeCategories fakeC4 = FakeCategories("COFFEE", "assets/images/c4.png");
  static FakeCategories fakeC5 = FakeCategories("DRIED\nFRUITS", "assets/images/c5.png");

  static FakeCategoriesPageCategory fakeCCC1 = FakeCategoriesPageCategory("Arabic", "assets/icons/coffee_arabic.png");
  static FakeCategoriesPageCategory fakeCCC2 = FakeCategoriesPageCategory("Turkish", "assets/icons/coffee_turkish.png");
  static FakeCategoriesPageCategory fakeCCC3 = FakeCategoriesPageCategory("French", "assets/icons/coffee_french.png");
  static FakeCategoriesPageCategory fakeCCC4 = FakeCategoriesPageCategory("Black", "assets/icons/coffee_black.png");
  static FakeCategoriesPageCategory fakeCCN1 = FakeCategoriesPageCategory("Seeds", "assets/icons/nuts_seeds.png");
  static FakeCategoriesPageCategory fakeCCN2 = FakeCategoriesPageCategory("Nuts", "assets/icons/nuts_nuts.png");
  static FakeCategoriesPageCategory fakeCCN3 = FakeCategoriesPageCategory("Mixed\nNuts", "assets/icons/nuts_mixed.png");
  static FakeCategoriesPageCategory fakeCCN4 = FakeCategoriesPageCategory("Raw\nNuts", "assets/icons/nuts_raw.png");
  static FakeCategoriesPageCategory fakeCCT1 = FakeCategoriesPageCategory("Premium Tea", "assets/icons/tea_premium.png");
  static FakeCategoriesPageCategory fakeCCT2 = FakeCategoriesPageCategory("Loos Tea", "assets/icons/tea_loos.png");
  static FakeCategoriesPageCategory fakeCCT3 = FakeCategoriesPageCategory("Tea\nBags", "assets/icons/tea_bags.png");

  static FakeOrders fakeOrder1 = FakeOrders("NSAD30067500402", "Mar 15, 2021", FakeData.fakeProductList, "Mar 16", false);
  static FakeOrders fakeOrder2 = FakeOrders("FGDA41754820176", "Feb 8, 2020", FakeData.fakeProductList, "Feb 8", true);

  static FakeCreditCard fakeCredit1 = FakeCreditCard("1558", "Shadad Ali", "Feb, 2022", "assets/icons/card_mastercard.png");
  static FakeCreditCard fakeCredit2 = FakeCreditCard("5303", "Shadad Ali", "Dec, 2022", "assets/icons/card_visa.png");
  static FakeCreditCard fakeCredit3 = FakeCreditCard("3872", "Shadad Ali", "Mar, 2022", "assets/icons/card_visa.png");

  static List fakeCreditCardList = [
    FakeData.fakeCredit1,
    FakeData.fakeCredit2,
    FakeData.fakeCredit3,
  ];

  static List fakeOrderList = [
    FakeData.fakeOrder1,
    FakeData.fakeOrder2,
  ];

  static List fakeCategoriesPageCategoryList = [
    "Seeds & Nuts",
    "Coffee",
    "Tea",
    "Sweets",
    "Dried Fruits"
  ];

  static List fakeCategoriesPageCoffeeCategoryList = [
    FakeData.fakeCCC1,
    FakeData.fakeCCC2,
    FakeData.fakeCCC3,
    FakeData.fakeCCC4,
  ];

  static List fakeCategoriesPageNutsCategoryList = [
    FakeData.fakeCCN1,
    FakeData.fakeCCN2,
    FakeData.fakeCCN3,
    FakeData.fakeCCN4,
  ];

  static List fakeCategoriesPageTeaCategoryList = [
    FakeData.fakeCCT1,
    FakeData.fakeCCT2,
    FakeData.fakeCCT3,
  ];

  static List fakeProductList = [
    FakeData.fakeP1,
    FakeData.fakeP2,
    FakeData.fakeP3,
    FakeData.fakeP4,
    FakeData.fakeP5,
  ];

  static List fakeGatheringList = [
    FakeData.fakeG1,
    FakeData.fakeG2,
    FakeData.fakeG3,
    FakeData.fakeG4,
  ];

  static List fakeCategoriesList = [
    FakeData.fakeC1,
    FakeData.fakeC2,
    FakeData.fakeC3,
    FakeData.fakeC4,
    FakeData.fakeC5,
  ];
}
