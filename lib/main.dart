import 'package:baja_app/rest/controller/widget/baja_express_provider.dart';
import 'package:baja_app/rest/controller/widget/best_seller_provider.dart';
import 'package:baja_app/rest/controller/widget/mood_today_provider.dart';
import 'package:baja_app/rest/controller/widget/promotion_provider.dart';
import 'package:baja_app/rest/controller/widget/shopping_category_provider.dart';
import 'package:baja_app/rest/controller/widget/side_category_provider.dart';
import 'package:baja_app/rest/controller/widget/todays_taste_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Pages/SplashScreen.dart';
import 'rest/controller/ecwid/ecwid_categories_provider.dart';
import 'rest/controller/ecwid/ecwid_subcategories_provider.dart';
import 'rest/controller/user_login_information_provider.dart';
import 'rest/controller/widget/occasions_provider.dart';



void main() => run();

Future run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp(SplashScreen()));
}


/*
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/intro",
    routes: {
      "/home" : (context) => MainPageView(),
      "/chooseOnMap" : (context) => ChooseOnMap(),
      "/intro" : (context) => LandingPage()
    },
  ));
}
*/

const MaterialColor materialColorData = const MaterialColor(
  0xffFFFFFF,
  const <int, Color>{
    50: const Color(0xffFFFFFF),
    100: const Color(0xffFFFFFF),
    200: const Color(0xffFFFFFF),
    300: const Color(0xffFFFFFF),
    400: const Color(0xffFFFFFF),
    500: const Color(0xffFFFFFF),
    600: const Color(0xffFFFFFF),
    700: const Color(0xffFFFFFF),
    800: const Color(0xffFFFFFF),
    900: const Color(0xffFFFFFF),
  },
);


class MyApp extends StatelessWidget {
  final Widget destination;
  const MyApp(this.destination);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserLoginInformationProvider>(create: (context) => UserLoginInformationProvider()),
        ChangeNotifierProvider<OccasionsProvider>(create: (context) => OccasionsProvider()),
        ChangeNotifierProvider<MoodToDayProvider>(create: (context) => MoodToDayProvider()),
        ChangeNotifierProvider<BajaExpressProvider>(create: (context) => BajaExpressProvider()),
        ChangeNotifierProvider<BestSellerProvider>(create: (context) => BestSellerProvider()),
        ChangeNotifierProvider<PromotionProvider>(create: (context) => PromotionProvider()),
        ChangeNotifierProvider<ToDaysTasteProvider>(create: (context) => ToDaysTasteProvider()),
        ChangeNotifierProvider<SideCategoryProvider>(create: (context) => SideCategoryProvider()),
        ChangeNotifierProvider<ShoppingCategoryProvider>(create: (context) => ShoppingCategoryProvider()),

        //ECWID
        ChangeNotifierProvider<EcwidCategoriesProvider>(create: (context) => EcwidCategoriesProvider()),
        ChangeNotifierProvider<EcwidSubCategoriesProvider>(create: (context) => EcwidSubCategoriesProvider()),

      ],
      child: MaterialApp(
        title: 'Baja',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: materialColorData,
          buttonColor: materialColorData,
          fontFamily: 'centuryGothic'
        ),
        debugShowCheckedModeBanner: false,
        // home: destination,
        home: destination,
        // home: AuthPage(),  this is replaced by routes '/'
      ),
    );
  }
}