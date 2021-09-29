

import 'package:baja_app/Pages/MainPageView.dart';
import 'package:baja_app/rest/entity/login_token_entity.dart';
import 'package:flutter/foundation.dart';



ValueNotifier<MainPageViewState> pageViewState = new ValueNotifier(new MainPageViewState());
ValueNotifier<String> sessionToken = new ValueNotifier("");
ValueNotifier<LoginTokenEntity> loginTokenEntityNotifier = new ValueNotifier(new LoginTokenEntity());


class AppConfigurations {

  const AppConfigurations();
  static String mainColorRed = "#BB153B";

}