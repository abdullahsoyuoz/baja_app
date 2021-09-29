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

import 'package:baja_app/rest/entity/widget/baja_express_entity.dart';
import 'package:baja_app/rest/response_models/base_response.dart';
import 'package:baja_app/rest/response_models/ok_response.dart';
import 'package:baja_app/rest/service/home_widget_service.dart';
import 'package:flutter/material.dart';

class BajaExpressProvider with ChangeNotifier {

  List<BajaExpressEntity>  _bajaExpressProductList = new List();


  List<BajaExpressEntity> get bajaExpressProductList => _bajaExpressProductList;

  set bajaExpressProductList(List<BajaExpressEntity> value) {
    _bajaExpressProductList = value;
  }

  getBajaExpressProductController() async {
    bajaExpressProductList.clear();
    BaseResponse response = await HomeWidgetService.operations().bajaExpressWidget();
    try{
      if (response is OkResponse) {
        if (response.body != null) {
          if (response.body["items"] != null) {
            List<dynamic> dataList = response.body["items"];
            List<BajaExpressEntity> newDataList = new List();
            for (var dataStr in dataList) {
              BajaExpressEntity model = new BajaExpressEntity.fromJson(dataStr);
              if (model != null) {
                newDataList.add(model);
              }
            }
            bajaExpressProductList.addAll(newDataList);
            notifyListeners();
          }
        }
      }
    }catch(e){
      print('Exception Baja Express List Data -- $e');
    }
  }
}
