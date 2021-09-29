/*
 *  DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 *  Copyright (C) 2021 Rich Design - All Rights Reserved
 *  Unauthorized copying of this file, via any medium is strictly prohibited
 *  Proprietary and confidential.
 *
 *  Written by Yakup Zengin <yakup@designsrich.com>, March 2021
 *
 */

import 'package:baja_app/rest/entity/register_entity.dart';
import 'package:baja_app/rest/entity/login_entity.dart';
import 'package:baja_app/Constants/app_configurations.dart' as settingRepo;
import 'package:baja_app/rest/entity/widget/best_sellers_entity.dart';
import 'package:baja_app/rest/response_models/base_response.dart';

import '../get_request.dart';
import '../post_request.dart';
import 'crud_service.dart';

class HomeWidgetService extends CrudService<BestSellerEntity>{

  static HomeWidgetService operations(){
    return new HomeWidgetService();
  }

  // TODO LIST TO TRUE
  // TODO MAP TO FALSE

  bool listTo = true;
  bool mapTo = false;

  Future<BaseResponse> occasionsWidget() async {
    return await getRequest("$apiURL/widgets/occasions",listTo);
  }

  Future<BaseResponse> moodTodayWidget() async {
    return await getRequest("$apiURL/widgets/mood-today",listTo);
  }

  Future<BaseResponse> bajaExpressWidget() async {
    return await getRequest("$apiURL/widgets/baja-express",mapTo);
  }

  Future<BaseResponse> bestSellerWidget() async {
    return await getRequest("$apiURL/widgets/best-sellers",mapTo);
  }

  Future<BaseResponse> promotionWdiget() async {
    return await getRequest("$apiURL/widgets/promotion",listTo);
  }

  Future<BaseResponse> todaysTasteWidget() async {
    return await getRequest("$apiURL/widgets/todays-taste",listTo);
  }

  Future<BaseResponse> sideCategoryWidget() async {
    return await getRequest("$apiURL/widgets/side-category",listTo);
  }

  Future<BaseResponse> shoppingCategory() async {
    return await getRequest("$apiURL/widgets/shopping-category",listTo);
  }


}